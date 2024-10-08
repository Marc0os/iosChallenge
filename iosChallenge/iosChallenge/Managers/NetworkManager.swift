//
//  NetworkManager.swift
//  iosChallenge
//
//  Created by Marcos Costa on 24/08/24.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    let basicURL = "https://api.github.com"
    
    func fetchReposData(urlString: String, completion: @escaping ([Item]?, String?) -> Void) -> URLSessionDataTask? {
        
        guard let url = URL(string: basicURL + urlString) else { return nil }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let data {
                let dataModel = try? JSONDecoder().decode(GitModel.self, from: data)
                completion(dataModel?.items, nil)
            } else {
                completion(nil, "Error")
            }
        }
        task.resume()
        return task
    }
    
    func fetchPullsData(urlString: String, completion: @escaping ([Pull]?, String?) -> Void) -> URLSessionDataTask? {
        
        guard let url = URL(string: basicURL + urlString) else { return nil }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let data {
                do {
                    let dataModel = try JSONDecoder().decode([Pull].self, from: data)
                    completion(dataModel, nil)
                } catch{
                    print(error)
                }
                
                
            } else {
                completion(nil, "Error")
            }
        }
        task.resume()
        return task
    }
}
