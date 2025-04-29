//
//  MainScreenPresenter.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 28/04/2025.
//

import UIKit

protocol MainScreenPresenterProtocol: AnyObject {
    init(view: MainScreenViewControllerProtocol)
}

class MainScreenPresenter {
    
    weak var view: MainScreenViewControllerProtocol?
    
    required init(view: MainScreenViewControllerProtocol) {
        self.view = view
        
    }
}

extension MainScreenPresenter: MainScreenPresenterProtocol {
    
}
