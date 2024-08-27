//
//  MoreInfoViewModel.swift
//  iosChallenge
//
//  Created by Marcos Costa on 25/08/24.
//

import Foundation

class MoreInfoViewModel {
    var pulls = [Pull]()
    
    private let service = DAOService()
    
    func getPulls (owner: String, repository: String, completion: @escaping () -> Void) -> URLSessionDataTask? {
        let urlString = "/repos/\(owner)/\(repository)/pulls"
        
        return NetworkManager.shared.fetchPullsData(urlString: urlString) { pulls, error in
            if let pulls {
                self.pulls = pulls
                completion()
            }
        }
    }
    
    func createRepo (item: Item) {
        service.createRepo(item: item)
    }
    
    func existRepo (id: Int32) -> Bool {
        return service.existRepoById(id: id)
    }
    
    func deleteRepo (id: Int32) {
        return service.deleteRepoByID(id: id)
    }
}
