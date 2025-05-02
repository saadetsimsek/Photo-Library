//
//  TagCollectionView.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 01/05/2025.
//

import UIKit

protocol TagCollectionViewProtocol: AnyObject {
    var dataSource: UICollectionViewDataSource? { get set }
    init (dataSource: UICollectionViewDataSource)
    
    func getCollectionView() -> UICollectionView
}

class TagCollectionView {
    
    required init(dataSource: UICollectionViewDataSource) {
        self.dataSource = dataSource
    }
}
   
extension TagCollectionView: TagCollectionViewProtocol {
    var dataSource: (any UICollectionViewDataSource)? {
        get {
            <#code#>
        }
        set {
            <#code#>
        }
    }
    
    func getCollectionView() -> UICollectionView {
        return {
            .configure(view: $0) {[weak self] collection in
                guard let self = self else { return }
                let layout = collection.collectionViewLayout as! UICollectionViewFlowLayout
                layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
                layout.scrollDirection = .horizontal
                layout.sectionInset = UIEdgeInsets(top: 0,
                                                   left: 20,
                                                   bottom: 0,
                                                   right: 20)
                collection.alwaysBounceHorizontal = false
                collection.showsHorizontalScrollIndicator = false
                collection.dataSource = self.dataSource
                collection.backgroundColor = .clear
                collection.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
                
            }
        }(UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()))
    }
    
    
}

