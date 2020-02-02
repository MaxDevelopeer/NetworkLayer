//
//  HTTPMultipartData.swift
//  NetworkLayer
//
//  Created by Maxim on 01/02/2020.
//  Copyright © 2020 maxim.kruchinin@firstlinesoftware.com. All rights reserved.
//

import Foundation


public class MultipartBody {
    
    private let boundary: MultipartBoundary
    private let parts: [PartType]
    
    init(boundary: MultipartBoundary, parts: [PartType]) {
        self.boundary = boundary
        self.parts = parts
    }
    
    
    func getData() -> Data {
        
        let lineBreak = "\r\n"
        let bodyData = NSMutableData()
        
        for part in parts {
            bodyData.appendString(boundary.delimiter + lineBreak)
            bodyData.append(part.getPartData())
        }
        
        bodyData.appendString(boundary.endDelimiter + lineBreak)
        
        return bodyData as Data
    }
    
    
}
