//
//  CurrenciesListViewController.swift
//  Crypto
//
//  Created by Andrey Mamchenko on 12/6/17.
//  Copyright © 2017 Andrey Mamchenko. All rights reserved.
//

import UIKit

class CurrenciesListViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    var viewModel: CurrenciesListViewModel?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(cell: CurrencyCell.self)
    }

    // MARK: - Public methods
    
    func bind(viewModel: CurrenciesListViewModel) {
        self.viewModel = viewModel
        
        updateUI()
    }
    
    // MARK: - Private methods
    
    private func updateUI() {
        
    }
    
    fileprivate func setup(_ cell: CurrencyCell) {
        cell.
    }

}

// MARK: - UITableViewDelegate

extension CurrenciesListViewController: UITableViewDelegate {}

// MARK: - UITableViewDataSource

extension CurrenciesListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.currencies.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CurrencyCell = tableView.dequeueReusableCell(for: indexPath)
        setup(cell)
        return cell
    }
    
}
