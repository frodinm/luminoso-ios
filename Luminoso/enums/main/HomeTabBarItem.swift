//
//  HomeTabBarItem.swift
//  Luminoso
//
//  Created by Fabrizio Rodin-Miron on 2019-11-10.
//  Copyright © 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import UIKit
import Localize_Swift
import RxSwift

enum HomeTabBarItem: Int {
    case explore, saved, alerts, profile

    var image: UIImage? {
        switch self {
        case .explore: return R.image.search()
        case .saved: return R.image.saved()
        case .alerts: return R.image.bellOutline()
        case .profile: return R.image.personOutline()
        }
    }

    var title: String {
        switch self {
        case .explore: return R.string.localizable.explore.key.localized()
        case .saved: return R.string.localizable.saved.key.localized()
        case .alerts: return R.string.localizable.alerts.key.localized()
        case .profile: return R.string.localizable.profile.key.localized()
        }
    }
}
