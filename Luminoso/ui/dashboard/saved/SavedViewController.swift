//
// Created by Fabrizio Rodin-Miron on 2019-11-04.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import UIKit


class SavedViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.theme.backgroundColor = themed { $0.background }
    }
}
