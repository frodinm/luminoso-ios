//
// Created by Fabrizio Rodin-Miron on 2019-09-15.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import UIKit
import RxSwift
import RxTheme
import SwifterSwift

let globalStatusBarStyle = BehaviorSubject<UIStatusBarStyle>(value: .default)
let themeService = ThemeType.service(initial: ThemeType.currentTheme())

func themed<T>(_ mapper: @escaping ((Theme) -> T)) -> Observable<T> {
    return themeService.attrStream(mapper)
}

enum ThemeType: ThemeProvider {
    case light
    case dark

    var associatedObject: Theme {
        switch self {
        case .light: return LightTheme()
        case .dark: return DarkTheme()
        }
    }

    var isDark: Bool {
        switch self {
        case .dark: return true
        default: return false
        }
    }

    func toggled() -> ThemeType {
        var theme: ThemeType
        switch self {
        case .light: theme = ThemeType.dark
        case .dark: theme = ThemeType.light
        }
        theme.save()
        return theme
    }
}

extension ThemeType {
    static func currentTheme() -> ThemeType {
        let defaults = UserDefaults.standard
        let isDark = defaults.bool(forKey: "IsDarkKey")
        let theme = isDark ? ThemeType.dark : ThemeType.light
        theme.save()
        return theme
    }

    func save() {
        let defaults = UserDefaults.standard
        defaults.set(self.isDark, forKey: "IsDarkKey")
    }
}

