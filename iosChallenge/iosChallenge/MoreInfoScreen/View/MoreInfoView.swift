//
//  MoreInfoView.swift
//  iosChallenge
//
//  Created by Marcos Costa on 23/08/24.
//

import UIKit

class MoreInfoView: UIView, ViewCode {

    lazy var repoName2: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Nome do Repositório"
        view.font = .systemFont(ofSize: 16, weight: .heavy)
        view.lineBreakMode = .byTruncatingTail
        view.textColor = .black
        return view
    }()
    
    lazy var saveDeleteButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Salvar", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .red
        return view
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(frame: CGRectMake(0, 0, 40, 40))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.style = .medium
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints
    
    func setupHierarchy() {
        backgroundColor = .white
        addSubview(repoName2)
//        addSubview(saveDeleteButton)
        addSubview(activityIndicator)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            repoName2.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            repoName2.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            saveDeleteButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            saveDeleteButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            saveDeleteButton.widthAnchor.constraint(equalToConstant: 300),
//            saveDeleteButton.heightAnchor.constraint(equalToConstant: 80)
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }

}
