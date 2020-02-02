//
//  APIEndpoint.swift
//  NetworkLayer
//
//  Created by Maxim on 25/01/2020.
//  Copyright © 2020 maxim.kruchinin@firstlinesoftware.com. All rights reserved.
//

import Foundation


extension APIRouter {
    
    var endpoint: String {
        switch self {
        case .posts:
            return Endpoint.posts
        case .specificPost(let postId):
            return String(format: Endpoint.specificPost, postId)
        case .basicMultipartData:
            return Endpoint.basicMultipart
        }
    }
    
    
}
