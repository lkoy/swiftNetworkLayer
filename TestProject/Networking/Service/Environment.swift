//
//  Environment.swift
//  TestProject
//
//  Created by gustavo on 14/06/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import Foundation

public struct Environment {
    
    //Name of the environment
    public var name: String
    
    //Base URL of the environment
    public var host: String
    
    //This is the list of common headers which will be part of each Request
    public var headers: [String: Any] = [:]
    
    //Cache policy
    public var cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData
    
    //Initialize a new Environment
    public init(_ name: String, host: String) {
        self.name = name
        self.host = host
    }
}
