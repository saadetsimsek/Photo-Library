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

    var presenter: MainScreenPresenterProtocol?
    
    private var topInsets: CGFloat = 0
   
    private var menuViewHeight : CGFloat = 0
    
    private lazy var topMenuView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .gray
        $0.addSubview(menuAppName)
        $0.addSubview(settingButton)
        return $0
    }(UIView())
    
    private lazy var menuAppName: UILabel = {
        $0.text = "Photo Library"
        $0.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private lazy var settingButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setBackgroundImage(UIImage(systemName: "gearshape"), for: .normal)
        return $0
    }(UIButton())
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
      //  let screenWidth = UIScreen.main.bounds.width
     //   let screenHeight = UIScreen.main.bounds.height
     //   layout.itemSize = CGSize(width: screenWidth - 60,
     //                            height: screenHeight - 40)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 30
        layout.sectionInset = UIEdgeInsets(top: 15,
                                           left: 0,
                                           bottom: 40,
                                           right: 0)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.contentInset.top = 50
        collection.dataSource = self
        collection.delegate = self
        collection.alwaysBounceVertical = true
        collection.contentInsetAdjustmentBehavior = .never
        collection.register(MainPostCollectionViewCell.self, forCellWithReuseIdentifier: MainPostCollectionViewCell.identifier)
        collection.register(MainPostHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MainPostHeaderCollectionReusableView.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray
        view.addSubview(topMenuView)
        view.addSubview(collectionView)
        
        topInsets = collectionView.adjustedContentInset.top
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        menuViewHeight = UIApplication.topSafeArea + 50
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            topMenuView.topAnchor.constraint(equalTo: view.topAnchor),
            topMenuView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topMenuView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topMenuView.heightAnchor.constraint(equalToConstant: menuViewHeight),
            
            menuAppName.leadingAnchor.constraint(equalTo: topMenuView.leadingAnchor, constant: 20),
            menuAppName.bottomAnchor.constraint(equalTo: topMenuView.bottomAnchor, constant: -20),
            
            settingButton.trailingAnchor.constraint(equalTo: topMenuView.trailingAnchor, constant: -20),
            settingButton.centerYAnchor.constraint(equalTo: menuAppName.centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topMenuView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }


}

extension MainScreenViewController: MainScreenViewControllerProtocol {
    func showPosts() {
        collectionView.reloadData()
    }
    
    
}

extension MainScreenViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.presenter?.posts?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter?.posts?[section].items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPostCollectionViewCell.identifier, for: indexPath) as? MainPostCollectionViewCell
        else { return UICollectionViewCell()}
        if let item = presenter?.posts?[indexPath.section].items[indexPath.row] {
            cell.configureCell(item: item)
        }
        cell.backgroundColor = .systemPink
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        return CGSize(width: width,
                      height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                           withReuseIdentifier: MainPostHeaderCollectionReusableView.identifier, for: indexPath) as? MainPostHeaderCollectionReusableView else {
            return UICollectionReusableView()
        }
        if let date = presenter?.posts?[indexPath.section].date.getDateDiference() {
            header.setHeaderText(header: date)
        }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: view.frame.width - 60,
               height: 40)
    }
    
    //tap title uprising did scroll
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let menuTopPosition = scrollView.contentOffset.y + topInsets
        
        if menuTopPosition < 50, menuTopPosition > 0 {
            topMenuView.frame.origin.y = -menuTopPosition
            let fontSize = 30 - menuTopPosition * 0.2
            self.menuAppName.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        //   self.view.layoutIfNeeded() // push to reload
        }
    }
    
}
