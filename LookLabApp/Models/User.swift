//
//  User.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import Foundation

struct User {
    
    let personName: String
    let personSurname: String
    let username: String
    let password: String
    
    var fullName: String {
        "\(personName) \(personSurname)"
    }
    
    static func getUsers() -> [User] {
        var users: [User] = []
        
        var names = DataStore.shared.personNames
        var surnames = DataStore.shared.personSurnames
        var usernames = DataStore.shared.usernames
        var passwords = DataStore.shared.passwords
        
        let iterationCount = min(names.count, surnames.count)
        
        for _ in 1...iterationCount {
            let name = names.removeFirst()
            let surname = surnames.removeFirst()
            let username = usernames.removeFirst()
            let password = passwords.removeFirst()
            
            let user = User(personName: name,
                            personSurname: surname,
                            username: username,
                            password: password)
            users.append(user)
        }
        
        return users
    }
    
}
