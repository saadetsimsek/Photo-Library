//
//  Builder.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 07/04/2025.
//

import UIKit

protocol BuilderProtocol {
    static func getPassCodeController(codeState: PasscodeState) -> UIViewController
    static func createTabBarController() -> UIViewController
}

class Builder: BuilderProtocol {
  
    static func getPassCodeController(codeState: PasscodeState) -> UIViewController{
        let passcodeView = PasscodeViewController()
        let keychainManager = KeychainManager()
        
        let presenter = PasscodePresenter(view: passcodeView, codeState: codeState, keychainManager: keychainManager) // paramatreden gelenleri kullan
        passcodeView.passcodePresenter = presenter
        return passcodeView
    }
    
    static func createTabBarController() -> UIViewController {
        let tabBarView = TabBarViewController()
        let presenter = TabBarViewPresenter(view: tabBarView)
        tabBarView.presenter = presenter
        
        return tabBarView
    }
}
