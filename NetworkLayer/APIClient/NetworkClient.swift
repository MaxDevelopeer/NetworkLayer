//
//  APIClient.swift
//  NetworkLayer
//
//  Created by Maxim on 26/01/2020.
//  Copyright © 2020 maxim.kruchinin@firstlinesoftware.com. All rights reserved.
//

import Foundation


typealias Parameters = [String : Any]
typealias response = (Result <Data,NetworkClient.NetworkError>) -> ()



protocol HTTPRequestProtocol {
    
    func getDataWith(completion: @escaping response)
    
}


class NetworkClient {
    
    private let session: URLSession
    
    
    enum NetworkError: Error {
        case missingResponse
        case failedCreateRequest
        case failedGetDataFromRequest
        case clientError(code: Int)
        case serverError(code: Int)
        case unknownResponseStatusCode(code: Int)
        case failedToSendRequest(error: Error)
    }
    
    
    
    init(session: URLSession) {
        self.session = session
    }
    
    
    func requestFor(resource: NetworkRequestConstructor, completion: @escaping response) throws {
        
        
        guard let request = try? resource.asUrlRequest() else {
            throw NetworkError.failedCreateRequest
        }
        
        
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
        
        
        session.dataTask(with: request, completionHandler: taskCompletionHandler)
        
        
//        switch method {
//        case HTTPMethod.get.rawValue:
//            session.dataTask(with: request, completionHandler: taskCompletionHandler)
//        case HTTPMethod.post.rawValue:
//            session.uploadTask(with: request, from: <#T##Data?#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
//        default:
//            break
//        }
        
        
        
    }
    
    
    func sendRequest(_ request: URLRequest, completion: @escaping response) {
        
        self.session.dataTask(with: request)
        
        
    }
    
    
    func basicPostRequest(request: URLRequest, completion: @escaping response) {
        
        
        
        
    }
    
    
}


extension Data {
    
    func debugInfo() {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: self, options: .allowFragments) as? [String: Any] else { return }
        let jsonString = String(decoding: self, as: UTF8.self)
        
        print("jsonObject: ", jsonObject)
        print("jsonString:", jsonString)
    }
    
}



// core layer
protocol NetworkRequestConstructor {
    
   func asUrlRequest() throws -> URLRequest
    
}
