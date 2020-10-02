//
//  DefaultTableTheme.swift
//  UITable
//
//  Created by Yasin Akbaş on 9/23/20.
//

import Foundation

class DefaultTableTheme: UITableTheme {
    override var backgroundColor: UIColor           { #colorLiteral(red: 0.07160059363, green: 0.1047714129, blue: 0.1546424925, alpha: 1) }
    override var cornerRadius: CGFloat              { 5 }
    override var borderColor: CGColor               { #colorLiteral(red: 0.2235262394, green: 0.2548468411, blue: 0.3096355796, alpha: 1).cgColor }
    override var borderWidth: CGFloat               { 1.5 }
    override var highlightedColor: UIColor          { #colorLiteral(red: 0.04706721753, green: 0.08229299635, blue: 0.1292892992, alpha: 1) }
    override var highlightedBorderColor: UIColor    { #colorLiteral(red: 0, green: 0.5841317773, blue: 0.7915077806, alpha: 1) }
}
