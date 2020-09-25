//
//  UITableCell.swift
//  UITable
//
//  Created by Yasin Akbaş on 9/22/20.
//

import UIKit

public class UITableCell: UIView {
    let columnIndex: Int
    let rowIndex: Int
    let style: UITableCellStyleRequest
    let content: UIView
    
    init(
        frame: CGRect,
        columnIndex: Int,
        rowIndex: Int,
        request: UITableCellStyleRequest,
        content: () -> UIView = { UIView() }
    ) {
        self.columnIndex = columnIndex
        self.rowIndex = rowIndex
        self.style = request
        self.content = content()
        super.init(frame: frame)
        customizeAppearance()
        setupViews()
    }
    
    func customizeAppearance() {
        addseparatorIfEnabled(style.isTopseparatorEnabled)
        
        backgroundColor = style.backgroundColor
    }
    
    func setupViews() {
        addContentLabel()
    }
    
    func addseparatorIfEnabled(_ enabled: Bool) {
        if enabled {
            let separatorLine = UIView()
            separatorLine.backgroundColor = style.separatorColor
            addSubview(separatorLine)
            let inset: CGFloat = 10
            NSLayoutConstraint.activate([
                separatorLine.leftAnchor.constraint(equalTo: self.leftAnchor, constant: inset),
                separatorLine.topAnchor.constraint(equalTo: self.topAnchor, constant: inset),
                separatorLine.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -inset),
                separatorLine.heightAnchor.constraint(equalToConstant: 2)
            ])
        }
    }
    
    func addContentLabel() {
        addSubview(content)
        NSLayoutConstraint.activate([
            content.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            content.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            content.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
