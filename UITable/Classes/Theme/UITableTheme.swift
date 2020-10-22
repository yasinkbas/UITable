//
//  UITableTheme.swift
//  UITable
//
//  Created by Yasin Akbaş on 9/23/20.
//

import Foundation

public class UITableTheme: UITableThemeProvider {
    public var backgroundColor: UIColor            { #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) }
    public var cornerRadius: CGFloat               { 0 }
    public var borderColor: CGColor                { UIColor.black.cgColor }
    public var borderWidth: CGFloat                { 1 }
    public var highlightedColor: UIColor           { #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1) }
    public var highlightedBorderColor: UIColor     { #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1) }
}
