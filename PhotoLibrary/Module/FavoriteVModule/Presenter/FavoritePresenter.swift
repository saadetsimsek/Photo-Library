//
//  FavoritePresenter.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 28/04/2025.
//

import UIKit

protocol FavoriteViewPresenterProtocol: AnyObject {
    init(view: FavoriteViewControllerProtocol)
    var post: [PostItemModel]? { get set }
    func getPosts()
}

class FavoritePresenter {
    
    private weak var view: FavoriteViewControllerProtocol?
    
    var post: [PostItemModel]? = []
    
    required init(view: FavoriteViewControllerProtocol) {
        self.view = view
        getPosts()
    }
    
}

extension FavoritePresenter: FavoriteViewPresenterProtocol {
    
    func getPosts() {
        self.post = PostItemModel.getMockItems()
        self.view?.showPost()
    }
}
