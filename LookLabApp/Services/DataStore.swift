//
//  DataStore.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import Foundation

final class DataStore {
    
    static let shared = DataStore()
    
    let personNames = [
        "Dmitrii",
        "Egor",
        "Fedor",
        "Roman"
    ]
    
    let personSurnames = [
        "Galatskii",
        "Kruglov",
        "Fedor's surname",
        "Roman's surname"
    ]
    
    let usernames = [
        "iOSNetRunner",
        "yegorkruglov",
        "aviation_club",
        "romazan126"
    ]
    
    let passwords = [
        "123",
        "123",
        "123",
        "123"
    ]
    
    private init() {}
}
