//
//  UserDefaultsOrganizer.swift
//  Definex
//
//  Created by Murat Çiçek on 27.07.2023.
//

import Foundation

enum UserDefaultsOrganizer {
    static let token = UserDefaultsUnityManager<String>(key: .TOKEN)
}
