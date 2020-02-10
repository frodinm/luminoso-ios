//
// Created by Fabrizio Rodin-Miron on 2019-11-04.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import UIKit

class ProfileViewController: ViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        view.theme.backgroundColor = themed { $0.background }

        setupTopBar()
    }

    private func setupTopBar(){

        let switchButton = UISwitch()
        view.addSubview(switchButton)

        switchButton.addTarget(self, action: #selector(onSwitchChange), for: .valueChanged)

        switchButton.anchor(
                top: view.safeAreaLayoutGuide.topAnchor,
                leading: view.leadingAnchor,
                bottom: nil,
                trailing: nil)

    }

    @objc func onSwitchChange(sender:UISwitch) {
        themeService.type.toggled()

        print(sender.isOn)
    }
}
