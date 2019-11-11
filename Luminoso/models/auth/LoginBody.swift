//
// Created by Fabrizio Rodin-Miron on 2019-09-15.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import Foundation

struct LoginBody {
    var username: String
    var password: String

    init(username: String,password: String){
        self.username = username
        self.password = password
    }
}
