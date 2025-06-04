//
//  CameraViewController.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 28/04/2025.
//

import UIKit

protocol CameraViewControllerProtocol: AnyObject {
    
}

class CameraViewController: UIViewController , CameraViewControllerProtocol{
    
    var presenter: CameraViewPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray
      
    }
    


}
