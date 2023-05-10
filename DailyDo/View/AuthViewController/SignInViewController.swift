//
//  AuthViewController.swift
//  DailyDo
//
//  Created by Kamila on 8/5/23.
//

import UIKit
import SnapKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initialize()
        makeConstraint()
    }
    
//MARK: - Properties
    private var signInLabel: UILabel = {
        let signInLabel = UILabel()
        signInLabel.text = "Sign In"
        signInLabel.textColor = .black
        signInLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        
        return signInLabel
    }()
    
    private var emailTextField = DefaultTextField(placeholder: "Email")
    private var passwordTextField = DefaultTextField(placeholder: "Password")
    
    private lazy var textFieldStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 20

        return stack
    }()
    
    private var signInButton: UIButton = {
       let signInButton = UIButton()
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        signInButton.backgroundColor = UIColor(red: 40/255, green: 124/255, blue: 233/255, alpha: 1)
        signInButton.layer.cornerRadius = 10
        
        return signInButton
    }()
    
    private var newUserLabel: UILabel = {
       let newUserLabel = UILabel()
        newUserLabel.text = "New User?"
        newUserLabel.textColor = .darkGray
        newUserLabel.font = UIFont.systemFont(ofSize: 15)
        
        return newUserLabel
    }()
    
    private var createAccountButton: UIButton = {
       let createAccountButton = UIButton()
        createAccountButton.setTitle("Create Account", for: .normal)
        createAccountButton.setTitleColor(UIColor(red: 40/255, green: 124/255, blue: 233/255, alpha: 1), for: .normal)
        createAccountButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return createAccountButton
    }()
    
    private lazy var createAccountStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [newUserLabel, createAccountButton])
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 5

        return stack
    }()
}

//MARK: - Private methods
private extension SignInViewController {
    func initialize() {
        view.addSubview(signInLabel)
        view.addSubview(textFieldStack)
        view.addSubview(signInButton)
        view.addSubview(createAccountStack)
        
    }
    
    func makeConstraint() {
        textFieldStack.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(120)
        }
        
        signInLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(textFieldStack.snp.top).offset(-50)
        }
        
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(textFieldStack.snp.bottom).offset(35)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
        
        createAccountStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(signInButton.snp.bottom).offset(15)
        }
    }
}
