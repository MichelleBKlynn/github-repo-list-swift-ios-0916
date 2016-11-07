//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
    
    typealias JSON = [[String : AnyObject]]
    
    static func getRepositories(with completion: @escaping (JSON) -> Void) {
        
        let string = Github.baseURL + "/repositories" + "?client_id=\(Github.clientID)" + "&client_secret=\(Github.clientSecret)"
        
        guard let url = URL(string: string) else { return }
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let request = URLRequest(url: url)
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! JSON
                completion(json)
            } catch {
                
            }
            
        }
        
        dataTask.resume()
    }
    
    
}




