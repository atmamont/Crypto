//
//  Reusable.swift
//  Crypto
//
//  Created by Andrey Mamchenko on 12/7/17.
//  Copyright © 2017 Andrey Mamchenko. All rights reserved.
//

import UIKit


protocol Reusable: class {
    
    static var defaultReuseIdentifier: String { get }
    
}


extension Reusable {
    
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
    
}


// MARK: - NibLoadableView

protocol NibLoadableView: class {
    
    static var nibName: String { get }
    
}


extension NibLoadableView where Self: UIView {
    
    static var nibName: String {
        return String(describing: self)
    }
    
}

// MARK: - UITableView

extension UITableView {
    
    func register<T: UITableViewCell>(cell: T.Type) where T: Reusable, T: NibLoadableView {
        let nib = UINib(nibName: T.nibName, bundle: Bundle.main)
        register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func register<T: UITableViewHeaderFooterView>(headerFooterView: T.Type) {
        register(headerFooterView, forHeaderFooterViewReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<T: Reusable>(for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as! T
    }
    
    func dequeueReusableHeaderFooterView<T: Reusable>() -> T {
        return self.dequeueReusableHeaderFooterView(withIdentifier: T.defaultReuseIdentifier) as! T
    }
    
}


extension UITableViewHeaderFooterView: Reusable {}
