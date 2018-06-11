//
// Created by Eryk Mariankowski on 11.06.2018.
// Copyright (c) 2018 Eryk Mariankowski. All rights reserved.
//

import Foundation

import UIKit

public struct FitbookTheme {

    enum Default {
        // static let fontSize = CGFloat(18.0)
        // static let navBarFontSize = CGFloat(20.0)
    }

//    public enum Fonts {
//        public static let appFont: UIFont = UIFont(name: Default.fontName, size: Default.fontSize)!
//        public static let appFontBig: UIFont = UIFont(name: Default.fontName, size: Default.navBarFontSize)!
//    }

//    func applyFont() {
//        UILabel.appearance().font = Fonts.appFont
//    }

//    func applyNavBar() {
//        let appearance = UINavigationBar.appearance()
//        appearance.tintColor = UIColor.white
//        appearance.barTintColor = SoftraColors.tintColor
//        appearance.titleTextAttributes = [
//            .font: Fonts.appFontBig,
//            .foregroundColor: UIColor.white
//        ]
//    }

//    func textFieldTheme() {
//        let style = SkyFloatingLabelTextField.appearance()
//        style.font = Fonts.appFont
//        style.selectedLineColor = SoftraColors.tintColor
//        style.selectedTitleColor = SoftraColors.tintColor
//        style.lineColor = SoftraColors.textLight
//        style.titleColor = SoftraColors.textMedium
//        style.tintColor = SoftraColors.textMedium
//        style.contentVerticalAlignment = UIControlContentVerticalAlignment.center
//        style.textAlignment = NSTextAlignment.center
//        style.clearButtonMode = .whileEditing
//    }

    func buttonTheme() {
        let style = UIButton.appearance()
        style.backgroundColor = FitbookColors.colorPrimaryDark
        style.tintColor = FitbookColors.textColorPrimary
        style.layer.borderWidth = 4
        style.layer.borderColor = UIColor.black.cgColor
        let text = style.titleLabel?.text?.uppercased()
        style.titleLabel?.text = text
    }

    public func apply() {
//        buttonTheme()
//        applyNavBar()
    }

}

extension UIButton {

    func buttonStyle() {
        layer.cornerRadius = 13
        clipsToBounds = true
        backgroundColor = FitbookColors.colorPrimaryDark
        tintColor = FitbookColors.textColorPrimary
        layer.borderWidth = 1
        // layer.borderColor = FitbookColors.textColorPrimary
    }

}

//extension UILabel {
//
//    var substituteFontName: String {
//        get {
//            return self.font.fontName
//        }
//        set {
//            self.font = UIFont(name: newValue, size: self.font.pointSize)
//        }
//    }
//
//}
