//
//  ParamPart.swift
//  NetworkLayer
//
//  Created by Maxim on 01/02/2020.
//  Copyright © 2020 maxim.kruchinin@firstlinesoftware.com. All rights reserved.
//

import Foundation


struct Part: PartType {
    
    private let name: String
    private let value: String
    
    private let lineBreak = "\r\n"
    
    init(name: String, value: String) {
        self.name = name
        self.value = value
    }
    
    func getPartData() -> Data {
        let data = NSMutableData()
        data.appendString("Content-Disposition: form-data; name=\"\(name)\" + \(lineBreak + lineBreak)")
        data.appendString(value + lineBreak)
        return data as Data
    }
    
}
