//
//  APIConfig.swift
//  NetworkLayer
//
//  Created by Maxim on 25/01/2020.
//  Copyright © 2020 maxim.kruchinin@firstlinesoftware.com. All rights reserved.
//

import Foundation


struct ApiConfig {
   
    #if DEBUG
    static let baseUrl = "https://jsonplaceholder.typicode.com"
    static let authHeader = "Basic EXAMPLE1=="
    #endif
    
    
    #if RELEASE
    static let baseUrl = "https://example"
    static let authHeader = "Basic EXAMPLE2=="
    #endif

}


struct Endpoint {
    static let posts = "/posts"
    static let specificPost = "/posts/%@"
    static let basicMultipart = "/exampleMultipart"
}
