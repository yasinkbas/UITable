//
//  UITableRequest.swift
//  UITable
//
//  Created by Yasin Akbaş on 9/23/20.
//
import Foundation

public typealias UITableColumns = [UITableColumn]

public class UITableRequest {
    let theme: UITableThemeProvider
    let columns: UITableColumns
    let columnWidths: [CGFloat]
    let highlightedColumnIndex: Int
    let superNavHeight: CGFloat?
    let titleRowWillAppear: Bool
    
    public init(theme: UITableThemeProvider, columns: UITableColumns, columnWidths: [CGFloat], highlightedColumnIndex: Int, superNavHeight: CGFloat?, titleRowWillAppear: Bool) {
        self.theme                      = theme
        self.columns                    = columns
        self.columnWidths               = columnWidths
        self.highlightedColumnIndex     = highlightedColumnIndex
        self.superNavHeight             = superNavHeight
        self.titleRowWillAppear         = titleRowWillAppear
    }
}
