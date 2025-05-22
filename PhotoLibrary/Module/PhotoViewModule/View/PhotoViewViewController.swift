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
    
    var presenter: PhotoViewPresenter!

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
    
    private lazy var scrollView: UIScrollView = {
        $0.delegate = self
        $0.maximumZoomScale = 10
        $0.backgroundColor = .purple
        $0.showsVerticalScrollIndicator = true
        $0.showsHorizontalScrollIndicator = true
        $0.addSubview(image)
        return $0
    }(UIScrollView(frame: view.bounds))
    
    lazy var tapGesture: UITapGestureRecognizer = {
        $0.numberOfTapsRequired = 2
        $0.addTarget(self, action: #selector(zoomImage))
        return $0
    }(UITapGestureRecognizer())
    
    private lazy var image: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.image = presenter.image
        $0.isUserInteractionEnabled = true
        return $0
    }(UIImageView())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
        view.addSubview(closeButton)
    }
    
    private func setImageSize(){
        let imageSize = image.image?.size
        let imageHeight = imageSize?.height ?? 0
        let imageWidth = imageSize?.width ?? 0
        
        let ratio = imageHeight/imageWidth
        
        image.frame.size = CGSize(width: view.frame.width,
                                  height: view.frame.width * ratio)
        image.center = view.center
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
}

extension PhotoViewViewController: PhotoViewControllerProtocol {
    
}

extension PhotoViewViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return image
    }
    
    
}
