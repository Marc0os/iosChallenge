//
//  NoPullTableViewCell.swift
//  iosChallenge
//
//  Created by Marcos Costa on 27/08/24.
//

import UIKit

class NoPullTableViewCell: UITableViewCell, ViewCode {
    
    lazy var placeholder: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "There's no pulls yet"
        view.font = .systemFont(ofSize: 22, weight: .heavy)
        view.lineBreakMode = .byTruncatingTail
        view.textColor = .gray
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "NoPullCell")
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHierarchy() {
        backgroundColor = .white
        addSubview(placeholder)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            placeholder.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            placeholder.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            placeholder.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }

}
