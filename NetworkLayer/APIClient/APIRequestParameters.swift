//
//  HTTPRequestParameters.swift
//  NetworkLayer
//
//  Created by Maxim on 25/01/2020.
//  Copyright © 2020 maxim.kruchinin@firstlinesoftware.com. All rights reserved.
//

import Foundation


extension ApiRouter {
    
    var params: Parameters {
        switch self {
        case .basicWithParam(let param1):
            return ["param1": param1]
        default:
            return [:]
        }
    }
    
}
