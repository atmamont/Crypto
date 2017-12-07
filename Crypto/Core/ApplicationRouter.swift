//
//  ApplicationRouter.swift
//  Crypto
//
//  Created by Andrey Mamchenko on 12/7/17.
//  Copyright © 2017 Andrey Mamchenko. All rights reserved.
//

import UIKit


class ApplicationRouter {
    
    private let rootVC: UINavigationController
    
    init(withNavigationController rootVC: UINavigationController) {
        self.rootVC = rootVC
    }
    
    func startAppFlow() {
        let dataSource = CurrenciesListDataSource()
        let viewModel = CurrenciesListViewModel(dataSource: dataSource)
        
        let vc = CurrenciesListViewController()
        vc.bind(viewModel: viewModel)
        
        rootVC.viewControllers = [vc]
    }
    
}
