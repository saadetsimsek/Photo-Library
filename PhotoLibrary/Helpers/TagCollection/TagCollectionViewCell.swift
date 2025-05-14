//
//  TagCollectionViewCell.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 02/05/2025.
//

import UIKit

protocol TagCollectionViewCellProtocol: AnyObject {
    static var identifier: String { get }
    init(frame: CGRect)
}

class TagCollectionViewCell: UICollectionViewCell {
 
    static let identifier = "TagCollectionViewCell"
    
    lazy var tagView: UIView = {
        .configure(view: $0) {[weak self] tagView in
            guard let self = self else { return }
            tagView.backgroundColor = UIColor(white: 1, alpha: 0.2)
            tagView.layer.cornerRadius = 15
            tagView.addSubview(self.tagLabel)
        }
    }(UIView())
    
    lazy var tagLabel: UILabel = {
        .configure(view: $0) { label in
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 14)
        }
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tagView)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            tagView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tagView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tagView.topAnchor.constraint(equalTo: topAnchor),
            tagView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            tagLabel.topAnchor.constraint(equalTo: tagView.topAnchor, constant: 5),
            tagLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tagLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tagLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        ])
    }
    
    func cellConfigure(tagText: String){
        self.tagLabel.text = tagText
    }
    
}
