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
    
    var passcodePresenter: PasscodePresenterProtocol?
    
    private let buttons: [ [Int] ] = [[1,2,3], [4,5,6], [7,8,9], [0]]
    
    private lazy var passcodeTitle: UILabel = UILabel.configure(view: UILabel()) { label in
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
    }
    
    private lazy var keyboardStack: UIStackView = UIStackView.configure(view: UIStackView()) { stack in
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .center
    }
    
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
    }(UIButton(primaryAction: deleteCodeAction))
    
    lazy var enterCodeAction = UIAction { [weak self] sender in
        guard let self = self, let sender = sender.sender as? UIButton
        else { return }
        
        self.passcodePresenter?.enterPasscode(number: sender.tag)
    }
    
    lazy var deleteCodeAction = UIAction {[weak self] sender in
        guard let self = self, let sender = sender.sender as? UIButton
        else { return }
        
        self.passcodePresenter?.removeLastItemInPasscode()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray
        view.addSubview(keyboardStack)
        view.addSubview(passcodeTitle)
        view.addSubview(codeStack)
        view.addSubview(deleteButton)
        
        buttons.forEach {
            let buttonLine = setHorizontalNumStack(range: $0)
            keyboardStack.addArrangedSubview(buttonLine)
        }
        
        (11...14).forEach{
            let view = getCodeView(tag: $0)
            codeStack.addArrangedSubview(view)
        }
        
        NSLayoutConstraint.activate([
            
            passcodeTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passcodeTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passcodeTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
          //  passcodeTitle.heightAnchor.constraint(equalToConstant: 50),
            
            codeStack.topAnchor.constraint(equalTo: passcodeTitle.bottomAnchor, constant: 50),
            codeStack.widthAnchor.constraint(equalToConstant: 140),
            codeStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            keyboardStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            keyboardStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            keyboardStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            keyboardStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 80),
            
            deleteButton.rightAnchor.constraint(equalTo: keyboardStack.rightAnchor, constant: -20),
            deleteButton.bottomAnchor.constraint(equalTo: keyboardStack.bottomAnchor, constant: -25)
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
            let numberButton = UIButton(primaryAction: enterCodeAction)
            numberButton.tag = $0
            numberButton.setTitle("\($0)", for: .normal)
            numberButton.setTitleColor(.white, for: .normal)
            numberButton.titleLabel?.font = UIFont.systemFont(ofSize: 60, weight: .light)
            numberButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
            stack.addArrangedSubview(numberButton)
        }
        return stack
    }
    
    private func getCodeView(tag: Int) -> UIView{ // sayı girilecek yer
        return {
            $0.widthAnchor.constraint(equalToConstant: 20).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 20).isActive = true
            $0.layer.cornerRadius = 10
            $0.layer.borderWidth = 2
            $0.tag = tag
            $0.layer.borderColor = UIColor.white.cgColor
            return $0
        }(UIView())
    }
}

extension PasscodeViewController: PasscodeViewControllerProtocol {
    func passcodeState(state: PasscodeState) {
        passcodeTitle.text = state.getPasscodeLabel()
    }
    
    //code stack background according to keyboard stack
    func enterCode(code: [Int]) {
        print(code)
        let tag = code.count + 10
        
        (tag...14).forEach{
            view.viewWithTag($0)?.backgroundColor = .none
        }
        
        view.viewWithTag(tag)?.backgroundColor = .white
    }
    
    
}
