//
//  DetailViewPresenter.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 06/05/2025.
//

import UIKit

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewControllerProtocol, item: PostItemModel)
    var item : PostItemModel? { get }
    func getPosts()
}

class DetailViewPresenter {
    
    private weak var view: DetailViewControllerProtocol?
    
    var item: PostItemModel?
    
    required init(view: DetailViewControllerProtocol, item: PostItemModel) {
        self.view = view
        self.item = item
    }
    
}

extension DetailViewPresenter: DetailViewPresenterProtocol {
   
    
    func getPosts() {
        
    }
    
  
    
  
    
    
    
}
