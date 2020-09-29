//
//  UITableViewStyle.swift
//  UITable
//
//  Created by Yasin Akbaş on 9/23/20.
//

import Foundation

extension UITableViewStyle.Label {
    static var tableBaseLabelStyle = multiLineStyle
        .compose(with: adjustedFontStyle) {
            $0.font = .boldSystemFont(ofSize: 14)
    }

    static var tableDescriptionLabelStyle = tableBaseLabelStyle
        .compose(with: multiLineStyle)
        .compose(with: leftedAlignmentStyle)
        .compose(with: adjustedFontStyle) {
            $0.textColor = #colorLiteral(red: 0.7842521071, green: 0.7843526006, blue: 0.7881323695, alpha: 1)
    }

    static var tableHeaderLabelStyle = tableBaseLabelStyle
        .compose(with: centeredAlignmentStyle) {
            $0.textColor =  #colorLiteral(red: 0, green: 0.5841317773, blue: 0.7915077806, alpha: 1)
    }

    static var tableContentLabelStyle = tableBaseLabelStyle
        .compose(with: centeredAlignmentStyle) {
            $0.textColor = UIColor.white
    }
}

extension UITableViewStyle.View {
    static func highlightedFrameStyle(borderColor: UIColor) -> UIStyle<UIView> {
        UIStyle<UIView> {
            $0.layer.borderColor = borderColor.cgColor
            $0.layer.borderWidth = 2
            $0.layer.cornerRadius = 5
            $0.layer.masksToBounds = true
        }
    }
    
    static func highlightedFrameHiderStyle(highlightedColor: UIColor) -> UIStyle<UIView> {
        UIStyle<UIView> {
            $0.layer.borderColor = highlightedColor.cgColor
            $0.layer.borderWidth = 2
        }
    }
}

extension UITableViewStyle.ImageView {
    static var tableContentImageViewStyle = UIStyle<UIImageView> {
        $0.contentMode = .scaleAspectFit
    }
}
