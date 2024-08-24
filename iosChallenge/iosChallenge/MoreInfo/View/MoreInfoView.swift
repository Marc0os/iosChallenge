//
//  MoreInfoView.swift
//  iosChallenge
//
//  Created by Marcos Costa on 23/08/24.
//

import UIKit

class MoreInfoView: UIView, ViewCode {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints
    
    func setupHierarchy() {
        backgroundColor = .blue
    }
    
    func setupConstraints() {
//        NSLayoutConstraint.activate([
//        
//        ])
    }

}
