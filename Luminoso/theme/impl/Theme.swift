//
// Created by Fabrizio Rodin-Miron on 2019-09-15.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import UIKit
import SwifterSwift

protocol Theme {
    var primary: UIColor { get }
    var secondary: UIColor { get }
    var onPrimaryText: UIColor { get }
    var onSecondaryText: UIColor { get }
    var background: UIColor { get }
    var onBackground: UIColor { get }
    var surface: UIColor { get }
    var onSurface: UIColor { get }
    var error:  UIColor { get }
    var separator: UIColor { get }
    var statusBarStyle: UIStatusBarStyle { get }
    var barStyle: UIBarStyle { get }
    var keyboardAppearance: UIKeyboardAppearance { get }
    var blurStyle: UIBlurEffect.Style { get }
}


struct LightTheme: Theme {
    let primary = UIColor.Material.white
    let secondary = UIColor.Material.red
    let onPrimaryText = UIColor.Material.white
    let onSecondaryText = UIColor.Material.white
    let background = UIColor.Material.white
    let onBackground = UIColor.Material.black
    let surface = UIColor.Material.white
    let onSurface = UIColor.Material.red700
    let error = UIColor.Material.red
    let separator = UIColor.Material.black
    let statusBarStyle = UIStatusBarStyle.default
    let barStyle = UIBarStyle.default
    let keyboardAppearance = UIKeyboardAppearance.light
    let blurStyle = UIBlurEffect.Style.extraLight
}

struct DarkTheme: Theme {
    let primary = UIColor.Material.grey800
    let secondary = UIColor.Material.red
    let onPrimaryText = UIColor.Material.white
    let onSecondaryText = UIColor.Material.white
    let background = UIColor.Material.grey800
    let onBackground = UIColor.Material.white
    let surface = UIColor.Material.black
    let onSurface = UIColor.Material.white
    let error = UIColor.Material.red
    let separator = UIColor.Material.grey900
    let statusBarStyle = UIStatusBarStyle.lightContent
    let barStyle = UIBarStyle.black
    let keyboardAppearance = UIKeyboardAppearance.dark
    let blurStyle = UIBlurEffect.Style.dark
}
