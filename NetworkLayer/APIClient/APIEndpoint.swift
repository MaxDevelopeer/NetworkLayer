//
//  APIEndpoint.swift
//  NetworkLayer
//
//  Created by Maxim on 25/01/2020.
//  Copyright © 2020 maxim.kruchinin@firstlinesoftware.com. All rights reserved.
//

import Foundation


extension ApiRouter {
    
    var endpoint: String {
        switch self {
        case .basic:
            return Endpoint.basic
        case .basicWithParam(let number):
            return String(format: Endpoint.basicWithParam, number)
        }
    }
    
    
}
