//
//  TableRequest.swift
//  UITable
//
//  Created by Yasin Akbaş on 9/22/20.
//

import Foundation

public struct UITableStyleRequest {
    let backgroundColor: UIColor
    let cornerRadius: CGFloat
    let borderColor: UIColor
    let borderWidth: CGFloat
    let separatorColor: UIColor
    
    public init(backgroundColor: UIColor, cornerRadius: CGFloat, borderColor: UIColor, borderWidth: CGFloat, separatorColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.separatorColor = separatorColor
    }
}
