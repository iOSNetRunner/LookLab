//
//  TabBarController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    //MARK: - Private properties
    var masters = Master.getMasters()
    var appointments: [Appointment] = []

    //MARK: - View life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        transferData()
        delegate = self
    }
    
    //MARK: - Private Methods
    private func transferData() {
        guard let viewControllers else { return }
        
        for viewController in viewControllers {
            if let navigationVC = viewController as? UINavigationController {
                if let masterListVC = navigationVC.topViewController as? MasterListViewController {
                    masterListVC.masters = masters
                } else if let applyForServiceVC = navigationVC.topViewController as? ApplyForServiceTableViewController {
                    applyForServiceVC.masters = masters
                }
            }
        }
    }
}

//MARK: - Protocols
protocol ConfirmationViewControllerDelegate: AnyObject {
    func addAppointmetToAppointments(_ appointment: Appointment)
    func removeSesionOptionFrom(_ master: Master, on date: String, at hour: String)
}

protocol AccountViewControllerDelegate: AnyObject {
    func removeAppointmetFromAppointments(_ appointment: Appointment)
    func addSesionOptionFor(_ master: Master, on date: String, at hour: String)
}

//MARK: - AccountViewControllerDelegate
extension TabBarController: AccountViewControllerDelegate {
    func removeAppointmetFromAppointments(_ appointment: Appointment) {
        guard let appointmentIndex = appointments.firstIndex(where: {
            $0.master.fullName == appointment.master.fullName
            && $0.dateAndHour == appointment.dateAndHour}) else { return }
        
        appointments.remove(at: appointmentIndex)
        }
    
    func addSesionOptionFor(_ master: Master, on date: String, at hour: String) {
        if masters.contains(where: { $0.fullName == master.fullName }) {
            guard let masterIndexInMastersDB = masters
                .firstIndex(where: { $0.fullName == master.fullName }) else { return }
                        
            if masters[masterIndexInMastersDB].sessionOptions.contains(where: { $0.date == date }) {
                guard let dateIndex = masters[masterIndexInMastersDB].sessionOptions
                    .firstIndex(where: { $0.date == date }) else { return }
                
                masters[masterIndexInMastersDB].sessionOptions[dateIndex].hours.append(hour)
                masters[masterIndexInMastersDB].sessionOptions[dateIndex].hours.sort()
            } else {
                masters[masterIndexInMastersDB].sessionOptions.append((date, [hour]))
                masters[masterIndexInMastersDB].sessionOptions.sort { $0.date < $1.date }
            }
        } else {
            let newMaster = Master(fullName: master.fullName,
                                   typeOfMaster: master.typeOfMaster,
                                   experience: master.experience,
                                   phone: master.phone,
                                   masterImageName: master.masterImageName,
                                   pricePerService: master.pricePerService,
                                   sessionOptions: [(date: date, hours: [hour])])

            masters.append(newMaster)
        }
    }
}

//MARK: - ConfirmationViewControllerDelegate
extension TabBarController: ConfirmationViewControllerDelegate {
    func addAppointmetToAppointments(_ appointment: Appointment) {
        appointments.append(appointment)
    }
    
    func removeSesionOptionFrom(_ master: Master, on date: String, at hour: String) {
        let sessionOptions = master.sessionOptions
        
        guard
            let masterIndexInMastersDB = masters.firstIndex(where: { $0.fullName == master.fullName }),
            let dateIndex = sessionOptions.firstIndex(where: { $0.date == date }),
            let hourIndex = sessionOptions[dateIndex].hours.firstIndex(of: hour)
        else { return }
        
        masters[masterIndexInMastersDB].sessionOptions[dateIndex].hours.remove(at: hourIndex)
        
        if masters[masterIndexInMastersDB].sessionOptions[dateIndex].hours.isEmpty {
            masters[masterIndexInMastersDB].sessionOptions.remove(at: dateIndex)
        }
        
        if masters[masterIndexInMastersDB].sessionOptions.isEmpty {
            masters.remove(at: masterIndexInMastersDB)
        }
    }
}

//MARK: - UITabBarControllerDelegate
extension TabBarController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TabBarTransition(viewControllers: tabBarController.viewControllers)
    }
}

//MARK: - TabBarTransition
final class TabBarTransition: NSObject, UIViewControllerAnimatedTransitioning {

    let viewControllers: [UIViewController]?
    let transitionDuration: Double = 0.3

    init(viewControllers: [UIViewController]?) {
        self.viewControllers = viewControllers
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(transitionDuration)
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        guard
            let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let fromView = fromVC.view,
            let fromIndex = getIndex(forViewController: fromVC),
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to),
            let toView = toVC.view,
            let toIndex = getIndex(forViewController: toVC)
            else {
                transitionContext.completeTransition(false)
                return
        }

        let frame = transitionContext.initialFrame(for: fromVC)
        var fromFrameEnd = frame
        var toFrameStart = frame
        fromFrameEnd.origin.x = toIndex > fromIndex ? frame.origin.x - frame.width : frame.origin.x + frame.width
        toFrameStart.origin.x = toIndex > fromIndex ? frame.origin.x + frame.width : frame.origin.x - frame.width
        toView.frame = toFrameStart

        DispatchQueue.main.async {
            transitionContext.containerView.addSubview(toView)
            UIView.animate(withDuration: self.transitionDuration, animations: {
                fromView.frame = fromFrameEnd
                toView.frame = frame
            }, completion: {success in
                fromView.removeFromSuperview()
                transitionContext.completeTransition(success)
            })
        }
    }

    func getIndex(forViewController vc: UIViewController) -> Int? {
        guard let vcs = self.viewControllers else { return nil }
        for (index, thisVC) in vcs.enumerated() {
            if thisVC == vc { return index }
        }
        return nil
    }
}
