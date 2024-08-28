//
//  GitTableViewCell.swift
//  iosChallenge
//
//  Created by Marcos Costa on 23/08/24.
//

import UIKit

class GitTableViewCell: UITableViewCell, ViewCode {
    
    lazy var profilePic: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 25
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .white

        return view
    }()
    
    lazy var repoName: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Nome do Repositório"
        view.font = .systemFont(ofSize: 16, weight: .heavy)
        view.lineBreakMode = .byTruncatingTail
        view.textColor = .black
        return view
    }()
    
    lazy var userName: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Nome do Usuário"
        view.font = .systemFont(ofSize: 14, weight: .semibold)
        view.lineBreakMode = .byTruncatingTail
        view.textColor = .init(red: 0.294, green: 0.318, blue: 0.38, alpha: 1)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "GitCell")
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHierarchy() {
        backgroundColor = .white
        addSubview(profilePic)
        addSubview(repoName)
        addSubview(userName)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            profilePic.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            profilePic.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            profilePic.heightAnchor.constraint(equalToConstant: 50),
            profilePic.widthAnchor.constraint(equalTo: profilePic.heightAnchor, multiplier: 1),
            
            repoName.leadingAnchor.constraint(equalTo: profilePic.trailingAnchor, constant: 10),
            repoName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            repoName.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10),
            
            userName.leadingAnchor.constraint(equalTo: profilePic.trailingAnchor, constant: 10),
            userName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            userName.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 10)
        ])
    }
}
