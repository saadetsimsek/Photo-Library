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
        $0.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
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
            case 0:
                return self?.createPhotoSection()
            case 1:
                return self?.createTagSection()
            case 2, 3:
                return self?.createDescriptionSection()
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
                                                        bottom: 30,
                                                        trailing: 30)
        return section
        
    }
    
    private func createTagSection() -> NSCollectionLayoutSection {
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(110),
                                               heightDimension: .estimated(10))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [.init(layoutSize: groupSize)])
        group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(10),
                                                          top: nil,
                                                          trailing: .fixed(0),
                                                          bottom: nil)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                        leading: 30,
                                                        bottom: 20,
                                                        trailing: 30)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    private func createDescriptionSection() -> NSCollectionLayoutSection {
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [.init(layoutSize: groupSize)])
        
        group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: nil,
                                                          top: nil,
                                                          trailing: nil,
                                                          bottom: .fixed(10))
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20,
                                                        leading: 30,
                                                        bottom: 0,
                                                        trailing: 30)
        section.orthogonalScrollingBehavior = .continuous
        return section
        
        
    }
    
    private func createCommentTextFieldSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 30,
                                                        leading: 30,
                                                        bottom: 60,
                                                        trailing: 30)
        return section
    }
}

extension DetailsViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return presenter.item?.photos.count ?? 0
        case 1:
            return presenter.item?.tag?.count ?? 0
        case 2:
            return 1
        case 3:
            return 3//presenter.item?.comments?.count ?? 0
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = presenter.item
       
        switch indexPath.section {
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.identifier, for: indexPath) as? TagCollectionViewCell else {  return UICollectionViewCell() }
            let tagText = item?.tag?[indexPath.item] ?? ""
            cell.cellConfigure(tagText: tagText)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) 
            cell.backgroundColor = .red
            return cell
        }
    }
}
