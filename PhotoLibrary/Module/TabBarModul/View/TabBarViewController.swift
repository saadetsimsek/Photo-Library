//
//  TabBarViewController.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 28/04/2025.
//

import UIKit

protocol TabBarViewControllerProtocol: AnyObject {
    func setControllers(controllers: [UIViewController])
}

class TabBarViewController: UITabBarController {
    
    var presenter: TabBarViewPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue
    }
    
}

extension TabBarViewController: TabBarViewControllerProtocol {
    func setControllers(controllers: [UIViewController]) {
        self.setViewControllers(controllers, animated: true)
    }
    
    
}
