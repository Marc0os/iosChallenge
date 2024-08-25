//
//  HomeViewModel.swift
//  iosChallenge
//
//  Created by Marcos Costa on 24/08/24.
//

import Foundation

class HomeViewModel {
    var items = [Item]()
    
    func getRepos (completion: @escaping () -> Void){
        let urlString = "/search/repositories?q=language:Swift&sort=stars"
        
        NetworkManager.shared.fetchReposData(urlString: urlString) { items, error in
            if let items {
                self.items = items
                completion()
            }
        }
    }
}
