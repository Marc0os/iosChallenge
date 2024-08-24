//
//  HomeView.swift
//  iosChallenge
//
//  Created by Marcos Costa on 23/08/24.
//

import UIKit

class HomeView: UIView, ViewCode {
    
    let items = ["item1", "item2"]
    
    // MARK: - UI Components
    
    lazy var segmentedControl: UISegmentedControl = {
        let view = UISegmentedControl(items: items)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.selectedSegmentIndex = 0
        return view
    }()
    
    lazy var tableGit: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.register(GitTableViewCell.self, forCellReuseIdentifier: "GitCell")
        
        return view
    }()
        
    lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "AaaaAAAAAAAAAAAA"
        view.textAlignment = .center
        view.textColor = .black
        view.font = .systemFont(ofSize: 14, weight: .regular)
        
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
        backgroundColor = .green
        addSubview(segmentedControl)
        addSubview(tableGit)
//        addSubview(label)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            tableGit.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            tableGit.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableGit.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableGit.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
//            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        
        
        ])
    }
    
}
