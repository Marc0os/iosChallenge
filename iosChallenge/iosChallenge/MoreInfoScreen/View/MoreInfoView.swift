//
//  MoreInfoView.swift
//  iosChallenge
//
//  Created by Marcos Costa on 23/08/24.
//

import UIKit

class MoreInfoView: UIView, ViewCode {
    
    // MARK: - Main View
    lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        view.addSubview(headerStack)
        view.addSubview(popularityStack)
        view.addSubview(descriptionStack)
        view.addSubview(topicsStack)
        view.addSubview(createUpdateStack)
        view.addSubview(ownerLabel)
        view.addSubview(ownerStack)
        view.addSubview(pullsLabel)
        view.addSubview(tablePulls)
        view.addSubview(placeholder)
        
        return view
    }()

    // MARK: - Placeholder
    
    lazy var placeholder: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "There's no pulls yet"
        view.font = .systemFont(ofSize: 22, weight: .heavy)
        view.lineBreakMode = .byTruncatingTail
        view.textColor = .gray
        return view
    }()
    
    // MARK: - Repo name and fullname
    lazy var repoName: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Nome do Repositório"
        view.font = .systemFont(ofSize: 22, weight: .heavy)
        view.lineBreakMode = .byTruncatingTail
        view.textColor = .black
        return view
    }()
    
    lazy var fullName: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Nome do caminho"
        view.font = .systemFont(ofSize: 16, weight: .semibold)
        view.lineBreakMode = .byTruncatingTail
        view.textColor = .darkGray
        return view
    }()
    
    lazy var nameStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [repoName, fullName])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 4
        return view
    }()
    
    lazy var saveButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Salvar", for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        view.setTitleColor(.white, for: .normal)
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.backgroundColor = .black
        return view
    }()
    
    lazy var deleteButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Remover", for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        view.setTitleColor(.white, for: .normal)
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.backgroundColor = .red
        
        return view
    }()
    
    lazy var headerStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [nameStack, saveButton, deleteButton])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        return view
    }()
    
    // MARK: - Pupularity (forks and watchers)
    
    lazy var fork: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "numero de forks"
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.lineBreakMode = .byTruncatingTail
        view.textColor = .black
        return view
    }()
    
    lazy var forkImage: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "arrow.triangle.branch")?.withTintColor(.black, renderingMode: .alwaysOriginal))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var forkStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [forkImage, fork])
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

    lazy var watchers: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "numero de visitas"
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.lineBreakMode = .byTruncatingTail
        view.textColor = .black
        return view
    }()
    
    lazy var watchersImage: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "eye")?.withTintColor(.black, renderingMode: .alwaysOriginal))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var watchersStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [watchersImage, watchers])
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
    
    lazy var popularityStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [forkStack, watchersStack])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        
        view.spacing = 15
        return view
    }()
    
    // MARK: - Description
    
    lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Description"
        view.font = .systemFont(ofSize: 18, weight: .bold)
        view.lineBreakMode = .byTruncatingTail
        view.textColor = .black
        return view
    }()
    
    lazy var descriptionText: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Description"
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.lineBreakMode = .byTruncatingTail
        view.numberOfLines = 0
        view.textColor = .black
        return view
    }()
    
    lazy var descriptionStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [descriptionLabel, descriptionText])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 6
        return view
    }()
    
    // MARK: - Topics
    
    lazy var topicsLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Topics"
        view.font = .systemFont(ofSize: 18, weight: .bold)
        view.lineBreakMode = .byTruncatingTail
        view.textColor = .black
        return view
    }()
    
    lazy var topicsText: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "all topics"
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.lineBreakMode = .byTruncatingTail
        view.numberOfLines = 0
        view.textColor = .black
        return view
    }()
    
    lazy var topicsStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [topicsLabel, topicsText])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 6
        return view
    }()
    
    // MARK: - Date of creation and last update
    lazy var created: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "creation date"
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.lineBreakMode = .byTruncatingTail
        view.textColor = .black
        return view
    }()
    
    lazy var createdImage: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "calendar.badge.clock")?.withTintColor(.black, renderingMode: .alwaysOriginal))
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
    

    lazy var updated: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "update date"
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.lineBreakMode = .byTruncatingTail
        view.textColor = .black
        return view
    }()
    
    lazy var updatedImage: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "clock.arrow.2.circlepath")?.withTintColor(.black, renderingMode: .alwaysOriginal))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var updatedStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [updatedImage, updated])
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
    
    lazy var createUpdateStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [createdStack, updatedStack])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        
        view.spacing = 15
        return view
    }()
    
    // MARK: - Owner
    
    lazy var ownerLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Owner"
        view.font = .systemFont(ofSize: 18, weight: .bold)
        view.lineBreakMode = .byTruncatingTail
        view.textColor = .black
        return view
    }()
    
    lazy var owner: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Owner"
        view.font = .systemFont(ofSize: 16, weight: .semibold)
        view.lineBreakMode = .byTruncatingTail
        view.textColor = .black
        return view
    }()
    
    lazy var ownerImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    lazy var ownerStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [ownerImage, owner])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 12
        return view
    }()
    
    // MARK: - Pulls table
    
    lazy var pullsLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Pulls"
        view.font = .systemFont(ofSize: 18, weight: .bold)
        view.lineBreakMode = .byTruncatingTail
        view.textColor = .black
        return view
    }()
    
    lazy var tablePulls: UITableView = {
//        let view = UITableView(frame: .zero, style: .grouped)
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.register(PullTableViewCell.self, forCellReuseIdentifier: "PullCell")
        view.isHidden = true
//        view.tableHeaderView = mainView
        return view
    }()
    
    
    
    
    
