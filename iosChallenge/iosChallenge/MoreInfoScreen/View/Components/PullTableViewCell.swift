//
//  PullTableViewCell.swift
//  iosChallenge
//
//  Created by Marcos Costa on 25/08/24.
//

import UIKit

class PullTableViewCell: UITableViewCell, ViewCode {
    
    lazy var title: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Number: title"
        view.font = .systemFont(ofSize: 14, weight: .bold)
        view.numberOfLines = 2
        view.lineBreakMode = .byTruncatingTail
        view.textColor = .black
        return view
    }()
    
    lazy var profilePic: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .white
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
    
    lazy var userStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [profilePic, userName])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 10
        return view
    }()
    
    lazy var created: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "creation date"
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.textColor = .black
        return view
    }()
    
    lazy var createdImage: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "calendar.badge.plus")?.withTintColor(.black, renderingMode: .alwaysOriginal))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var createdStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [createdImage, created])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 0.08)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 6, left: 8, bottom: 6, right: 8)
        view.axis = .horizontal
        view.spacing = 8
        return view
    }()
    
    lazy var infoStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [userStack, createdStack])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        return view
    }()
    
    lazy var pullStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [title, infoStack])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 10
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "PullCell")
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHierarchy() {
        backgroundColor = .white
        addSubview(pullStack)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            pullStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            pullStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            pullStack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            profilePic.heightAnchor.constraint(equalToConstant: 30),
            profilePic.widthAnchor.constraint(equalTo: profilePic.heightAnchor, multiplier: 1),
            userName.widthAnchor.constraint(equalToConstant: 140)
        ])
    }
}

