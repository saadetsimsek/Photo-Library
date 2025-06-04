//
//  TabBarViewController.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 28/04/2025.
//

import UIKit

protocol TabBarViewControllerProtocol: AnyObject {
    func setControllers(controllers: [UIViewController])
}

class TabBarViewController: UITabBarController {
    
    var presenter: TabBarViewPresenter!
  
    private let tabss : [UIImage] = [.house, .camera, .heart]
    
    private lazy var tabBarView: UIView = {
        $0.backgroundColor = .clear
        return $0
    }(UIView(frame: CGRect(x: 0,
                           y: view.frame.height - 100,
                           width: view.frame.width,
                           height: 65)))

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(hideTabBar),
                                               name: .hideTabBar,
                                               object: nil)
        
        tabss.enumerated().forEach{
            let offsets: [Double] = [-100, 0, 100]
            let tabButton = createTabBarButton(icon: $0.element,
                                               tag: $0.offset,
                                               offsetX: offsets[$0.offset],
                                               isBigButton: $0.offset == 1 ? true : false)
            
            tabBarView.addSubview(tabButton)
            
        }
        view.addSubview(tabBarView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        selectedIndex = 2
    }
    
    lazy var selectedItem = UIAction { [weak self] sender in
        guard let self = self,
              let sender = sender.sender as? UIButton
        else { return }
        
        let tag = sender.tag
        self.selectedIndex = sender.tag
        
    }
    
    @objc func hideTabBar(sender: Notification){
        guard let isHide = sender.userInfo?["isHide"] as? Bool else { return }
        
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self = self else { return }
            if isHide {
                self.tabBarView.frame.origin.y = self.view.frame.height
            }
            else{
                self.tabBarView.frame.origin.y = view.frame.height - 100
            }
        }
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBar.isHidden = true
    }
}

extension TabBarViewController: TabBarViewControllerProtocol {
    func setControllers(controllers: [UIViewController]) {
        self.setViewControllers(controllers, animated: true)
    }
    
    
}

extension TabBarViewController {
    private func createTabBarButton(icon: UIImage, tag: Int, offsetX: Double, isBigButton: Bool = false) -> UIButton {
        
        return {
            let btnSize: Double = isBigButton ? 60 : 25
            let yOffset = isBigButton ? 0 : 15
            $0.frame.size = CGSize(width: btnSize, height: btnSize)
            $0.tag = tag
            $0.setBackgroundImage(icon, for: .normal)
            $0.tintColor = .white
            $0.frame.origin = CGPoint(x: .zero,
                                      y: yOffset)
            $0.center.x = view.center.x + offsetX
            return $0
        }(UIButton(primaryAction: selectedItem))
    }
}