//    
//    
//    
//    lazy var scrollView: UIScrollView = {
//        let view = UIScrollView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.showsVerticalScrollIndicator = false
//        return view
//    }()
//    
    
    
    

    
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
        addSubview(mainView)
        
        addSubview(activityIndicator)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            mainView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            headerStack.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            headerStack.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16),
            headerStack.topAnchor.constraint(equalTo: mainView.topAnchor),
//            repoName.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16),
//            fullName.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
//            fullName.topAnchor.constraint(equalTo: repoName.bottomAnchor, constant: 4),
            
            forkImage.widthAnchor.constraint(equalToConstant: 18),
            forkImage.heightAnchor.constraint(equalTo: forkImage.widthAnchor, multiplier: 1),
            watchersImage.widthAnchor.constraint(equalToConstant: 18),
            watchersImage.heightAnchor.constraint(equalTo: watchersImage.widthAnchor, multiplier: 1),
            popularityStack.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            popularityStack.topAnchor.constraint(equalTo: fullName.bottomAnchor, constant: 16),
            
            descriptionStack.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            descriptionStack.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16),
            descriptionStack.topAnchor.constraint(equalTo: popularityStack.bottomAnchor, constant: 18),
            
            topicsStack.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            topicsStack.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16),
            topicsStack.topAnchor.constraint(equalTo: descriptionStack.bottomAnchor, constant: 18),
            
            createdImage.widthAnchor.constraint(equalToConstant: 18),
            createdImage.heightAnchor.constraint(equalTo: createdImage.widthAnchor, multiplier: 1),
            updatedImage.widthAnchor.constraint(equalToConstant: 18),
            updatedImage.heightAnchor.constraint(equalTo: updatedImage.widthAnchor, multiplier: 1),
            createUpdateStack.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            createUpdateStack.topAnchor.constraint(equalTo: topicsStack.bottomAnchor, constant: 16),
            
            
            ownerLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            ownerLabel.topAnchor.constraint(equalTo: createUpdateStack.bottomAnchor, constant: 16),
            ownerImage.widthAnchor.constraint(equalToConstant: 40),
            ownerImage.heightAnchor.constraint(equalTo: ownerImage.widthAnchor, multiplier: 1),
            ownerStack.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            ownerStack.topAnchor.constraint(equalTo: ownerLabel.bottomAnchor, constant: 16),
            
            pullsLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            pullsLabel.topAnchor.constraint(equalTo: ownerStack.bottomAnchor, constant: 16),
            tablePulls.topAnchor.constraint(equalTo: pullsLabel.bottomAnchor),
            tablePulls.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tablePulls.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tablePulls.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
//            tablePulls.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
//            tablePulls.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
//            tablePulls.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
//            tablePulls.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            placeholder.topAnchor.constraint(equalTo: pullsLabel.bottomAnchor, constant: 16),
            placeholder.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            
            
            
//            saveButton.centerYAnchor.constraint(equalTo: repoName.centerYAnchor),
//            saveButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            saveButton.widthAnchor.constraint(equalToConstant: 90),
            saveButton.heightAnchor.constraint(equalToConstant: 40),
            deleteButton.widthAnchor.constraint(equalToConstant: 90),
            deleteButton.heightAnchor.constraint(equalToConstant: 40),
            
            
            
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }

}
