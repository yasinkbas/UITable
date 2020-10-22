//
//  UITableCell.swift
//  UITable
//
//  Created by Yasin Akbaş on 9/23/20.
//

import UIKit

class UITableCell<ContentView: UIView>: UIView {
    let columnIndex: Int
    let rowIndex: Int
    let style: UITableCellRequest
    let contentView: ContentView
    
    init(
        frame: CGRect,
        columnIndex: Int,
        rowIndex: Int,
        request: UITableCellRequest,
        contentView: () -> ContentView = { ContentView() }
    ) {
        self.columnIndex = columnIndex
        self.rowIndex = rowIndex
        self.style = request
        self.contentView = contentView()
        super.init(frame: frame)
        customizeAppearance()
        setupViews()
    }
    
    func customizeAppearance() {
        addSeperatorIfEnabled(style.isTopSeperatorEnabled)
        
        backgroundColor = style.backgroundColor
    }
    
    func setupViews() {
        addContentView()
    }
    
    func addSeperatorIfEnabled(_ enabled: Bool) {
        if enabled {
            let separatorLine = UIView()
            separatorLine.backgroundColor = style.separatorColor
            addSubview(separatorLine)
            separatorLine.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                separatorLine.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
                separatorLine.topAnchor.constraint(equalTo: self.topAnchor),
                separatorLine.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
                separatorLine.heightAnchor.constraint(equalToConstant: 2)
            ])
        }
    }
    
    func addContentView() {
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        let horizontalOffset: CGFloat = contentView is TripleContainerView ? 0 : 15
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: horizontalOffset),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -horizontalOffset),
            contentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
