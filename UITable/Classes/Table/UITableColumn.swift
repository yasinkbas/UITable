//
//  UITableColumn.swift
//  UITable
//
//  Created by Yasin Akbaş on 9/23/20.
//

import Foundation

public struct UITableColumn {
    let title: String
    let values: [UITableCellContent]
    
    public init(title: String = "", values: [UITableCellContent]) {
        self.title  = title
        self.values = values
    }
}
