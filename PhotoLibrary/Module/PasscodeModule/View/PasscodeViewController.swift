//
//  PasscodeViewController.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 07/04/2025.
//

import UIKit

protocol PasscodeViewControllerProtocol: AnyObject {
    
    func passcodeState(state: PasscodeState)
    func enterCode(code: [Int])
    
}

class PasscodeViewController: UIViewController {
    
    var passcodePresenter: PasscodePresenterProtocol!
    
    lazy var passcodeTitle: UILabel = {
        .configure(view: $0) { label in
            label.textColor = .white
        }
    }(UILabel())

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray
    }
    


}

extension PasscodeViewController: PasscodeViewControllerProtocol {
    func passcodeState(state: PasscodeState) {
        
    }
    
    func enterCode(code: [Int]) {
        print(code)
    }
    
    
}
