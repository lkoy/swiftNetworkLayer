//
//  ServiceError.swift
//  TestProject
//
//  Created by gustavo on 15/06/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import Foundation

struct UnknownParseError: Error { }

struct ServiceError: Error, Codable {
    let httpStatus: Int
    let message: String
    let description: String?
}
