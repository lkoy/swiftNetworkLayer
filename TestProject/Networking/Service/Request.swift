//
//  Request.swift
//  TestProject
//
//  Created by gustavo on 14/06/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String: Any]

public enum DataType {
    case Json
    case Data
}

public enum HTTPMethod : String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
}

public enum HTTPRequestParams {
    case body(_ : [String: Any]?)
    case url(_ : [String: Any]?)
}

public protocol Request { 
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var httpHeaders: HTTPHeaders? { get }
    var httpParameters: HTTPRequestParams { get }
    var dataType: DataType { get } 
}
