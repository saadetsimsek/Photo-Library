//
//  MainPostCollectionViewCell.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 30/04/2025.
//

import UIKit

class MainPostCollectionViewCell: UICollectionViewCell {
 
    static let identifier = "MainPostCollectionViewCell"
    
    private var tags: [String] = []
    
    private var tagCollectionView: UICollectionView!
    
    private var photoCountLabel = UILabel()
    private var commentCountLabel = UILabel()
    private var postDescriptionLabel = UILabel()
    
    lazy var postImage: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        
        return $0
    }(UIImageView(frame: bounds))
    
    lazy var countLabelStack: UIStackView = {
        .configure(view: $0) { stack in
            stack.axis = .horizontal
            stack.spacing = 20
        }
    }(UIStackView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        viewConfiguration()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    private func viewConfiguration(){
        addSubview(postImage)
        layer.cornerRadius = 10
        clipsToBounds = true
        
        setViewGradient(frame: bounds,
                        startPoint: CGPoint(x: 0.5, y: 1),
                        endPoint: CGPoint(x: 0.5, y: 0.5),
                        colors: [.black, .clear],
                        location: [0,1])
    }
    
    func configureCell(item: PostItemModel){
        postImage.image = UIImage(named: item.photos.first!)
    }
     
}
