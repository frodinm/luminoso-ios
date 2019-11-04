//
//  ViewController.swift
//  Zuccini
//
//  Created by Fabrizio Rodin-Miron on 2019-07-23.
//  Copyright © 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    fileprivate let loginUseCase: ILoginUseCase
    fileprivate let themeManager: IThemeManager

    fileprivate let disposableBag = DisposeBag()

    init(loginUseCase: ILoginUseCase, themeManager: IThemeManager){
        self.loginUseCase = loginUseCase
        self.themeManager = themeManager
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.backgroundColor = themeManager.currentTheme().backgroundColor
        
        let imageView = UIImageView(image: UIImage(named: "art_image3"))
        view.addSubview(imageView)

        imageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))

        loginUseCase.loginWithUsername(loginBody: .init(username: "frodinm", password: "skylow")).subscribe(onNext: { it in 
            print(it.accessToken)

        },onError: { error in
            print(error.localizedDescription)
        }).disposed(by: disposableBag)
    }

}