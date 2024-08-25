//
//  HomeView.swift
//  iosChallenge
//
//  Created by Marcos Costa on 23/08/24.
//

import UIKit

class HomeView: UIView, ViewCode {
    
    let items = ["Todos", "Salvos"]
    
    let normalAttributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor.white
    ]
    
    // MARK: - UI Components
    
    lazy var segmentedControl: UISegmentedControl = {
        let view = UISegmentedControl(items: items)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.selectedSegmentTintColor = .black
        view.setTitleTextAttributes(normalAttributes, for: .selected)
        view.selectedSegmentIndex = 0
        return view
    }()
    
    lazy var tableGit: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.register(GitTableViewCell.self, forCellReuseIdentifier: "GitCell")
        
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
        addSubview(segmentedControl)
        addSubview(tableGit)
        addSubview(activityIndicator)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            tableGit.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            tableGit.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableGit.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableGit.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: tableGit.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: tableGit.centerYAnchor)
        ])
    }
    
}
