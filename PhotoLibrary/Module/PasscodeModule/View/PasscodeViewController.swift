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

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPink
    }
    


}

extension PasscodeViewController: PasscodeViewControllerProtocol {
    func passcodeState(state: PasscodeState) {
        
    }
    
    func enterCode(code: [Int]) {
        print(code)
    }
    
    
}
