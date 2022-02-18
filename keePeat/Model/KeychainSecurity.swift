//
//  KeychainSecurity.swift
//  keePeat
//
//  Created by Irene Truchado Mazzoli on 11/01/22.
//

import UIKit

class KeychainSecurity: NSObject {
    
    public func saveUser(_ user: User) throws -> Void {
        guard let passwordData = user.password.data(using: .utf8) else {
            return
        }
        
        // Query to add the desired key
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: user.name,
            kSecValueData as String: passwordData
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        if status != errSecSuccess {
            print ("Error en keychain: ", status)
        }
    }
    
    public func getUser(_ user: User) -> Result<User, KeychainError> {
        // Query to find the desired key
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: user.name,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnAttributes as String: true,
            kSecReturnData as String: true ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        if status == errSecItemNotFound {
            return Result.failure(KeychainError.passwordNotFound)
        }
        
        if status == errSecSuccess {
            guard let existingItem = item as? [String : Any],
                  let passwordData = existingItem[kSecValueData as String] as? Data,
                  let password = String(data: passwordData, encoding: .utf8),
                  let account = existingItem[kSecAttrAccount as String] as? String
            else {
                return Result.failure(KeychainError.malformedData)
            }

            let user = User(named: account, withPassword: password)
            return Result.success(user)
            
        }
        else {
            return Result.failure(KeychainError.unknown(status: status))
        }
    }
    
    public func deleteUser(_ user: User) throws -> Void {
        // Query to find the desired key
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: user.name
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        
        if status != errSecSuccess {
            throw KeychainError.unknown(status: status)
        }
    }
    
    public func modifyUser(_ user: User) throws -> Void
    {
        guard let passwordData = user.password.data(using: .utf8) else {
            return
        }
        
        // Query to find the desired key
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: user.name
        ]
        
        // The key we want to modify
        let fields: [String: Any] = [
            kSecAttrAccount as String: user.name,
            kSecValueData as String: passwordData
        ]
        
        let status = SecItemUpdate(query as CFDictionary, fields as CFDictionary)
        
        if status != errSecSuccess {
            throw KeychainError.unknown(status: status)
        }
    }
}

public enum KeychainError: Error {
    case passwordNotFound
    case malformedData
    case unknown(status: OSStatus)
}

