//
//  Builder.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 07/04/2025.
//

import UIKit

protocol BuilderProtocol {
    static func getPassCodeController() -> UIViewController
    
}

class Builder: BuilderProtocol {
    
    static func getPassCodeController() -> UIViewController{
        let passcodeView = PasscodeViewController()
        let presenter = PasscodePresenter(view: passcodeView, codeState: .inputPasscode)
        passcodeView.passcodePresenter = presenter
        return passcodeView
    }
}
