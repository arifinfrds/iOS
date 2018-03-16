//
//  PostElement.swift
//  Test DOT iOS Arifin Firdaus
//
//  Created by Arifin Firdaus on 3/16/18.
//  Copyright © 2018 Arifin Firdaus. All rights reserved.
//



// To parse the JSON, add this file to your project and do:
//
//   let welcome = try Welcome(json)
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseWelcome { response in
//     if let welcome = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

typealias Posts = [PostElement]

struct PostElement: Codable {
    let userID: Int
    let id: Int
    let title: String
    let body: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id = "id"
        case title = "title"
        case body = "body"
    }
}

// MARK: Convenience initializers

extension PostElement {
    init(data: Data) throws {
        self = try JSONDecoder().decode(PostElement.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Array where Element == Posts.Element {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Posts.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}








