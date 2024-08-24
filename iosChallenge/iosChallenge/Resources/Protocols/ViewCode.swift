//
//  ViewCode.swift
//  iosChallenge
//
//  Created by Marcos Costa on 23/08/24.
//

import Foundation

protocol ViewCode{
    func setupHierarchy()
    func setupConstraints()
    func setupAdditionalConfig()
}

extension ViewCode{
    func setupView(){
        setupHierarchy()
        setupConstraints()
        setupAdditionalConfig()
    }
    
    func setupHierarchy() {}
    func setupConstraints() {}
    func setupAdditionalConfig() {}
}
