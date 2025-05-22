//
//  PhotoViewViewController.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 22/05/2025.
//

import UIKit

protocol PhotoViewControllerProtocol: AnyObject {
    var closeButtonAction: UIAction { get set }
}

class PhotoViewViewController: UIViewController {
    
    var completion: (() -> ())?

    private lazy var closeButton: UIButton = {
        $0.setBackgroundImage(.closeIcon, for: .normal)
        return $0
    }(UIButton(frame: CGRect(x: view.bounds.width - 60,
                             y: 60,
                             width: 25,
                             height: 25)))
    
    lazy var closeButtonAction = UIAction {[weak self] _ in
        self?.completion?()
    }
    
    private lazy var scroolView: UIScrollView = {
        $0.delegate = self
        $0.maximumZoomScale = 10
        $0.backgroundColor = .purple
        $0.showsVerticalScrollIndicator = true
        $0.showsHorizontalScrollIndicator = true
        $0.addSubview(image)
        return $0
    }(UIScrollView(frame: view.bounds))
    
    private lazy var image: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.image = .img1
        $0.isUserInteractionEnabled = true
        return $0
    }(UIImageView())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scroolView)
        view.addSubview(closeButton)
    }
}

extension PhotoViewViewController: PhotoViewControllerProtocol {
    
}

extension PhotoViewViewController: UIScrollViewDelegate {
    
}
