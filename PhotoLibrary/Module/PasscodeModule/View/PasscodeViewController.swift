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
    
    private let buttons: [ [Int] ] = [[1,2,3], [4,5,6], [7,8,9], [0]]
    
    private lazy var passcodeTitle: UILabel = {
        .configure(view: $0) { label in
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            label.textAlignment = .center
        }
    }(UILabel())
    
    private lazy var keyboardStack: UIStackView = {
        .configure(view: $0) { stack in
            stack.axis = .vertical
            stack.distribution = .equalSpacing
            stack.alignment = .center
        }
    }(UIStackView())
    
    private lazy var codeStack: UIStackView = {
        .configure(view: $0) { stack in
            stack.axis = .horizontal
            stack.distribution = .equalCentering
            stack.spacing = 20
        }
    }(UIStackView())
    
    private lazy var deleteButton: UIButton = {
        .configure(view: $0) { button in
            button.widthAnchor.constraint(equalToConstant: 36).isActive = true
            button.heightAnchor.constraint(equalToConstant: 36).isActive = true
            button.setBackgroundImage(UIImage(systemName: "delete.left"), for: .normal)
        }
    }(UIButton())

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray
        view.addSubview(passcodeTitle)
        view.addSubview(keyboardStack)
        view.addSubview(codeStack)
        view.addSubview(deleteButton)
        
        buttons.forEach {
            let buttonLine = setHorizontalNumStack(range: $0)
            keyboardStack.addArrangedSubview(buttonLine)
        }
        
        NSLayoutConstraint.activate([
            keyboardStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            keyboardStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            keyboardStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            keyboardStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 80),
        ])
    }
    


}

extension PasscodeViewController {
    private func getHorizontalNumStack() -> UIStackView {
        return {
            .configure(view: $0) { stack in
                stack.axis = .horizontal
                stack.spacing = 50
            }
        }(UIStackView())
    }
    
    private func setHorizontalNumStack(range: [Int]) -> UIStackView {
        let stack = getHorizontalNumStack()
        range.forEach{
            let numberButton = UIButton(primaryAction: nil)
            numberButton.tag = $0
            numberButton.setTitle("\($0)", for: .normal)
            numberButton.setTitleColor(.white, for: .normal)
            numberButton.titleLabel?.font = UIFont.systemFont(ofSize: 60, weight: .light)
            stack.addArrangedSubview(numberButton)
        }
        return stack
    }
}

extension PasscodeViewController: PasscodeViewControllerProtocol {
    func passcodeState(state: PasscodeState) {
        passcodeTitle.text = state.getPasscodeLabel()
    }
    
    func enterCode(code: [Int]) {
        print(code)
    }
    
    
}
