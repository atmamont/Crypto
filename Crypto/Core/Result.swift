//
//  Result.swift
//  Crypto
//
//  Created by Andrey Mamchenko on 12/6/17.
//  Copyright © 2017 Andrey Mamchenko. All rights reserved.
//

import Foundation


enum Result<T> {
    case success(T)
    case failure(Error)
}
