//
//  FilePart.swift
//  NetworkLayer
//
//  Created by Maxim on 01/02/2020.
//  Copyright © 2020 maxim.kruchinin@firstlinesoftware.com. All rights reserved.
//

import Foundation


public struct FilePart: PartType {

    private let mimeType: String
    private let fileName: String
    private let name: String
    private let fileData: Data
    
    private let lineBreak = "\r\n"
    
    init(mimeType: String, fileName: String, name: String, fileData: Data) {
        self.mimeType = mimeType
        self.fileName = fileName
        self.name = name
        self.fileData = fileData
    }

    public func getPartData() -> Data {
        let data = NSMutableData()
        data.appendString("Content-Disposition: form-data; name=\"\(name)\"; filename=\"\(fileName)\"\(lineBreak)")
        data.appendString("Content-Type: \(mimeType + lineBreak + lineBreak)")
        data.append(fileData)
        data.appendString(lineBreak)
        return data as Data
    }
    
}
