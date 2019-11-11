//
// Created by Fabrizio Rodin-Miron on 2019-11-10.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import UIKit

class Toolbar: UIToolbar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeUI()
    }

    func makeUI() {
        isTranslucent = false

        themeService.rx
                .bind({ $0.barStyle }, to: rx.barStyle)
                .bind({ $0.primary }, to: rx.barTintColor)
                .bind({ $0.secondary }, to: rx.tintColor)
                .disposed(by: rx.disposeBag)
    }
}

