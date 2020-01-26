//
//  APIRouter.swift
//  NetworkLayer
//
//  Created by Maxim on 25/01/2020.
//  Copyright © 2020 maxim.kruchinin@firstlinesoftware.com. All rights reserved.
//

import Foundation


public enum ApiRouter {
    
    case basic
    
    case basicWithParam(
        param1: Int
    )
    
    case basicMultipartData(
        photo: MultipartData
    )

    
    
   private var method: HTTPMethod {
        switch self {
        case .basicWithParam, .basicMultipartData:
            return .post
        default:
            return .get
        }
    }
    
    
//    var baseUrl:String {
//        switch self {
//        case .geocodeAddress, .geocodeCoordinates:
//            return ApiConfig.geocodeUrl
//        default:
//            return ApiConfig.baseUrl
//        }
//    }
    
   private var encodeType: EncodeType {
        switch self {
        case .basicWithParam:
            return .JSONEnocde
        default:
            return .URLEncode
        }
    }

    
    
   private var timeoutInterval: TimeInterval {
        switch self {
        case .basic:
            return 120
        default:
            return 20
        }
    }
    
    
    private var contentType: [String : String] {
        
        switch self {
        case .basic:
            <#code#>
        default:
            <#code#>
        }
        
        
    }
 
    
//    var headers: [(String, String)]? {
//        switch self {
//        case .uploadImage(_,_,let boundary):
//            return [("Content-Type", "multipart/form-data; boundary=\(boundary)")]
//        case .mosregPollTokened(_, let token):
//            return [ ("mosreg-token", token) ]
//        case .getAllClaims, .getMyClaims:
//            return [("Content-Type", "application/json")]
//        default:
//            return nil
//        }
//    }
    
    func createRequestFor(resourse: String, with params: [String : Any], and type: EncodeType) throws ->  URLRequest {

        var urlRequest: URLRequest
        
        switch type {
        case .JSONEnocde:
            guard let url = URL(string: resourse) else { throw Errors.jsonEncodeError }
            let data = try? JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
            urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = method.rawValue
            urlRequest.httpBody = data
        case .URLEncode:
            guard var urlComponents = URLComponents(string: resourse) else { throw Errors.urlEncodeError }
            urlComponents.queryItems = params.createURLComponents()
            guard let url = urlComponents.url else { throw Errors.urlEncodeError }
            urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = method.rawValue
        case .MultipartDataEncode:
            <#code#>
        }
        
        return urlRequest
        
    }
    
    
    func asURLRequest() throws -> URLRequest {

        let resourse = ApiConfig.baseUrl + self.endpoint

        guard let urlRequest = try? createRequestFor(resourse: resourse, with: self.params, and: encodeType) else { fatalError() }

        return urlRequest
    }
    
    
}

extension Dictionary where Key == String, Value == Any {
    
    func createURLComponents() -> [URLQueryItem] {
        return self.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
    }
    
}

// http://httpbin.org/image


enum Errors: Error {
    
    case jsonEncodeError
    case urlEncodeError
    
}
