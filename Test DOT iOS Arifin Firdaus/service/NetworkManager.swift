//
//  NetworkManager.swift
//  Test DOT iOS Arifin Firdaus
//
//  Created by Arifin Firdaus on 3/16/18.
//  Copyright © 2018 Arifin Firdaus. All rights reserved.
//

import Foundation

struct NetworkManager {
    
    static let PostsUrl = "https://jsonplaceholder.typicode.com/posts"
    
    static func getCommentsUrl(withId id: Int) -> String {
        return "http://jsonplaceholder.typicode.com/posts/\(id)/comments"
    }
    
}
