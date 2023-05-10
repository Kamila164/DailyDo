//
//  SignUpViewController.swift
//  DailyDo
//
//  Created by Kamila on 8/5/23.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initialize()
        makeConstraint()
        
    }
    
    private var signUpLabel: UILabel = {
        let signInLabel = UILabel()
        signInLabel.text = "Sign Up"
        signInLabel.textColor = .black
        signInLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        
        return signInLabel
    }()
    
    private var emailTextField = DefaultTextField(placeholder: "Email")
    private var nameTextField = DefaultTextField(placeholder: "Name")
    private var passwordTextField = DefaultTextField(placeholder: "Password")
    
    private lazy var textFieldStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [emailTextField, nameTextField, passwordTextField])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 20

        return stack
    }()
    
    private var signUpButton: UIButton = {
       let signInButton = UIButton()
        signInButton.setTitle("Sign Up", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        signInButton.backgroundColor = UIColor(red: 40/255, green: 124/255, blue: 233/255, alpha: 1)
        signInButton.layer.cornerRadius = 10
        
        return signInButton
    }()
    
    private var accountExistLabel: UILabel = {
       let newUserLabel = UILabel()
        newUserLabel.text = "New User?"
        newUserLabel.textColor = .darkGray
        newUserLabel.font = UIFont.systemFont(ofSize: 15)
        
        return newUserLabel
    }()
    
    private var signInButton: UIButton = {
       let createAccountButton = UIButton()
        createAccountButton.setTitle("Create Account", for: .normal)
        createAccountButton.setTitleColor(UIColor(red: 40/255, green: 124/255, blue: 233/255, alpha: 1), for: .normal)
        createAccountButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return createAccountButton
    }()
    
    private lazy var accountExistStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [accountExistLabel, signInButton])
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 5

        return stack
    }()

}


//MARK: - Private methods
private extension SignUpViewController {
    func initialize() {
        view.addSubview(signUpLabel)
        view.addSubview(textFieldStack)
        view.addSubview(signUpButton)
        view.addSubview(accountExistStack)
    }
    
    func makeConstraint() {
        textFieldStack.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(180)
        }
        
        signUpLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(textFieldStack.snp.top).offset(-50)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(textFieldStack.snp.bottom).offset(35)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
        
        accountExistStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(signUpButton.snp.bottom).offset(15)
        }
    }
}
