//
// Created by Fabrizio Rodin-Miron on 2019-11-03.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import ObjectMapper

struct RegisterResponse: Mappable {
    var success: Bool!

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        success <- map["success"]
    }
}
