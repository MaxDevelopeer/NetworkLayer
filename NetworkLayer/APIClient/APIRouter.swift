//
//  APIRouter.swift
//  NetworkLayer
//
//  Created by Maxim on 25/01/2020.
//  Copyright © 2020 maxim.kruchinin@firstlinesoftware.com. All rights reserved.
//

import Foundation


public enum APIRouter {
    
    case posts
    
    case specificPost(
        postId: Int
    )
    
    case basicMultipartData(
        files: [PartType]
    )
    
    
   private var method: HTTPMethod {
        switch self {
        case .basicMultipartData:
            return .post
        default:
            return .get
        }
    }
    
   private var encodeType: EncodeType {
        switch self {
        case .specificPost:
            return .JSONEncode(params: params)
        case .basicMultipartData:
            return .MultipartDataEncode(parts: bodyParts, boundary: MultipartBoundary())
        default:
            return .URLEncode(params: params)
        }
    }

   private var timeoutInterval: TimeInterval {
        switch self {
        case .basicMultipartData:
            return 120
        default:
            return 20
        }
    }
    
}



extension APIRouter: NetworkRequestConstructor {
    
    
    func asURLRequest() -> Result<URLRequest, Error> {
        
        let resourse = ApiConfig.baseUrl + endpoint
        
        guard let url = URL(string: resourse) else {
            fatalError("can't create URL by resourse: \(resourse)")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        switch encodeType.encode(request: urlRequest) {
        case .failure(let error):
            return .failure(error)
        case .success(let request):
            return .success(request)
        }
        
    }

    
}
