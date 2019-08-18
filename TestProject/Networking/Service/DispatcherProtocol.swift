//
//  DispatcherProtocol.swift
//  TestProject
//
//  Created by gustavo on 15/06/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import Foundation

public protocol Dispatcher {
    
    //Configure the dispatcher with an environment
    init(environment: Environment)
    
    //This function executes the request and provide a response
    func execute(request: Request, completion: @escaping (Response) -> ()) throws
}
