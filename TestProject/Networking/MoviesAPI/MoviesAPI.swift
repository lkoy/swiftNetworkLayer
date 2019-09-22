//
//  MoviesAPI.swift
//  TestProject
//
//  Created by gustavo on 18/08/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import Foundation

public enum MoviesApi {
    case recommended(id:Int)
    case popular(page:Int)
}

extension MoviesApi: Request {
    
    public var path: String {
        switch self {
        case .recommended(let id):
            return "/obtenerSeccionCategorias/es"
        case .popular:
            return "popular"
        }
    }
    
    public var httpMethod: HTTPMethod {
        return .get
    }
    
    public var httpHeaders: HTTPHeaders? {
        return [:]
    }
    
    public var httpParameters: HTTPRequestParams {
        return .body([:])
    }
    
    public var dataType: DataType {
        return .Json
    }
}
