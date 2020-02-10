//
// Created by Fabrizio Rodin-Miron on 2020-02-09.
// Copyright (c) 2020 Fabrizio Rodin-Miron. All rights reserved.
//

import Foundation
import GoogleSignIn

class LoginViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()

        setup()
    }

    private func setup(){

        let googleSignInButton = GIDSignInButton()
        view.addSubview(googleSignInButton)



        googleSignInButton.anchor(
                top: view.safeAreaLayoutGuide.topAnchor,
                leading: view.leadingAnchor,
                bottom: view.safeAreaLayoutGuide.bottomAnchor,
                trailing: view.trailingAnchor)

    }
}