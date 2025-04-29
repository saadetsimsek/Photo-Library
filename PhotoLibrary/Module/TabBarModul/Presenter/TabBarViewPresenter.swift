//
//  TabBarViewPresenter.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 28/04/2025.
//

import UIKit

protocol TabBarViewPresenterProtocol: AnyObject {
    init(view: TabBarViewControllerProtocol)

    var tabs: [UIImage] { get set}
    func buildTabBar()
}

class TabBarViewPresenter {

    weak var view: TabBarViewControllerProtocol?
    
    var tabs: [UIImage] = [.house, .camera, .heart]
    
    
    required init(view: any TabBarViewControllerProtocol) {
        self.view = view
        self.buildTabBar()
    }
    

}

extension TabBarViewPresenter: TabBarViewPresenterProtocol {
    
    func buildTabBar() {
        let mainScreen = Builder.createMainScreenController()
    //    mainScreen.tabBarItem = UITabBarItem(title: "Main", image: UIImage(systemName: "house"), tag: 0)
        let cameraScreen = Builder.createCameraController()
      //  cameraScreen.tabBarItem = UITabBarItem(title: "Camera", image: UIImage(systemName: "camera"), tag: 1)
        let favoriteScreen = Builder.createFavoriteScreenController()
     //   favoriteScreen.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(systemName: "heart"), tag: 2)
        self.view?.setControllers(controllers: [mainScreen, cameraScreen, favoriteScreen])
    }
    
    
}
