//
//  MultipartBoundary.swift
//  NetworkLayer
//
//  Created by Maxim on 01/02/2020.
//  Copyright © 2020 maxim.kruchinin@firstlinesoftware.com. All rights reserved.
//

import Foundation

public struct MultipartBoundary {
    
    private let uuid = UUID()
    
    var boundaryString: String {
        return "Boundary-\(uuid.uuidString)"
    }
    
    var delimiter: String {
        return "--\(boundaryString)"
    }
    
    var endDelimiter: String {
        return "--\(boundaryString)--"
    }
    
}
