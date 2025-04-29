//
//  SceneDelegate.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 29/03/2025.
//

import UIKit

protocol SceneDelegateProtocol {
    func startMainScreen()
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    private var keychainManager = KeychainManager()


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let vc = Builder.createTabBarController()//Builder.getPassCodeController(codeState: checkIssetPasscode(), sceneDelegate: self)
        window.rootViewController = UINavigationController(rootViewController: vc)
        window.makeKeyAndVisible()
        self.window = window
    }
    
    //application wake run
    private func checkIssetPasscode() -> PasscodeState {
        let keychainPasscodeResult = keychainManager.load(key: KeychainKeys.passcode.rawValue)
        switch keychainPasscodeResult {
        case .success(let code):
            return code.isEmpty ?  .setNewPasscode : .inputPasscode
        case .failure:
            return .setNewPasscode
        }
    }

}

extension SceneDelegate: SceneDelegateProtocol {
    func startMainScreen() {
        self.window?.rootViewController = Builder.createTabBarController()
    }
    
    
}
