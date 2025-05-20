//
//  DetailsPhotoCollectionViewCell.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 20/05/2025.
//

import UIKit

class DetailsPhotoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DetailsPhotoCollectionViewCell"
    
    lazy var cellImage: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    lazy var imageMenuButton: UIButton = {
        $0.setBackgroundImage(UIImage(systemName: "ellipsis"), for: .normal)
        $0.tintColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 30
        clipsToBounds = true
        addSubview(cellImage)
        cellImage.addSubview(imageMenuButton)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(image: String){
        cellImage.image = UIImage(named: image)
    }
  
    private func setConstraints(){
        NSLayoutConstraint.activate([
            cellImage.topAnchor.constraint(equalTo: topAnchor),
            cellImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageMenuButton.topAnchor.constraint(equalTo: cellImage.topAnchor, constant: 10),
            imageMenuButton.trailingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: -20),
            imageMenuButton.heightAnchor.constraint(equalToConstant: 25),
            imageMenuButton.widthAnchor.constraint(equalToConstant: 25)
            
        ])
    }
    
}
