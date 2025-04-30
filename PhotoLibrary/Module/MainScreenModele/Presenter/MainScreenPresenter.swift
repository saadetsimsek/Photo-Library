//
//  MainScreenPresenter.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 28/04/2025.
//

import UIKit

protocol MainScreenPresenterProtocol: AnyObject {
    init(view: MainScreenViewControllerProtocol)
    var posts: [PostDate]? { get set }
    func getPosts()
}

class MainScreenPresenter {
    
    weak var view: MainScreenViewControllerProtocol?
    
    var posts: [PostDate]?
    
    required init(view: MainScreenViewControllerProtocol) {
        self.view = view
        getPosts()
    }
}

extension MainScreenPresenter: MainScreenPresenterProtocol {
    
    func getPosts() {
        self.posts = PostDate.getMockData()
        view?.showPosts()
    }
    
    
}
