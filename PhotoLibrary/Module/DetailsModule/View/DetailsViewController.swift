//
//  DetailsViewController.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 06/05/2025.
//

import UIKit

protocol DetailViewControllerProtocol: AnyObject {
 
}

class DetailsViewController: UIViewController {
    
    var presenter : DetailViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension DetailsViewController: DetailViewControllerProtocol {
    
}
