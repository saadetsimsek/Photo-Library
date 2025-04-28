//
//  TabBarViewPresenter.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 28/04/2025.
//

import UIKit

protocol TabBarViewPresenterProtocol: AnyObject {
    init(view: TabBarViewControllerProtocol)
    func buildTabBar()
}

class TabBarViewPresenter {

    weak var view: TabBarViewControllerProtocol?
    
    required init(view: any TabBarViewControllerProtocol) {
        self.view = view
        self.buildTabBar()
    }
    
}

extension TabBarViewPresenter: TabBarViewPresenterProtocol {
    
    func buildTabBar() {
        self.view?.setControllers(controllers: [])
    }
    
    
}
