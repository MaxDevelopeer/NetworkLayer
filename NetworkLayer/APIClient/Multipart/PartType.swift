//
//  PartType.swift
//  NetworkLayer
//
//  Created by Maxim on 01/02/2020.
//  Copyright © 2020 maxim.kruchinin@firstlinesoftware.com. All rights reserved.
//

import Foundation

public protocol PartType {
    func getPartData() -> Data
}
