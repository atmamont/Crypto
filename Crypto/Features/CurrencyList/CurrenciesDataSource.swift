//
//  CurrenciesDataSource.swift
//  Crypto
//
//  Created by Andrey Mamchenko on 12/6/17.
//  Copyright © 2017 Andrey Mamchenko. All rights reserved.
//

import Foundation

protocol CurrenciesListDataSourceProtocol: class {
    
    associatedtype Item
    typealias ItemList = [Item]
    
    func load(completion: ((Result<ItemList>) -> Void)?)
}


class CurrenciesListDataSource: CurrenciesListDataSourceProtocol {

    private let mockData: [Currency]
        = [("BTC", "Bircoin"),
           ("ETH", "Ethereum")]
            .flatMap { Currency(id: $0.0, name: $0.1) }
    
    typealias Item = Currency
    
    func load(completion: ((Result<[Currency]>) -> Void)?) {
        completion?(.success(mockData))
    }

    
}
