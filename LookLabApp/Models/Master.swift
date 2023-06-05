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
    let sessionOptions: [(date: String, hours: [String])]
    
    static func getMasters() -> [Master] {
        var masters: [Master] = []
        
        let mastersNames = DataStore.shared.mastersNames.shuffled()
        let typeOfMaster = DataStore.shared.typeOfMaster.shuffled()
        let mastersExpertises = DataStore.shared.mastersExpertises.shuffled()
        var mastersImagesNames = DataStore.shared.mastersImagesNames.shuffled()
        var mastersPhones = DataStore.shared.mastersPhones.shuffled()
        let mastersWorkingDates = DataStore.shared.mastersWorkingDates.shuffled()
        let masterWorkingHours = DataStore.shared.mastersWorkingHours.shuffled()
        
        for masterName in mastersNames {
            let masterName = masterName
            
            let typeOfMaster = typeOfMaster.randomElement() ?? "Handyman"
            
            let masterExpertise = mastersExpertises.randomElement()
            
            var experience = ""
            
            var pricePerService = ""
            
            switch masterExpertise {
            case let .trainee(Expertise: expertise, price: price):
                experience = expertise
                pricePerService = price
            case let .master(Expertise: expertise, price: price):
                experience = expertise
                pricePerService = price
            case let .expert(Expertise: expertise, price: price):
                experience = expertise
                pricePerService = price
            default:
                experience = "God"
                pricePerService = "On the house.."
            }
            
            let phone = mastersPhones.removeFirst()
            
            let image = mastersImagesNames.removeFirst()
            
            var sessionOptions: [(date: String, hours: [String])] = []
            
            var particularWorkingDates = mastersWorkingDates
            
            var particularWorkingHours = masterWorkingHours
            
            for _ in 1...3 {
                
                let date = particularWorkingDates.removeFirst()
                var hours: [String] = []
                
                for _ in 1...3 {
                    let windowHours = particularWorkingHours.removeFirst()
                    hours.append(windowHours)
                }
                hours.sort()
                let sessionOption = (date, hours)
                sessionOptions.append(sessionOption)
            }
            sessionOptions.sort { $0.date < $1.date }
            
            let master = Master(
                fullName: masterName,
                typeOfMaster: typeOfMaster,
                experience: experience,
                phone: phone,
                masterImageName: image,
                pricePerService: pricePerService,
                sessionOptions: sessionOptions
            )
            masters.append(master)
        }
        
        return masters
    }
}
