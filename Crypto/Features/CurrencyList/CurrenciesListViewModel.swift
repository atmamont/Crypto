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
    
    var updateHandler: (() -> Void)?
    
    var currencies = [Currency]()
    
    func reload(completion: ((Result<[Currency]>) -> Void)? = nil) {
        
    }
    
}
