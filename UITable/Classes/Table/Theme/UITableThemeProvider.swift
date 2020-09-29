//
//  UITableThemeProvider.swift
//  UITable
//
//  Created by Yasin Akbaş on 9/23/20.
//

import Foundation

protocol UITableThemeProvider {
    var backgroundColor: UIColor        { get }
    var cornerRadius: CGFloat           { get }
    var borderColor: CGColor            { get }
    var borderWidth: CGFloat            { get }
    var highlightedColor: UIColor       { get }
    var highlightedBorderColor: UIColor { get }
}
