//
//  UIView+Extension.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 07/04/2025.
//

import UIKit

extension UIView { // viewi al ve bir şeyler uygula
    static func configure <T: UIView>(view: T, block: (T) -> Void) -> T {
        view.translatesAutoresizingMaskIntoConstraints = false
        block(view)
        return view
    }
}
