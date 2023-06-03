//
//  Master.swift
//  LookLabApp
//
//  Created by Egor Kruglov on 03.06.2023.
//

import Foundation

struct Master {
    let fullName: String
    let typeOfMaster: String
    let experience: String
    let phone: String
    let masterImageName: String
    let pricePerService: String
    let workingDays: [String]
    let workingHours: [String]
    
    static func getMasters() -> [Master] {
        var masters: [Master] = []
        
        var mastersNames = DataStore.shared.mastersNames.shuffled()
        var typeOfMaster = DataStore.shared.typeOfMaster
        var mastersExpertises = DataStore.shared.mastersExpertises
        var mastersImagesNames = DataStore.shared.mastersImagesNames.shuffled()
        var mastersPhones = DataStore.shared.mastersPhones.shuffled()
        var mastersWorkingDays = DataStore.shared.mastersWorkingDays.shuffled()
        var masterWorkingHours = DataStore.shared.mastersWorkingHours.shuffled()
        
        for _ in mastersNames {
            let masterName = mastersNames.removeFirst()
            
            let typeOfMaster = typeOfMaster.randomElement() ?? "Handyman"
            
            let masterExpertise = mastersExpertises.randomElement()
            var experience: String {
                switch masterExpertise {
                case let .trainee(Expertise: expertise, price: _):
                    return expertise
                case let .master(Expertise: expertise, price: _):
                    return expertise
                case let .expert(Expertise: expertise, price: _):
                    return expertise
                default:
                    return "God"
                }
            }
            
            var pricePerService: String {
                switch masterExpertise {
                case let .trainee(Expertise: _, price: price):
                    return price
                case let .master(Expertise: _, price: price):
                    return price
                case let .expert(Expertise: _, price: price):
                    return price
                default:
                    return "On the house..."
                }
            }
            
            let phone = mastersPhones.removeFirst()
            
            let image = mastersImagesNames.removeFirst()
            
            var workingDays: [String] = []
            var particularMasterWorkingDays = mastersWorkingDays.shuffled()
            for _ in 1...3 {
                workingDays.append(particularMasterWorkingDays.removeFirst())
            }
            workingDays.sort()
            
            var workingHours: [String] = []
            var particularMasterWorkingHours = masterWorkingHours.shuffled()
            for _ in 1...3 {
                workingHours.append(particularMasterWorkingHours.removeFirst())
            }
            workingHours.sort()
            
            let master = Master(
                fullName: masterName,
                typeOfMaster: typeOfMaster,
                experience: experience,
                phone: phone,
                masterImageName: image,
                pricePerService: pricePerService,
                workingDays: workingDays,
                workingHours: workingHours
            )
            masters.append(master)
        }
        
        
        return masters
    }
}
