//
//  TableColumn.swift
//  UITable
//
//  Created by Yasin Akbaş on 9/21/20.
//

import Foundation

public struct UITableColumn {
    let title: String
    let values: [String]
    
    public init(title: String, values: [String]) {
        self.title = title
        self.values = values
    }
}
