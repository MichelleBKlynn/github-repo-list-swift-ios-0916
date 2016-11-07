//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    var repositories = [GithubRepository]()
    
    func getRepositoriesFromAPI(with completion:@escaping () -> ()) {
        GithubAPIClient.getRepositories { (data) in
            self.repositories.removeAll()
            
            for dictionary in data {
                let items = GithubRepository(dictionary: dictionary)
                self.repositories.append(items)
            }
            print(data.count)
            completion() 
        }
    }
}
