//
// Created by Fabrizio Rodin-Miron on 2019-09-15.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import Foundation

struct RegisterBody {
    var email: String
    var password: String

    init(email: String, password: String){
        self.email = email
        self.password = password
    }
}
