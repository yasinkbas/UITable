//
//  Stylable.swift
//  UITable
//
//  Created by Yasin Akbaş on 9/23/20.
//

import UIKit

public protocol Stylable {
    init()
}

public extension Stylable {
    init(style: UIStyle<Self>) {
        self.init()
        apply(style)
    }
    
    func apply(_ style: UIStyle<Self>) {
        style.apply(self)
    }
}

extension UIView: Stylable { }
