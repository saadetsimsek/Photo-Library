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
        let presenter = FavoritePresenter(view: favoriteView )
        favoriteView.presenter = presenter
        return UINavigationController(rootViewController: favoriteView)
    }
    
    static func createDetailsController(item: PostItemModel) -> UIViewController {
        let detailView = DetailsViewController()
        let presenter = DetailViewPresenter(view: detailView, item: item)
        detailView.presenter = presenter
        return detailView
    }
    
    static func createPhotoViewController(image: UIImage?) -> UIViewController {
        let photoView = PhotoViewViewController()
        let presenter = PhotoViewPresenter(view: photoView, image: image)
        photoView.presenter = presenter
        return photoView
    }
}
