//
//  KeychainManager.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 25/04/2025.
//

import Foundation
import KeychainAccess

protocol KeychainManagerProtocol: AnyObject {
    func save(key: String, value: String)
    func load(key: String) -> Result<String, Error>
}

class KeychainManager: KeychainManagerProtocol {
    private let keychain = Keychain(service: "PASSCODE")
    
    func save(key: String, value: String) {
        do{
            try keychain.set(value, key: key)
        }
        catch{
            print("keychain save error \(error)" )
        }
    }
    
    func load(key: String) -> Result<String, any Error> {
        do{
            let passcode = try keychain.getString(key) ?? ""
            return .success(passcode)
        }
        catch {
            return .failure(error)
        }
    }
    

    
}

enum KeychainKeys: String {
    case passcode = "passcode1"
}
