//
//  CurrenciesListViewModel.swift
//  Crypto
//
//  Created by Andrey Mamchenko on 12/6/17.
//  Copyright © 2017 Andrey Mamchenko. All rights reserved.
//

import Foundation


struct Currency {
    
    let id: String
    let name: String
}

class CurrenciesListViewModel {
    
    typealias CurrencyList = [Currency]
    
    var currencies = CurrencyList()
    
    var didUpdateHandler: ((Error?) -> Void)?
    
    private let dataSource: CurrenciesListDataSource
    
    init(dataSource: CurrenciesListDataSource) {
        self.dataSource = dataSource
        
        reload()
    }
    
    func reload(completion: ((Result<CurrencyList>) -> Void)? = nil) {
        dataSource.load { [weak self] result in
            switch result {
            case .success(let value):
                self?.currencies = value
                self?.didUpdateHandler?(nil)
            case .failure(let error):
                self?.didUpdateHandler?(error)
            }
        }
    }
    
}
