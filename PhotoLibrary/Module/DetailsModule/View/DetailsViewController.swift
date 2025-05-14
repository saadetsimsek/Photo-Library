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
    
    lazy var navigationHeaderr : NavigationHeader = {
        NavigationHeader(backAction: backAction,
                         menuAction: menuAction,
                         date: presenter.item?.date ?? Date())
    }()
    
    private lazy var headerView: UIView = {
        navigationHeaderr.getNavigationHeader(type: .back)
        
    }()
    
    lazy var backAction = UIAction { [weak self] _ in
        print("tapped")
        self?.navigationController?.popViewController(animated: true)
    }
    
    lazy var menuAction = UIAction { [weak self] _ in
        print("menu")
    }
    
    private lazy var collectionView: UICollectionView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .none
        $0.contentInset = UIEdgeInsets(top: 80,
                                       left: 0,
                                       bottom: 100,
                                       right: 0)
        $0.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        $0.dataSource = self
        return $0
    }(UICollectionView(frame: view.bounds, collectionViewLayout: getCompositionalLayout()))

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        view.backgroundColor = .systemGray
        view.addSubview(collectionView)
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

extension DetailsViewController {
    private func getCompositionalLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout{ [weak self] section, _ in
            switch section {
            default:
                return self?.createPhotoSection()
            }
        }
    }
   
    private func createPhotoSection() -> NSCollectionLayoutSection {
        //item (size)
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                     leading: 0,
                                                     bottom: 0,
                                                     trailing: 30)
        
        //group (size) + item
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8),
                                               heightDimension: .fractionalHeight(0.7))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        //section + group
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                        leading: 30,
                                                        bottom: 10,
                                                        trailing: 30)
        return section
        
    }
}

extension DetailsViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return presenter.item?.photos.count ?? 0
   /*     case 1:
            return presenter.item?.tag?.count ?? 0
        case 2, 4, 5:
            return 1
        case 3:
            return presenter.item?.comments?.count ?? 0 */
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}
