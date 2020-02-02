//
//  Extensions.swift
//  NetworkLayer
//
//  Created by Maxim on 01/02/2020.
//  Copyright © 2020 maxim.kruchinin@firstlinesoftware.com. All rights reserved.
//

import Foundation


extension NSMutableData {
    
    func appendString(_ string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)
        append(data!)
    }
    
}


extension Dictionary where Key == String, Value == Any {
    
    func createURLComponents() -> [URLQueryItem] {
        return self.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
    }
    
}


public extension Data {
    
    func debugInfo() {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: self, options: .allowFragments) as? [String: Any] else { return }
        let jsonString = String(decoding: self, as: UTF8.self)
        
        print("jsonObject: ", jsonObject)
        print("jsonString:", jsonString)
    }
    
}
