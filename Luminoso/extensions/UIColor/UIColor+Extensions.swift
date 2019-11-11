//
// Created by Fabrizio Rodin-Miron on 2019-09-15.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//
import UIKit

extension UIColor {

    static func primary() -> UIColor {
        themeService.type.associatedObject.primary
    }

    static func secondary() -> UIColor {
        themeService.type.associatedObject.secondary
    }

    static func onPrimaryText() -> UIColor {
        themeService.type.associatedObject.onPrimaryText
    }

    static func onSecondaryText() -> UIColor {
        themeService.type.associatedObject.onSecondaryText
    }

    static func background() -> UIColor {
        themeService.type.associatedObject.background
    }

    static func onBackground() -> UIColor {
        themeService.type.associatedObject.onBackground
    }

    static func surface() -> UIColor {
        themeService.type.associatedObject.surface
    }

    static func onSurface() -> UIColor {
        themeService.type.associatedObject.onSurface
    }

    static func error() -> UIColor {
        themeService.type.associatedObject.error
    }

    static func separator() -> UIColor {
        themeService.type.associatedObject.separator
    }
}

extension UIColor {
    func colorFromHexString (_ hex:String) -> UIColor {
        var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)

        return UIColor(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0)
        )
    }

    var brightnessAdjustedColor: UIColor {
        var components = self.cgColor.components
        let alpha = components?.last
        components?.removeLast()
        let color = CGFloat(1-(components?.max())! >= 0.5 ? 1.0 : 0.0)
        return UIColor(red: color, green: color, blue: color, alpha: alpha!)
    }
}
