//
//  Network.swift
//  Infra
//
//  Created by NewZenTech on 3/23/19.
//  Copyright © 2019 NewZenTech. All rights reserved.
//

import Foundation
import UIKit

class Network {
    static let shared = Network()
    
    enum NetworkError: Error {
        case noDataOrError
    }
    
    struct StatusCodeError: LocalizedError {
        let code: Int
        
        var errorDescription: String? {
            return "An error occurred communicating with the server. Please try again."
        }
    }
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    var session = URLSession(configuration: .default)
    
    // MARK: - API
    
    @discardableResult
    func send<T: Parsable>(_ request: Requestable, completion: @escaping (Result<T, Error>)->Void) -> NetworkTask {
        return send(request) { (result: Result<DecodableConvertible<T>, Error>) in
            completion(result.map { $0.model })
        }
    }
    
    
    @discardableResult
    func send<T: DataParsable>(_ request: Requestable,
                               completion: @escaping (Result<T, Error>)->Void) -> NetworkTask {
        return send(request,
                    taskCreator: {
                        urlRequest, completion in
                        self.session.dataTask(with: urlRequest,completionHandler: completion)
                    },
                    dataConvertor: {
                        try T.convert(from: $0)
                    },
                    completion: completion
        )
    }
    
    
    
    // MARK: - Main Networking Logic
    
    
    private func send<DataType, ReturnType>(_ request: Requestable,
                                            taskCreator: @escaping ((URLRequest, @escaping (DataType?, URLResponse?, Error?)->Void)->URLSessionTask),
                                            dataConvertor: @escaping (DataType?) throws -> ReturnType,
                                            completion: @escaping (Result<ReturnType, Error>)->Void) -> NetworkTask {
        // Create a network task to immediately return
        let networkTask = NetworkTask()
        
        let backgroundTaskID = UIApplication.shared.beginBackgroundTask(expirationHandler: nil)
        
        // Go to a background queue as request.urlRequest() may do json parsing
        DispatchQueue.global(qos: .userInitiated).async {
            let urlRequest = request.urlRequest()
            
            let urlToLog = urlRequest.url?.absoluteString ?? ""
            
            
            let task = taskCreator(urlRequest) { data, response, error in
                let result: Result<ReturnType, Error>
                
                //                if let parseData = data{
                //                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
                //                    print("Response str-->\(str)")
                //                }
                
                if let error = error {
                    result = .failure(error)
                } else if let error = self.error(from: response, with: request) {
                    result = .failure(error)
                } else {
                    do {
                        result = .success(try dataConvertor(data))
                    } catch let error {
                        result = .failure(error)
                    }
                }
                
                if case let .failure(error) = result {
                } else {
                }
                
                DispatchQueue.main.async {
                    completion(result)
                    
                    UIApplication.shared.endBackgroundTask(backgroundTaskID)
                }
            }
            
            task.resume()
            
            
            networkTask.set(task)
        }
        
        return networkTask
    }
    
    // MARK: Helpers
    
    private func error(from response: URLResponse?, with request: Requestable) -> Error? {
        guard let response = response as? HTTPURLResponse else {
            return nil
        }
        
        let statusCode = response.statusCode
        if statusCode >= 200 && statusCode <= 299 {
            return nil
        } else {
            return StatusCodeError(code: statusCode)
        }
    }
    
    // MARK: - File Handling
    
    private func moveFile(from origin: URL, to destination: URL) throws {
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: destination.path) {
            try fileManager.removeItem(at: destination)
        }
        
        try fileManager.moveItem(at: origin, to: destination)
    }
}
