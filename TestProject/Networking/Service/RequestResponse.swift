//
//  RequestResponse.swift
//  TestProject
//
//  Created by gustavo on 15/06/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import Foundation

public enum NetworkErrors: Error {
    case badInput
    case invalidResponse
    case noData
}

public enum Response {
    case json(_: Any)
    case data(_: Data)
    case error(_: Int?, _: Error?)
    
    init(_ response: (r: URLResponse?, d: Data?, e: Error?), for request: Request) {
        guard let res = response.r as? HTTPURLResponse else {
            self = .error(400, NetworkErrors.invalidResponse)
            return
        }
        
        guard res.statusCode == 200, response.e == nil else {
            self = .error(res.statusCode, response.e)
            return
        }
        
        guard let data = response.d else {
            self = .error(res.statusCode, NetworkErrors.noData)
            return
        }
        
        switch request.dataType {
        case .Data:
            self = .data(data)
        case .Json:
            self = .json(data)
        }
    }
}
