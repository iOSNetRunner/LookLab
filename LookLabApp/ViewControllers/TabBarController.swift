//
//  TabBarController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    var masters = Master.getMasters() // aka MastersDB
    
    var appointments: [Appointment] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        transferData()
        delegate = self
    }
        
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

protocol ConfirmationViewControllerDelegate: AnyObject {
    func addAppointmetToAppointments(_ appointment: Appointment)
    func removeSesionOptionFrom(_ master: Master, on date: String, at hour: String)
}

protocol AccountViewControllerDelegate: AnyObject {
    func removeAppointmetFromAppointments(_ appointment: Appointment)
    func addSesionOptionFor(_ master: Master, on date: String, at hour: String)
}

extension TabBarController: AccountViewControllerDelegate {
    func removeAppointmetFromAppointments(_ appointment: Appointment) {
        guard let appointmentIndex = appointments.firstIndex(where: {
            $0.master.fullName == appointment.master.fullName
            && $0.dateAndHour == appointment.dateAndHour}) else { return }
        
        print("old appointments:")
        appointments.forEach { print($0.master.fullName, $0.dateAndHour.date, $0.dateAndHour.hour, separator: " ") }
        
        appointments.remove(at: appointmentIndex)
        print("new appointments:")
        
        appointments.forEach { print($0.master.fullName, $0.dateAndHour.date, $0.dateAndHour.hour, separator: " ") }

    }
    
    func addSesionOptionFor(_ master: Master, on date: String, at hour: String) {
        if masters.contains(where: { $0.fullName == master.fullName }) {
            guard let masterIndexInMastersDB = masters.firstIndex(where: { $0.fullName == master.fullName }) else { return }
            print("Master: \(master.fullName) found in DB. Index in masters: \(masterIndexInMastersDB)")
                        
            if masters[masterIndexInMastersDB].sessionOptions.contains(where: { $0.date == date }) {
                guard let dateIndex = masters[masterIndexInMastersDB].sessionOptions.firstIndex(where: { $0.date == date }) else { return }
                print("dateIndex: \(dateIndex)")
                
                masters[masterIndexInMastersDB].sessionOptions[dateIndex].hours.append(hour)
                masters[masterIndexInMastersDB].sessionOptions[dateIndex].hours.sort()
                masters[masterIndexInMastersDB].sessionOptions.sort { $0.date < $1.date }
                print("Added option at \(hour) on \(date)")
            } else {
                masters[masterIndexInMastersDB].sessionOptions.append((date, [hour]))
                print("Created session option on \(date) at \(hour)")
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
            guard let masterIndexInMastersDB = masters.firstIndex(where: { $0.fullName == master.fullName }) else { return }
            print("\(newMaster.fullName) was not found in mastersDB. Now added with index in master DB: \(masterIndexInMastersDB)")
        }
        
    }
}

extension TabBarController: ConfirmationViewControllerDelegate {
    func addAppointmetToAppointments(_ appointment: Appointment) {
        appointments.append(appointment)
    }
    
    func removeSesionOptionFrom(_ master: Master, on date: String, at hour: String) {
        let sessionOptions = master.sessionOptions
        
        guard let masterIndexInMastersDB = masters.firstIndex(where: { $0.fullName == master.fullName }) else { return }
        print("masterIndex: \(masterIndexInMastersDB)")
        
        guard let dateIndex = sessionOptions.firstIndex(where: { $0.date == date }) else { return }
        print("dateIndex: \(dateIndex)")
        
        guard let hourIndex = sessionOptions[dateIndex].hours.firstIndex(of: hour) else { return }
        print("hourIndex: \(hourIndex)")
        
        let checkBeforeRemove = masters[masterIndexInMastersDB].sessionOptions[dateIndex].hours
        print("\(masters[masterIndexInMastersDB].fullName) old options for \(date): \(checkBeforeRemove)")
        
        // removing hour from hours
        masters[masterIndexInMastersDB].sessionOptions[dateIndex].hours.remove(at: hourIndex)
        print("Master's session option for \(date) at \(hour) removed")
        
        let checkAfterRemove = masters[masterIndexInMastersDB].sessionOptions[dateIndex].hours
        print("\(masters[masterIndexInMastersDB].fullName) new options for \(date): \(checkAfterRemove)\n")
        
        if masters[masterIndexInMastersDB].sessionOptions[dateIndex].hours.isEmpty {
            masters[masterIndexInMastersDB].sessionOptions.remove(at: dateIndex)
            print("No options left for \(date)\n")
        }
        
        if masters[masterIndexInMastersDB].sessionOptions.isEmpty {
            masters.remove(at: masterIndexInMastersDB)
        }
    }
    
}




extension TabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MyTransition(viewControllers: tabBarController.viewControllers)
    }
}

final class MyTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
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
