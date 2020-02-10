//
// Created by Fabrizio Rodin-Miron on 2019-11-10.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import UIKit
import Hero
import NSObject_Rx
import RxTheme

class NavigationController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        try! globalStatusBarStyle.value()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactivePopGestureRecognizer?.delegate = nil // Enable default iOS back swipe gesture

        if #available(iOS 13.0, *) {
            hero.isEnabled = false
        } else {
            hero.isEnabled = true
        }
        hero.modalAnimationType = .autoReverse(presenting: .fade)
        hero.navigationAnimationType = .autoReverse(presenting: .slide(direction: .left))

        navigationBar.backIndicatorImage = R.image.navigationBack()
        navigationBar.backIndicatorTransitionMaskImage = R.image.navigationBack()

        themeService.rx
            .bind({ $0.secondary }, to: navigationBar.rx.tintColor)
            .bind({ $0.onBackground }, to: navigationBar.rx.barTintColor)
            .bind({ [NSAttributedString.Key.foregroundColor: $0.onPrimaryText] }, to: navigationBar.rx.titleTextAttributes)
            .disposed(by: rx.disposeBag)
    }
}
