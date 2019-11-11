//
//  Created by Fabrizio Rodin-Miron on 2019-07-23.
//  Copyright © 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import UIKit
import RxSwift
import NVActivityIndicatorView

class ViewController: UIViewController, Navigatable, NVActivityIndicatorViewable {
    var viewModel: ViewModel?
    var navigator: Navigator

    init(viewModel: ViewModel?, navigator: Navigator) {
        self.viewModel = viewModel
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }

    var navigationTitle = "" {
        didSet {
            navigationItem.title = navigationTitle
        }
    }

    let spaceBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)

    lazy var backBarButton: BarButtonItem = {
        let view = BarButtonItem()
        view.title = ""
        return view
    }()

    lazy var closeBarButton: BarButtonItem = {
        let view = BarButtonItem(image: R.image.navigationClose(),
                style: .plain,
                target: self,
                action: nil)
        return view
    }()


    let languageChanged = BehaviorSubject<Void>(value: ())
    let motionShakeEvent = PublishSubject<Void>()

    override public func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
        bindViewModel()
    }

    func makeUI() {
        hero.isEnabled = true
        navigationItem.backBarButtonItem = backBarButton

        motionShakeEvent.subscribe(onNext: { () in
            let theme = themeService.type.toggled()
            themeService.switch(theme)
        }).disposed(by: rx.disposeBag)

        themeService.rx
                .bind({ $0.primary }, to: view.rx.backgroundColor)
                .bind({ $0.secondary }, to: [backBarButton.rx.tintColor, closeBarButton.rx.tintColor])
                .disposed(by: rx.disposeBag)
    }

    // Abstract methods
    func updateUI() {}
    func bindViewModel() {}

}