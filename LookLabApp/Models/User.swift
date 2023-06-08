//
//  User.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

struct User {
    let personName: String
    let personSurname: String
    let personImageName: String
    let username: String
    let password: String
    
    var fullName: String {
        "\(personName) \(personSurname)"
    }
    
    static func getUsers() -> [User] {
        var users: [User] = []
        
        var names = DataStore.shared.personsNames
        var surnames = DataStore.shared.personsSurnames
        var personsImagesNames = DataStore.shared.personsImagesNames
        var usernames = DataStore.shared.usernames
        var passwords = DataStore.shared.passwords
        
        for _ in 1...names.count {
            let name = names.removeFirst()
            let surname = surnames.removeFirst()
            let personImageName = personsImagesNames.removeFirst()
            let username = usernames.removeFirst()
            let password = passwords.removeFirst()
            
            let user = User(personName: name,
                            personSurname: surname,
                            personImageName: personImageName,
                            username: username,
                            password: password)
            users.append(user)
        }
        
        return users
    }
}
