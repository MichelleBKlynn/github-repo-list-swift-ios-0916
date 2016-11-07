//
//  AppDelegate.swift
//  github-repo-list-swift
//
//  Created by susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import OHHTTPStubs

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if isRunningTests() {
            OHHTTPStubs.stubRequests(passingTest: { (request) -> Bool in
                
                return(request.url?.host == "api.github.com" && request.url?.path == "/repositories")
                
            }) { (request) -> OHHTTPStubsResponse in
                let response = OHHTTPStubsResponse(fileAtPath: OHPathForFileInBundle("repositories.json", Bundle(for: type(of: self)))!, statusCode: 200, headers: ["Content-Type": "application/json"])
                return response
            }
        }
        
        GithubAPIClient.getRepositories { repos in
             
            print("We're all good")
            print(repos)
            
        }
        
        return true
    }
    
    func isRunningTests() -> Bool {
        let env = ProcessInfo.processInfo.environment
        if let injectBundle = env["XCTestConfigurationFilePath"] {
            return NSString(string: injectBundle).pathExtension == "xctestconfiguration"
        }
        return false
    }

    
}



