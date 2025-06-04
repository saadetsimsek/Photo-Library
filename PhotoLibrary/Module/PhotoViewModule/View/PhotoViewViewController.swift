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

class PhotoViewViewController: UIViewController, PhotoViewControllerProtocol {
    
    var completion: (() -> ())?
    
    var presenter: PhotoViewPresenter!

    private lazy var closeButton: UIButton = {
        $0.setBackgroundImage(.closeIcon, for: .normal)
        $0.isUserInteractionEnabled = true
        $0.addAction(closeButtonAction, for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    
    lazy var closeButtonAction = UIAction {[weak self] _ in
        self?.completion?()
    }
    
    private lazy var scrollView: UIScrollView = {
        $0.delegate = self
        $0.maximumZoomScale = 10
        $0.backgroundColor = .systemGray
        $0.showsVerticalScrollIndicator = true
        $0.showsHorizontalScrollIndicator = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIScrollView())
    
    lazy var tapGesture: UITapGestureRecognizer = {
        $0.numberOfTapsRequired = 2
        $0.addTarget(self, action: #selector(zoomImage))
        return $0
    }(UITapGestureRecognizer())
    
    private lazy var image: UIImageView = {
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = presenter.image
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isUserInteractionEnabled = true
        return $0
    }(UIImageView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray

        view.addSubview(scrollView)
        view.addSubview(closeButton)
        scrollView.addSubview(image)
        scrollView.addGestureRecognizer(tapGesture)
        
        setConstraints()
    }
    
    
    private var imageAspectRatio: CGFloat {
        guard let image = presenter.image else { return 1 }
        return image.size.height / image.size.width
    }
    
    @objc func zoomImage(){
        UIView.animate(withDuration: 0.2) {[weak self] in
            if self?.scrollView.zoomScale ?? 1 > 1 {
                self?.scrollView.zoomScale = 1
            }
            else {
                self?.scrollView.zoomScale = 2
            }
        }
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            image.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            image.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            image.heightAnchor.constraint(equalTo: image.widthAnchor, multiplier: imageAspectRatio),
            
      
        ])
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.widthAnchor.constraint(equalToConstant: 25),
            closeButton.heightAnchor.constraint(equalToConstant: 25),
        ])
    }
}


extension PhotoViewViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return image
    }
    
    
}
