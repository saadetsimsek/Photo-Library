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
    
    private lazy var navigationView : UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addSubview(dateStack)
        return $0
    }(UIView())
    
    
    private lazy var dateStack: UIStackView = {
        $0.axis = .vertical
        $0.addArrangedSubview(dateLabel)
        $0.addArrangedSubview(yearLabel)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var dateLabel: UILabel = getHeaderLabel(text: date.formattedDate(formatType: .onlyDate),
                                                 size: 30,
                                                 weight: .bold)
    private lazy var yearLabel: UILabel = getHeaderLabel(text: date.formattedDate(formatType: .onlyYear),
                                                 size: 14,
                                                 weight: .light)
    private lazy var backButton: UIButton = getActionButton(icon: .backIcon,
                                                            action: backAction)
    private lazy var closeButton: UIButton = getActionButton(icon: .closeIcon,
                                                     action: closeAction)
    private lazy var menuButton: UIButton =  getActionButton(icon: .menuIcon,
                                                     action: menuAction)
    
    init(backAction: UIAction? = nil, menuAction: UIAction? = nil, closeAction: UIAction? = nil, date: Date) {
        self.backAction = backAction
        self.menuAction = menuAction
        self.closeAction = closeAction
        self.date = date
    }
    
    
    private func getActionButton(icon: UIImage, action:UIAction?) -> UIButton {
        let button = UIButton(primaryAction: action)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(icon, for: .normal)
        button.widthAnchor.constraint(equalToConstant: 25).isActive = true
        button.heightAnchor.constraint(equalToConstant: 25).isActive = true
        return button
    }
    
    private func getHeaderLabel(text: String, size: CGFloat, weight: UIFont.Weight) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: size, weight: weight)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func getNavigationHeader(type: NavigationHeaderType) -> UIView {
        switch type {
        case .back:
            navigationView.addSubview(backButton)
            navigationView.addSubview(menuButton)
        case .close:
            navigationView.addSubview(closeButton)
        }
        
        NSLayoutConstraint.activate([
            navigationView.heightAnchor.constraint(equalToConstant: 44),
            
            //dateStack
            dateStack.centerXAnchor.constraint(equalTo: navigationView.centerXAnchor),
            dateStack.centerYAnchor.constraint(equalTo: navigationView.centerYAnchor),
        ])
        
        if type == .back {
            NSLayoutConstraint.activate([
                backButton.leadingAnchor.constraint(equalTo: navigationView.leadingAnchor),
                backButton.centerYAnchor.constraint(equalTo: navigationView.centerYAnchor),
                
                menuButton.trailingAnchor.constraint(equalTo: navigationView.trailingAnchor),
                menuButton.centerYAnchor.constraint(equalTo: navigationView.centerYAnchor)
            ])
            
        }  else if type == .close {
            NSLayoutConstraint.activate([
                closeButton.trailingAnchor.constraint(equalTo: navigationView.trailingAnchor),
                closeButton.centerYAnchor.constraint(equalTo: navigationView.centerYAnchor)
            ])
        }
        
        return navigationView
    }
}
