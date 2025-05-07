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
        $0.frame = CGRect(x: 30,
                          y: 0,
                          width: UIScreen.main.bounds.width - 60,
                          height: 44)
        $0.backgroundColor = .systemGray
        $0.addSubview(dateStack)
        return $0
    }(UIView())
    
    
    lazy var dateStack: UIStackView = {
        $0.axis = .vertical
        $0.addArrangedSubview(dateLabel)
        $0.addArrangedSubview(yearLabel)
        return $0
    }(UIStackView(frame: CGRect(x: 45,
                                y: 0,
                                width: 200,
                                height: 44)))
    
    lazy var dateLabel: UILabel = getHeaderLabel(text: date.formattedDate(formatType: .onlyDate),
                                                 size: 30,
                                                 weight: .bold)
    lazy var yearLabel: UILabel = getHeaderLabel(text: date.formattedDate(formatType: .onlyYear),
                                                 size: 14,
                                                 weight: .light)
    lazy var backButton: UIButton = getActionButton(origin: CGPoint(x: 0,
                                                                    y: 0),
                                                    icon: .backIcon,
                                                    action: backAction)
    lazy var closeButton: UIButton = getActionButton(origin: CGPoint(x: navigationView.frame.width - 30,
                                                                     y: 0),
                                                     icon: .closeIcon,
                                                     action: closeAction)
    lazy var menuButton: UIButton =  getActionButton(origin: CGPoint(x: navigationView.frame.width - 30,
                                                                     y: 0),
                                                     icon: .menuIcon,
                                                     action: menuAction)
    
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
        button.setBackgroundImage(icon, for: .normal)
        return button
    }
    
    private func getHeaderLabel(text: String, size: CGFloat, weight: UIFont.Weight) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: size, weight: weight)
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
        return navigationView
    }
}
