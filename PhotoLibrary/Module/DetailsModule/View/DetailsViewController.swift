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
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isUserInteractionEnabled = false
        return $0
    }(UIView())
    
 
    lazy var backAction = UIAction { [weak self] _ in
        print("tapped")
        self?.navigationController?.popViewController(animated: true)
    }
    
    lazy var menuAction = UIAction { [weak self] _ in
        print("menu")
    }
    
    lazy var navigationHeaderr : NavigationHeader = {
        NavigationHeader(backAction: backAction,
                         menuAction: menuAction,
                         date: presenter.item?.date ?? Date())
    }()
    
    private lazy var headerView: UIView = {
        navigationHeaderr.getNavigationHeader(type: .back)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        view.backgroundColor = .systemGray
        view.addSubview(topMenuView)
        view.addSubview(headerView)
        setupConstraints()
       

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            topMenuView.topAnchor.constraint(equalTo: view.topAnchor),
            topMenuView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topMenuView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topMenuView.heightAnchor.constraint(equalToConstant: menuViewHeight),
            
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            headerView.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
  
}

extension DetailsViewController: DetailViewControllerProtocol {
    
}
