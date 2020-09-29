//
//  UIStyle.swift
//  UITable
//
//  Created by Yasin Akbaş on 9/23/20.
//

import Foundation

public struct UIStyle<T> {
    let apply: (T) -> Void
}

public extension UIStyle {
    func compose(with style: UIStyle<T>, configuration: @escaping (T) -> Void = { _ in }) -> UIStyle<T> {
        UIStyle<T> {
            self.apply($0)
            style.apply($0)
            configuration($0)
        }
    }
}
