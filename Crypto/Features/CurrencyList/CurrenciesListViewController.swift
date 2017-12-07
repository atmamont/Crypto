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
        
        
        navigationItem.title = "Currencies list"
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(cell: CurrencyCell.self)
        
        tableView.reloadData()
    }
    
    

    // MARK: - Public methods
    
    func bind(viewModel: CurrenciesListViewModel) {
        self.viewModel = viewModel
        
        viewModel.didUpdateHandler = { [weak self] error in
            self?.tableView.reloadData()
        }
    }
    
    // MARK: - Private methods
    
    private func updateUI() {
    }
    
    fileprivate func setup(_ cell: CurrencyCell, for indexPath: IndexPath) {
        guard let item = viewModel?.currencies[indexPath.row] else {
            return
        }
        let model = CurrencyCell.Model(id: item.id, title: item.name)
        cell.currency = model
    }

}

// MARK: - UITableViewDelegate

extension CurrenciesListViewController: UITableViewDelegate {}

// MARK: - UITableViewDataSource

extension CurrenciesListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.currencies.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CurrencyCell = tableView.dequeueReusableCell(for: indexPath)
        setup(cell, for: indexPath)
        return cell
    }
    
}
