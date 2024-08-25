//
//  MoreInfoViewModel.swift
//  iosChallenge
//
//  Created by Marcos Costa on 25/08/24.
//

import Foundation

class MoreInfoViewModel {
    var pulls = [Pull]()
    
    func getPulls (owner: String, repository: String, completion: @escaping () -> Void){
        let urlString = "/repos/\(owner)/\(repository)/pulls"
        
        NetworkManager.shared.fetchPullsData(urlString: urlString) { pulls, error in
            if let pulls {
                self.pulls = pulls
                completion()
            }
        }
    }
}
