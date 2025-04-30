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
        collection.dataSource = self
        collection.delegate = self
        collection.alwaysBounceVertical = true
        collection.register(MainPostCollectionViewCell.self, forCellWithReuseIdentifier: MainPostCollectionViewCell.identifier)
        collection.register(MainPostHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MainPostHeaderCollectionReusableView.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray
        view.addSubview(collectionView)
    
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
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
        cell.backgroundColor = .systemPink
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        return CGSize(width: width,
                      height: 200)
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
    
}
