//
//  CurrencyCell.swift
//  Crypto
//
//  Created by Andrey Mamchenko on 12/7/17.
//  Copyright © 2017 Andrey Mamchenko. All rights reserved.
//

import UIKit

class CurrencyCell: UITableViewCell, Reusable, NibLoadableView {

    struct Model {
        let id: String
        let title: String
    }
    
    // MARK: - Outlets
    
    @IBOutlet private weak var currencyIDLabel: UILabel!
    @IBOutlet private weak var currencyTitleLabel: UILabel!
    
    // MARK: - Public properties

    var currency: Model? {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        currencyIDLabel.text = nil
        currencyTitleLabel.text = nil
    }
    
    private func updateUI() {
        guard let currency = currency else { return }
        
        currencyIDLabel.text = currency.id
        currencyTitleLabel.text = currency.title
    }

}
