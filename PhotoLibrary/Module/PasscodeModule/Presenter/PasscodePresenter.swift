//
//  PasscodePresenter.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 07/04/2025.
//

import UIKit

protocol PasscodePresenterProtocol: AnyObject {
    var passcode: [Int] {get set}
    
    func enterPasscode(number: Int)
    func removeLastItemInPasscode()
    func setNewPasscode()
    func checkPasscode()
    func clearPasscode(state: PasscodeState)
    
    init(view: PasscodeViewControllerProtocol, codeState: PasscodeState)
}

class PasscodePresenter: PasscodePresenterProtocol {
    var passcode: [Int]
    var view: PasscodeViewControllerProtocol
    var passcodeStatee: PasscodeState
    
    func enterPasscode(number: Int) {
        
    }
    
    func removeLastItemInPasscode() {
        
    }
    
    func setNewPasscode() {
        
    }
    
    func checkPasscode() {
        
    }
    
    func clearPasscode(state: PasscodeState) {
        
    }
    
    required init(view: any PasscodeViewControllerProtocol, codeState: PasscodeState) {
        self.view = view
        self.passcodeStatee = codeState
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
