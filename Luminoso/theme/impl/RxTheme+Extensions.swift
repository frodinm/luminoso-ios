//
// Created by Fabrizio Rodin-Miron on 2019-11-10.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import UIKit
import RxSwift
import RxTheme
import RxCocoa

extension Reactive where Base: UIView {
    var backgroundColor: Binder<UIColor?> {
        Binder(self.base) { view, attr in
            view.backgroundColor = attr
        }
    }
}

extension Reactive where Base: UITableView {
    var separatorColor: Binder<UIColor?> {
        Binder(self.base) { view, attr in
            view.separatorColor = attr
        }
    }
}

extension Reactive where Base: UINavigationBar {
    @available(iOS 11.0, *)
    var largeTitleTextAttributes: Binder<[NSAttributedString.Key: Any]?> {
        Binder(self.base) { view, attr in
            view.largeTitleTextAttributes = attr
        }
    }
}


extension Reactive where Base: UIApplication {
    var statusBarStyle: Binder<UIStatusBarStyle> {
        Binder(self.base) { view, attr in
            globalStatusBarStyle.onNext(attr)
        }
    }
}

extension Reactive where Base: UITextField {
    var borderColor: Binder<UIColor?> {
        Binder(self.base) { view, attr in
            view.borderColor = attr
        }
    }

    var placeholderColor: Binder<UIColor?> {
        Binder(self.base) { view, attr in
            if let color = attr {
                view.setPlaceHolderTextColor(color)
            }
        }
    }
}

public extension Reactive where Base: UISwitch {
    var onTintColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            view.onTintColor = attr
        }
    }

    var thumbTintColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            view.thumbTintColor = attr
        }
    }
}