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
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize =  CGSize(width: view.frame.width - 60,
                                  height: view.frame.height - 60)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 30
        layout.sectionInset = UIEdgeInsets(top: 15,
                                           left: 0,
                                           bottom: 40,
                                           right: 0)
        let collection = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collection.backgroundColor = .clear
        collection.dataSource = self
        collection.delegate = self
        collection.alwaysBounceVertical = true
        collection.register(MainPostCollectionViewCell.self, forCellWithReuseIdentifier: MainPostCollectionViewCell.identifier)
        collection.register(MainPostHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MainPostHeaderCollectionReusableView.identifier)
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray
        view.addSubview(collectionView)
    
    }
    


}

extension MainScreenViewController: MainScreenViewControllerProtocol {
    func showPosts() {
        
    }
    
    
}

extension MainScreenViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
}
