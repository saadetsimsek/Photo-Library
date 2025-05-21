//
//  DetailsAddCommitCollectionViewCell.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 20/05/2025.
//

import UIKit

class DetailsAddCommitCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DetailsAddCommitCollectionViewCell"
    
    var completion: ((String?) -> ())?
    
    lazy var action = UIAction {[weak self] sender in
         let textField = sender.sender as! UITextField
            self?.completion?(textField.text ?? "")
            self?.endEditing(true) 
    }
    
    lazy var textField: UITextField = {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = bounds.height / 2
        $0.placeholder = "Add commit message"
        $0.setLeftOffset()
        return $0
    }(UITextField(frame: bounds))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(textField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(){
        
    }
}
