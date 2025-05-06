//
//  NavigationHeader.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 06/05/2025.
//

import UIKit

enum NavigationHeaderType {
    case back
    case close
}

class NavigationHeader {
    
    var backAction: UIAction?
    var menuAction: UIAction?
    var closeAction: UIAction?
    var date: Date
    
    lazy var dateLabel: UILabel = getHeaderLabel(text: date.formattedDate(formatType: .onlyDate),
                                                 size: 30,
                                                 weight: .bold)
    lazy var yearLabel: UILabel = getHeaderLabel(text: date.formattedDate(formatType: .onlyYear),
                                                 size: 14,
                                                 weight: .light)
    
    lazy var dateStack: UIStackView = {
        $0.axis = .vertical
        $0.addArrangedSubview(dateLabel)
        $0.addArrangedSubview(yearLabel)
        return $0
    }(UIStackView(frame: CGRect(x: 45,
                                y: 0,
                                width: 200,
                                height: 44)))
    
    init(backAction: UIAction? = nil, menuAction: UIAction? = nil, closeAction: UIAction? = nil, date: Date) {
        self.backAction = backAction
        self.menuAction = menuAction
        self.closeAction = closeAction
        self.date = date
    }
    
    private func getActionButton(origin: CGPoint, icon: UIImage, action:UIAction?) -> UIButton {
        let button = UIButton(primaryAction: action)
        button.frame.size = CGSize(width: 25,
                                   height: 25)
        button.frame.origin = origin
        button.setBackgroundImage(UIImage(systemName: "arrowshape.left.circle"), for: .normal)
        return button
    }
    
    private func getHeaderLabel(text: String, size: CGFloat, weight: UIFont.Weight) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: size, weight: weight)
        return label
    }
}
