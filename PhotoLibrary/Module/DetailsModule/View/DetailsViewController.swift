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
    
 
    lazy var backAction = UIAction { [weak self] _ in
        print("tapped")
        self?.navigationController?.popViewController(animated: true)
    }
    
    lazy var menuAction = UIAction { [weak self] _ in
        print("menu")
    }
    
    lazy var navigationHeader : NavigationHeader = {
        NavigationHeader(backAction: backAction,
                         menuAction: menuAction,
                         date: presenter.item?.date ?? Date())
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        view.backgroundColor = .systemGray
        view.addSubview(topMenuView)
        setupPageHeader()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupPageHeader() {
        let heraderView = navigationHeader.getNavigationHeader(type: .back)
        heraderView.frame.origin.y = UIApplication.topSafeArea
        view.addSubview(heraderView)
    }
}

extension DetailsViewController: DetailViewControllerProtocol {
    
}
