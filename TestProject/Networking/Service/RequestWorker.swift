//
//  RequestWorker.swift
//  TestProject
//
//  Created by gustavo on 16/06/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import Foundation

protocol RequestWorker {
    associatedtype Output
    
    //work request to be executed in dispatcher
    var request: Request { get }
    
    //execute work request in dispatcher
    func doWork(with completion: @escaping (Output) -> ())
}
