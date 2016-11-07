//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubRepository {
    let fullName: String
    let htmlURL: URL
    let repositoryID: Int
    
    init(dictionary: [String : Any]) {
        self.fullName = dictionary["full_name"] as! String
        self.repositoryID = dictionary["id"] as! Int 
        let stringURL = dictionary["html_url"] as! String
        htmlURL = URL(string: stringURL)!
        
    }
    
}

