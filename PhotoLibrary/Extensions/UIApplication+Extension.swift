//
//  UIApplication+Extension.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 30/04/2025.
//

import UIKit

extension UIApplication{

    static var topSafeArea: CGFloat  {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return scene?.windows.first?.safeAreaInsets.top ?? .zero
    }
}
