//
// Created by Fabrizio Rodin-Miron on 2019-09-15.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//


import RxSwift

protocol IThemeManager {
    var currentTheme: BehaviorSubject<Theme> { get }
    func applyTheme(theme: Theme)
}
