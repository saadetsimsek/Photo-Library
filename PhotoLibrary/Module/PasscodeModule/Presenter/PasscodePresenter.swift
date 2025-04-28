//
//  PasscodePresenter.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 07/04/2025.
//

import UIKit
import KeychainAccess

protocol PasscodePresenterProtocol: AnyObject {
    var passcode: [Int] {get set}
    var templatePasscode: [Int]? {get set}
    func enterPasscode(number: Int)
    func removeLastItemInPasscode()
    func setNewPasscode()
    func checkPasscode()
    func clearPasscode(state: PasscodeState)
    
    init(view: PasscodeViewControllerProtocol, codeState: PasscodeState, keychainManager: KeychainManagerProtocol)
}

class PasscodePresenter: PasscodePresenterProtocol {
    var templatePasscode: [Int]?
    
    var passcode: [Int] = [] {
        didSet {
            if passcode.count == 4 {
                switch passcodeStatee {
                case .inputPasscode:
                    self.checkPasscode()
                case .setNewPasscode:
                    self.setNewPasscode()
                default:
                    break
                }
            }
        }
    }
    var view: PasscodeViewControllerProtocol
    var passcodeStatee: PasscodeState
    
    var keychainManager: KeychainManagerProtocol
    
    required init(view: any PasscodeViewControllerProtocol, codeState: PasscodeState, keychainManager: KeychainManagerProtocol) {
        self.view = view
        self.passcodeStatee = codeState
        self.passcode = []
        
        self.keychainManager = keychainManager
        
        view.passcodeState(state: .inputPasscode)
        
    }
    
    func enterPasscode(number: Int) {
        if passcode.count < 4 {
            self.passcode.append(number)
            view.enterCode(code: passcode)
        }
    }
    
    func removeLastItemInPasscode() {
        if !passcode.isEmpty {
            self.passcode.removeLast()
            view.enterCode(code: passcode)
        }
    }
    
    func setNewPasscode() {
        if templatePasscode != nil {
            if passcode == templatePasscode! {
                
                let stringPasscode = passcode.map { String($0)}.joined()
                keychainManager.save(key: KeychainKeys.passcode.rawValue, value: stringPasscode)
                print(stringPasscode)
                print("saved")
                //
            }
            else{
                self.view.passcodeState(state: .codeMismatch)
            }
        }
        else {
            templatePasscode = passcode
            self.clearPasscode(state: .repeatPasscode)
        }
    }
    
    func checkPasscode() {
        let keychainPasscodeResult = keychainManager.load(key: KeychainKeys.passcode.rawValue)
        switch keychainPasscodeResult {
        case .success(let code):
            if self.passcode == code.digits {
                print("success")
            }
            else {
                self.clearPasscode(state: .wrongPasscode)
            }
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
    func clearPasscode(state: PasscodeState) {
        self.passcode = []
        self.view.enterCode(code: [])
        view.passcodeState(state: state)
    }
    
   
    
    
}

enum PasscodeState: String { // şifre durumu
    case inputPasscode
    case wrongPasscode
    case setNewPasscode
    case repeatPasscode
    case codeMismatch
    
    func getPasscodeLabel () -> String {
        switch self {
        case .inputPasscode:
            return "Acces"
        case .wrongPasscode:
            return "wrong"
        case .setNewPasscode:
            return "new password"
        case .repeatPasscode:
            return "repeat"
        case .codeMismatch:
            return "mismatch"
        }
    }
    
}
