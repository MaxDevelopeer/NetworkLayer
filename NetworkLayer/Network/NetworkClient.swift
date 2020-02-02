//
//  APIClient.swift
//  NetworkLayer
//
//  Created by Maxim on 26/01/2020.
//  Copyright © 2020 maxim.kruchinin@firstlinesoftware.com. All rights reserved.
//

import Foundation


public typealias Parameters = [String : Any]
public typealias response = (Result <Data, NetworkClient.NetworkError>) -> ()



protocol NetworkRequestConstructor {
    
   func asURLRequest() -> Result <URLRequest, Error>
    
}


public class NetworkClient {
    
    private let session: URLSession
    
    
    public init(sessionConfiguration: URLSessionConfiguration) {
        self.session = URLSession(configuration: sessionConfiguration)
    }
    
   public init(session: URLSession) {
        self.session = session
    }
    
    
public func requestFor(urlRequest: URLRequest, completion: @escaping response) {

        
       let taskCompletionHandler = { (data: Data?, response: URLResponse?, error: Error?) in
            
            if let error = error {
                completion(.failure(.failedToSendRequest(error: error)))
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.missingResponse))
                return
            }
            
            switch response.statusCode {
            case 200..<400:
                guard let data = data else {
                    completion(.failure(.failedGetDataFromRequest))
                    return
                }
                /* data.debugInfo() */
                completion(.success(data))
            case 400..<500:
                completion(.failure(.clientError(code: response.statusCode)))
            case 500..<600:
                completion(.failure(.serverError(code: response.statusCode)))
            default:
                completion(.failure(.unknownResponseStatusCode(code: response.statusCode)))
            }
            
        }
        
        session.dataTask(with: urlRequest, completionHandler: taskCompletionHandler).resume()
        
    }
    
}


public extension NetworkClient {
    
    enum NetworkError: Error {
        case missingResponse
        case failedCreateRequest
        case failedGetDataFromRequest
        case clientError(code: Int)
        case serverError(code: Int)
        case unknownResponseStatusCode(code: Int)
        case failedToSendRequest(error: Error)
    }
    
    
}
