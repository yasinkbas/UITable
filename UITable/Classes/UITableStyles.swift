//
//  TableStyle.swift
//  UITable
//
//  Created by Yasin Akbaş on 9/23/20.
//

import Foundation

extension TableViewStyle.Label {
    static var centeredAlignmentStyle = UIStyle<UILabel> {
        $0.textAlignment = .center
    }
    
    static var leftedAlignmentStyle = UIStyle<UILabel> {
        $0.textAlignment = .left
    }
    
    static var rightedAlignmentStyle = UIStyle<UILabel> {
        $0.textAlignment = .right
    }
    
    static var adjustedFontStyle = UIStyle<UILabel> {
        $0.adjustsFontSizeToFitWidth = true
        $0.minimumScaleFactor = 0.5
    }
    
    static var multiLineStyle = UIStyle<UILabel> {
        $0.numberOfLines = 0
    }
    
    static var oneLineStyle = UIStyle<UILabel> {
        $0.numberOfLines = 1
    }
    
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

extension TableViewStyle.View {
    static var highlightedFrameStyle = UIStyle<UIView> {
        $0.layer.borderColor = #colorLiteral(red: 0, green: 0.5841317773, blue: 0.7915077806, alpha: 1).cgColor
        $0.layer.borderWidth = 2
        $0.layer.cornerRadius = 5
        $0.layer.masksToBounds = true
    }
    
    static func highlightedFrameHiderStyle(highlightedColor: UIColor) -> UIStyle<UIView> {
        UIStyle<UIView> {
            $0.layer.borderColor = highlightedColor.cgColor
            $0.layer.borderWidth = 2
        }
    }
}

extension TableViewStyle.Button {
    static var roundedButtonStyle = UIStyle<UIButton> {
        $0.layer.cornerRadius = 15
    }
    
    static var primaryNextButtonStyle = UIStyle<UIButton> {
        $0.backgroundColor = UIColor.blue
        $0.setTitleColor(.white, for: .normal)
    }
    
    static var primaryBlueButtonStyle = UIStyle<UIButton> {
        $0.layer.cornerRadius = 10
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0, green: 0.4547672272, blue: 0.6151750088, alpha: 1)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 20)
    }
}
