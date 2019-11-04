//
// Created by Fabrizio Rodin-Miron on 2019-09-15.
// Copyright (c) 2019 Skylow. All rights reserved.
//

import Foundation

protocol IThemeManager {
    func currentTheme() -> Theme
    func applyTheme(theme: Theme)
}
