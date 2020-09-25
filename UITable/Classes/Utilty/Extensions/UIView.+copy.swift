//
//  UIView.swift
//  UITable
//
//  Created by Yasin Akbaş on 9/25/20.
//

import UIKit

extension UIView {
    func copyView<T: UIView>() -> T {
        return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self)) as! T
    }
}
