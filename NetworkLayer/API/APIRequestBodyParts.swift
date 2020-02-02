//
//  APIRequestBody.swift
//  NetworkLayer
//
//  Created by Maxim on 01/02/2020.
//  Copyright © 2020 maxim.kruchinin@firstlinesoftware.com. All rights reserved.
//

import Foundation

extension APIRouter {
    
    var bodyParts: [PartType] {
        switch self {
        case .basicMultipartData(let files):
            return files
        default:
            return []
        }
        
    }
    
    
}
