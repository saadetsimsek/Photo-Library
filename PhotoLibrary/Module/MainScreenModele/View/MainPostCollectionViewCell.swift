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
        .configure(view: $0) {[weak self] stack in
            guard let self = self else { return }
            stack.axis = .horizontal
            stack.spacing = 20
            stack.addArrangedSubview(self.photoCountLabel)
            stack.addArrangedSubview(self.commentCountLabel)
            stack.addArrangedSubview(self.postDescriptionLabel)
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
        tags = item.tag ?? []
        let tagCollection: TagCollectionViewProtocol = TagCollectionView(dataSource: self)
        tagCollectionView = tagCollection.getCollectionView()
        
        postImage.image = UIImage(named: item.photos.first!)
        photoCountLabel = getCellLabel(text: "\(item.photos.count) Photo")
        commentCountLabel = getCellLabel(text: "\(item.comments?.count ?? 0) Comment")
        postDescriptionLabel = getCellLabel(text: item.description ?? "")
        
        addSubview(countLabelStack)
        addSubview(tagCollectionView)
        addSubview(postDescriptionLabel)
        
        NSLayoutConstraint.activate([
            
            countLabelStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            
            tagCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tagCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tagCollectionView.bottomAnchor.constraint(equalTo: postDescriptionLabel.topAnchor, constant: -10),
            tagCollectionView.heightAnchor.constraint(equalToConstant: 40),
            
            
            postDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            postDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            postDescriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            
        ])
    }
    
    private func getCellLabel(text: String) -> UILabel {
        return {
            .configure(view: $0) { label in
                label.numberOfLines = 0
                label.font = .systemFont(ofSize: 14)
                label.text = text
                label.textColor = .white
            }
        }(UILabel())
    }
     
}

extension MainPostCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.identifier, for: indexPath) as! TagCollectionViewCell
        let tag = tags[indexPath.row]
        cell.cellConfigure(tagText: tag)
        return cell
    }
    
    
}
