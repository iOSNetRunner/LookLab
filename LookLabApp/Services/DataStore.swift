//
//  DataStore.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import Foundation

final class DataStore {
    
    static let shared = DataStore()
    
    // users
    let personsNames = [
        "Dmitrii",
        "Egor",
        "Fedor",
        "Roman",
        "123"
    ]
    
    let personsSurnames = [
        "Galatskii",
        "Kruglov",
        "Sozontov",
        "Glavatskii",
        "123"
    ]
    
    let personsImagesNames = [
        "Dmitrii.jpg",
        "Egor.jpg",
        "Fedor.jpg",
        "Roman.jpg",
        "123"
    ]
    
    let usernames = [
        "iOSNetRunner",
        "yegorkruglov",
        "aviation_club",
        "romazan126",
        "123"
    ]
    
    let passwords = [
        "123",
        "123",
        "123",
        "123",
        "123"
    ]
    
    // masters
    let mastersNames = [
        "Keven Reddick",
        "Matthias Warden",
        "Ruby Barrios",
        "Jon Montgomery",
        "Mathew Crum",
        "Diego Hutcheson",
        "Infant Grace",
        "Guadalupe Harder",
        "Keri Turley",
        "Zainab Duarte"
    ]
    
    let typeOfMaster = [
        "Hair Styling",
        "Shaving",
        "Nail Service"
    ]
    
    enum mastersExpertises {
        case trainee (Expertise: String, price: String)
        case master (Expertise: String, price: String)
        case expert (Expertise: String, price: String)
    }
    
    let mastersExpertises = [
        mastersExpertises.trainee(Expertise: "Trainee", price: "1000 RUB"),
        mastersExpertises.master(Expertise: "Master", price: "2000 RUB"),
        mastersExpertises.expert(Expertise: "Expert", price: "3000 RUB"),
    ]
    
    let mastersWorkingDates = [
        "12 June 2023",
        "13 June 2023",
        "14 June 2023",
        "15 June 2023",
        "16 June 2023",
        "17 June 2023",
        "18 June 2023"
    ]
    
    let mastersWorkingHours = [
        "10:00",
        "11:00",
        "12:00",
        "13:00",
        "14:00",
        "15:00",
        "16:00",
        "17:00",
        "18:00",
        "19:00",
        "20:00"
    ]
    
    let mastersPhones = [
        "+7 123 456 78 11",
        "+7 123 456 78 22",
        "+7 123 456 78 33",
        "+7 123 456 78 44",
        "+7 123 456 78 55",
        "+7 123 456 78 66",
        "+7 123 456 78 77",
        "+7 123 456 78 88",
        "+7 123 456 78 99",
        "+7 123 456 78 00"
    ]
    
    let mastersImagesNames = [
        "image1.jpg",
        "image2.jpg",
        "image3.jpg",
        "image4.jpg",
        "image5.jpg",
        "image6.jpg",
        "image7.jpg",
        "image8.jpg",
        "image9.jpg",
        "image10.jpg"
    ]
    
    private init() {}
}
