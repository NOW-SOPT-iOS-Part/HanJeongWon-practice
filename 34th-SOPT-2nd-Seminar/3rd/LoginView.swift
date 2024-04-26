//
//  LoginView.swift
//  34th-SOPT-2nd-Seminar
//
//  Created by HanJW on 3/30/24.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("SecondView Error!")
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "  아이디"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "  비밀번호"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
//        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private func setLayout() {
            [titleLabel, idTextField, passwordTextField, loginButton].forEach {
                self.addSubview($0)
            }
            
            titleLabel.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.top.equalToSuperview().offset(161)
                $0.width.equalTo(236)
                $0.height.equalTo(44)
            }
            
            idTextField.snp.makeConstraints {
                $0.top.equalTo(titleLabel.snp.bottom).offset(71)
                $0.horizontalEdges.equalToSuperview().inset(20)
                $0.height.equalTo(52)
            }
            
            passwordTextField.snp.makeConstraints {
                $0.top.equalTo(idTextField.snp.bottom).offset(7)
                $0.horizontalEdges.equalTo(idTextField)
                $0.height.equalTo(52)
            }
            
            loginButton.snp.makeConstraints {
                $0.top.equalTo(passwordTextField.snp.bottom).offset(35)
                $0.horizontalEdges.equalTo(idTextField)
                $0.height.equalTo(58)
            }
        }
}

final class LoginViewController_CustomView: UIViewController {
    
    private let rootView = LoginView()
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setTarget()
    }
    
    private func setTarget() {
        rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func loginButtonDidTap() {
        pushToWelcomeVC()
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}
