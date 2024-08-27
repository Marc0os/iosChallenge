//
//  HomeViewModel.swift
//  iosChallenge
//
//  Created by Marcos Costa on 24/08/24.
//

import Foundation

class HomeViewModel {
    var items = [Item]()
    var itemsCoreData = [Item]()
    let service = DAOService()
    var currentPage = 1
    
    func getRepos (page: Int = 1,completion: @escaping () -> Void){
        
        let urlString = "/search/repositories?q=language:Swift&sort=stars&page=\(page)"
        
        NetworkManager.shared.fetchReposData(urlString: urlString) { items, error in
            if let items {
                
                if page == 1{
                    self.items = items
                }else{
                    self.items.append(contentsOf: items)
                }
                
                completion()
            }
        }
    }
    
    func getReposCoreData() {
        self.itemsCoreData = service.getItems()
    }
}
