//
//  UITableView+Extension.swift
//  Classifieds
//
//  Created by Sateesh on 15/01/2021.
//

import UIKit

public extension UITableView {
    
    func register<T: UITableViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellReuseIdentifier: className)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: type.className, for: indexPath) as? T else {
            fatalError()
        }
        return cell
    }
    
    func register<T: UITableViewHeaderFooterView>(reusableViewType: T.Type, bundle: Bundle? = nil) {
        let className = reusableViewType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forHeaderFooterViewReuseIdentifier: className)
    }
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(with type: T.Type) -> T {
        guard let  reusableView = self.dequeueReusableHeaderFooterView(withIdentifier: type.className) as? T else {
            fatalError()
        }
        return reusableView
    }
}
