//
//  RecomendedMoviesWorker.swift
//  TestProject
//
//  Created by gustavo on 18/08/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import Foundation

class RecomendedMoviesWorker: RequestWorker {
    
    private let networkDispatcher: Dispatcher
    var id: Int
    
    init(id: Int, networkDispatcher: Dispatcher = NetworkDispatcherFactory(environment: Environment("Prod", host: "https://smart.coruna.es/eventos/rest")).makeNetworkProvider()) {
        self.networkDispatcher = networkDispatcher
        self.id = id
    }
    
    var request: Request {
        return MoviesApi.recommended(id: id)
    }
    
    func doWork(with completion: @escaping (Any?) -> ()) {
        do {
            try networkDispatcher.execute(request: request) { (response) in
                switch response {
                case .error(let errorCode, let error):
                    completion(response)
                case .data(let data):
                    completion(response)
                case .json(let json):
                    completion(response)
                }
            }
        } catch(let error) {
            print(error)
        }
    }
}
