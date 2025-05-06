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
    
    private var menuViewHeight = UIApplication.topSafeArea + 80
    
    lazy var topMenuView: UIView = {
        $0.frame = CGRect(x: 0,
                          y: 0,
                          width: view.bounds.width,
                          height: menuViewHeight)
        $0.backgroundColor = .systemGray
        return $0
    }(UIView())

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        view.backgroundColor = .systemGray
        view.addSubview(topMenuView)

    }
}

extension DetailsViewController: DetailViewControllerProtocol {
    
}
