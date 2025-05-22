//
//  PhotoViewPresenter.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 22/05/2025.
//

import UIKit

protocol PhotoViewPresenterProtocol: AnyObject{
    init(view: PhotoViewControllerProtocol, image: UIImage?)
    var image: UIImage? { get set }
}

class PhotoViewPresenter {
    var image: UIImage?
    private weak var view: PhotoViewControllerProtocol?
    
    required init(view: any PhotoViewControllerProtocol, image: UIImage?) {
        self.image = image
        self.view = view
    }
}

extension PhotoViewPresenter: PhotoViewPresenterProtocol{
    
    
}
