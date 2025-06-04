//
//  CameraPresenter.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 28/04/2025.
//

import UIKit

protocol CameraViewPresenterProtocol: AnyObject {
    init(view: CameraViewControllerProtocol)
    var photos: [UIImage] {get set}
    
    var closeViewAction: UIAction? {get set}
    var switchCamera: UIAction? {get set}
}

class CameraPresenter: CameraViewPresenterProtocol {
    
    private weak var view: CameraViewControllerProtocol?
    
    required init(view: any CameraViewControllerProtocol) {
        self.view = view
    }
    
    var photos: [UIImage] = []
    
    var closeViewAction: UIAction? = UIAction { _ in
        
    }
    
    var switchCamera: UIAction? = UIAction { _ in
        
    }
    
    
}
