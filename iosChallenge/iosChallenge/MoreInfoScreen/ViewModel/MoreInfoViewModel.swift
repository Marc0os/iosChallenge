//
//  MoreInfoViewModel.swift
//  iosChallenge
//
//  Created by Marcos Costa on 25/08/24.
//

import Foundation

class MoreInfoViewModel {
    var pulls = [Pull]()
    var pullsCoreData = [Pull]()
    
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
    
    func getPullsCoreData(repoID: Int32) {
        pullsCoreData = service.getPullsByRepoID(repoID: repoID)!
    }
    
    func createRepo (item: Item, pulls: [Pull]) {
        service.createRepo(item: item, pulls: pulls)
    }
    
    func existRepo (id: Int32) -> Bool {
        return service.existRepoById(id: id)
    }
    
    func deleteRepo (id: Int32) {
        return service.deleteRepoByID(id: id)
    }
}
