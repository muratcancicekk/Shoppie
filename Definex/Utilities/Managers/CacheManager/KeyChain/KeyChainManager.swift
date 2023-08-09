//
//  KeyChainManager.swift
//  Definex
//
//  Created by Murat Çiçek on 9.08.2023.
//

import Foundation
import Security

enum KeyChainServices: String {
    case definexCase = "definexCase.Definex"
}

struct KeychainManager {
    static func saveData(_ data: String, forAccount account: String, service: String) -> Bool {
        guard let dataToSave = data.data(using: .utf8) else {
            return false
        }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecValueData as String: dataToSave
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        return status == errSecSuccess
    }
    
    static func getData(forAccount account: String, service: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnAttributes as String: true,
            kSecReturnData as String: true
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        if status == errSecSuccess, let existingItem = item as? [String: Any],
           let data = existingItem[kSecValueData as String] as? Data,
           let stringValue = String(data: data, encoding: .utf8) {
            return stringValue
        } else {
            return nil
        }
    }
    
    static func deleteData(forAccount account: String, service: String) -> Bool {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        return status == errSecSuccess
    }
}
