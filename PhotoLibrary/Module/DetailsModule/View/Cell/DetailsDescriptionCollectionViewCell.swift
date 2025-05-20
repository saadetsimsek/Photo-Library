//
//  DetailsDescriptionCollectionViewCell.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 20/05/2025.
//

import UIKit

class DetailsDescriptionCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DetailsDescriptionCollectionViewCell"
    
    lazy var dateTextLabel = UILabel()
    lazy var descriptionTextLabel = UILabel()
    
    lazy var cellStack: UIStackView = {
        .configure(view: $0) { stack in
            stack.alignment = .leading
            stack.axis = .vertical
            stack.spacing = 7
            stack.translatesAutoresizingMaskIntoConstraints = false
        }
    }(UIStackView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(cellStack)
        backgroundColor = .systemGray
        layer.cornerRadius = 30
        clipsToBounds = true
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createCellLabel(text: String, weight: UIFont.Weight) -> UILabel {
        let label = UILabel()
        label.text = text
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: weight)
        label.textColor = .white
        return label
    }
    
    func configureCell(date: Date?, text: String){
        cellStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        if let date = date {
            let dateTextLabel = createCellLabel(text: date.formattedDate(formatType: .onlyDate),
                                            weight: .bold)
            cellStack.addArrangedSubview(dateTextLabel)
        }
        
        descriptionTextLabel = createCellLabel(text: text, weight: .regular)
        cellStack.addArrangedSubview(descriptionTextLabel)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            cellStack.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            cellStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            cellStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            cellStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25)
        ])
    }
}
