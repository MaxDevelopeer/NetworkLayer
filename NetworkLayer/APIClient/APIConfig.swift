//
//  APIConfig.swift
//  NetworkLayer
//
//  Created by Maxim on 25/01/2020.
//  Copyright © 2020 maxim.kruchinin@firstlinesoftware.com. All rights reserved.
//

import Foundation


struct ApiConfig {
   
    #if DEBUG
    static let baseUrl = "http://example1"
    static let authHeader = "Basic EXAMPLE1="
    #endif
    
    
    #if RELEASE
    static let baseUrl = "https://example2"
    static let authHeader = "Basic EXAMPLE2=="
    #endif

}

struct ApiHeader {
    static let appVersion = "DD-APP-VERSION"
    static let appBuild = "DD-APP-BUILD"
    static let appOS = "DD-OS"
    static let authorization = "Authorization"
}


struct Endpoint {
    static let basic = "/api/v1/example"
    static let basicWithParam = "/api/v1/examples/%@"
}


struct Defaults {
    static let Cookie = "Cookie"
    static let SessionCookies = "SessionCookies"
    static let APNSToken = "APNSToken"
    static let ISDDNewInstalled = "ISDDNewInstalled"
    static let LastViewedNotificationTime = "lastViewedNotificationTime"
}
