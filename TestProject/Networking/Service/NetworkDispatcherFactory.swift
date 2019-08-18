//
//  NetworkDispatcherFactory.swift
//  TestProject
//
//  Created by gustavo on 15/06/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import Foundation

public class NetworkDispatcherFactory {
    
    private var environment: Environment
    
    required public init(environment: Environment) {
        self.environment = environment
    }
    
    func makeNetworkProvider() -> Dispatcher {
        return NetworkDispatcher(environment: environment)
    }
}

private extension NetworkDispatcherFactory {
    
    class NetworkDispatcher: Dispatcher {
        
        let session: URLSession
        let environment: Environment
        
        required init(environment: Environment) {
            self.session = URLSession(configuration: .default)
            self.environment = environment
        }
        
        deinit {
            //cancelAllRequests()
        }
        
        func execute(request: Request, completion: @escaping (Response) -> ()) throws {
            let urlRequest = try self.prepare(request: request)
            URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                let response = Response((r: response, d: data, e: error), for: request)
                completion(response)
                }.resume()
        }
        
        func prepare(request: Request) throws -> URLRequest {
            
            //1. format the endpoint url using host url and path
            let fullUrl = "\(environment.host)/\(request.path)"
            
            //2. create an api request object with the url
            var apiRequest = URLRequest(url: URL(string: fullUrl)!)
            
            //3. set api request parameters either as body or as query params
            switch request.httpParameters {
            case .body(let params):
                if let params = params as? [String : String] {
                    let body = try? JSONEncoder().encode(params)
                    apiRequest.httpBody = body
                } else {
                    throw NetworkErrors.badInput
                }
                
            case .url(let params):
                if let params = params as? [String : String] {
                    let queryParams = params.map { pair  in
                        return URLQueryItem(name: pair.key, value: pair.value)
                    }
                    guard var components = URLComponents(string: fullUrl) else {
                        throw NetworkErrors.badInput
                    }
                    components.queryItems = queryParams
                    apiRequest.url = components.url
                } else {
                    throw NetworkErrors.badInput
                }
            }
            
            //4. set api request header using common enviorment header parameters and specific request parameters
            environment.headers.forEach { apiRequest.addValue($0.value as! String, forHTTPHeaderField: $0.key) }
            request.httpHeaders?.forEach { apiRequest.addValue($0.value as! String, forHTTPHeaderField: $0.key) }
            
            //5. set api request http method
            apiRequest.httpMethod = request.httpMethod.rawValue
            return apiRequest
        }
    }
}
