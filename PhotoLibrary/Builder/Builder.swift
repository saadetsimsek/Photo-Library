//
//  Builder.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 07/04/2025.
//

import UIKit

protocol BuilderProtocol {
    static func getPassCodeController(codeState: PasscodeState, sceneDelegate: SceneDelegateProtocol) -> UIViewController
    static func createTabBarController() -> UIViewController
    
    //vc
    static func createMainScreenController() -> UIViewController
    static func createCameraController() -> UIViewController
    static func createFavoriteScreenController() -> UIViewController
}

class Builder: BuilderProtocol {
  
    static func getPassCodeController(codeState: PasscodeState, sceneDelegate: SceneDelegateProtocol) -> UIViewController{
        let passcodeView = PasscodeViewController()
        let keychainManager = KeychainManager()
        
        let presenter = PasscodePresenter(view: passcodeView, codeState: codeState, keychainManager: keychainManager, sceneDelegate: sceneDelegate) // paramatreden gelenleri kullan
        passcodeView.passcodePresenter = presenter
        return passcodeView
    }
    
    static func createTabBarController() -> UIViewController {
        let tabBarView = TabBarViewController()
        let presenter = TabBarViewPresenter(view: tabBarView)
        tabBarView.presenter = presenter
        return tabBarView
    }
    
    static func createMainScreenController() -> UIViewController {
        let mainView = MainScreenViewController()
        let presenter = MainScreenPresenter(view: mainView)
        mainView.presenter = presenter
        return mainView
    }
    
    static func createCameraController() -> UIViewController {
        let cameraView = CameraViewController()
        return cameraView
    }
    
    static func createFavoriteScreenController() -> UIViewController {
        let favoriteView = FavoriteViewController()
        return favoriteView
    }
}
