//
// Created by Fabrizio Rodin-Miron on 2019-09-15.
// Copyright (c) 2019 Skylow. All rights reserved.
//

import UIKit
import Foundation

enum Theme: Int {
    case light, dark

    var mainColor: UIColor {
       switch self {
       case .light:
           return UIColor().colorFromHexString("FFFFFF")
       case .dark:
           return UIColor().colorFromHexString("000000")
       }
    }

    var barStyle: UIBarStyle {
        switch self {
        case .light:
            return .default
        case .dark:
            return .black
        }
    }

    var navigationBackgroundImage: UIImage? {
        return self == .light ? UIImage(named: "art_image3") : nil
    }

    var tabBarBackgroundImage: UIImage? {
        return self == .light ? UIImage(named: "tabBarBackground") : nil
    }

    var backgroundColor: UIColor {
        switch self {
        case .light:
            return UIColor().colorFromHexString("ffffff")
        case .dark:
            return UIColor().colorFromHexString("000000")
        }
    }

    var secondaryColor: UIColor {
        switch self {
        case .light:
            return UIColor().colorFromHexString("ffffff")
        case .dark:
            return UIColor().colorFromHexString("000000")
        }
    }

    var titleTextColor: UIColor {
        switch self {
        case .light:
            return UIColor().colorFromHexString("ffffff")
        case .dark:
            return UIColor().colorFromHexString("000000")
        }
    }
    var subtitleTextColor: UIColor {
        switch self {
        case .light:
            return UIColor().colorFromHexString("ffffff")
        case .dark:
            return UIColor().colorFromHexString("000000")
        }
    }
}
