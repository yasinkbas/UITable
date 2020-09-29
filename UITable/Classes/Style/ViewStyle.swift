//
//  ViewStyle.swift
//  BtcTrader-ios
//
//  Created by Yasin Akbaş on 9/23/20.
//  Copyright © 2020 com.mobiilium.btctrader.dev. All rights reserved.
//

import UIKit

struct ViewStyle {
    private init() { }
}

extension ViewStyle {
    enum View {
        
    }
}

extension ViewStyle {
    enum Button {
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
}

extension ViewStyle {
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
}

extension ViewStyle {
    enum ImageView {

    }
}
