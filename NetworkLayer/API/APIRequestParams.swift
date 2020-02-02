//
//  HTTPRequestParameters.swift
//  NetworkLayer
//
//  Created by Maxim on 25/01/2020.
//  Copyright © 2020 maxim.kruchinin@firstlinesoftware.com. All rights reserved.
//

import Foundation


extension APIRouter {
    
    var params: Parameters {
        switch self {
        case .specificPost(let postId):
            return ["param1": postId]
        default:
            return [:]
        }
    }
    
}
