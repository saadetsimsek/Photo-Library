//
//  FavoriteViewController.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 28/04/2025.
//

import UIKit

protocol FavoriteViewControllerProtocol: AnyObject {
    func showPost()
}

class FavoriteViewController: UIViewController {
    
    var presenter: FavoriteViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = .lightGray
        
    }
    


}

extension FavoriteViewController: FavoriteViewControllerProtocol {
    func showPost() {
        //
    }
    
    
}
