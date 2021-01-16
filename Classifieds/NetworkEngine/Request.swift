//
//  Request.swift
//  Infra
//
//  Created by NewZenTech on 3/23/19.
//  Copyright © 2019 NewZenTech. All rights reserved.
//

import Foundation


protocol Requestable {

    func urlRequest() -> URLRequest
}

// Generates get  request

struct Request: Requestable {
    let path: String
    let method: String

    init(path: String, method: String = "GET") {
        self.path = path
        self.method = method
    }

    func urlRequest() -> URLRequest {
        guard let url = URL(string: path) else {
            return URLRequest(url: URL(fileURLWithPath: ""))
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method

        return urlRequest
    }
}

// Generates post body request

struct PostRequest<Model: Encodable>: Requestable {
    let path: String
    let method: String
    let model: Model

    func urlRequest() -> URLRequest {
        guard let url = URL(string: path) else {
            return URLRequest(url: URL(fileURLWithPath: ""))
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method

        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(model)
            urlRequest.httpBody = data
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch let error {
            
        }

        return urlRequest
    }
}

// Generates form data request

struct FormDataPostRequest: Requestable {
    let path: String
    let method: String
    let params: Dictionary<String,Any>
    
    func urlRequest() -> URLRequest {
        
        let postString = params.compactMap({ (key, value) -> String in
            return "\(key)=\(value)"
        }).joined(separator: "&")
        
        guard let url = URL(string: path) else {
            return URLRequest(url: URL(fileURLWithPath: ""))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        
        
        urlRequest.httpBody = postString.data(using: .utf8)

//        do {
//            let encoder = JSONEncoder()
//            let data = try encoder.encode(model)
//            urlRequest.httpBody = data
//            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        } catch let error {
//            Log.assertFailure("Post request model parsing failed: \(error.localizedDescription)")
//        }
        
        return urlRequest
    }
}

extension URLRequest: Requestable {
    func urlRequest() -> URLRequest {
        return self
    }
}
