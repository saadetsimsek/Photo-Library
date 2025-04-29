//
//  MainScreenViewController.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 28/04/2025.
//

import UIKit

protocol MainScreenViewControllerProtocol: AnyObject {
    func showPosts()
}

class MainScreenViewController: UIViewController {

    weak var presenter: MainScreenPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    


}

extension MainScreenViewController: MainScreenViewControllerProtocol {
    func showPosts() {
        
    }
    
    
}
