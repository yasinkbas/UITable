//
//  UITableViewStyle.swift
//  UITable
//
//  Created by Yasin Akbaş on 9/23/20.
//

import UIKit

struct UITableViewStyle {
    private init() { }
}

extension UITableViewStyle {
    enum Button {
    
    }
    
    enum Label {
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
    }
    
    enum View {
        
    }
    
    enum ImageView {
        
    }
}
