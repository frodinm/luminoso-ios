//
// Created by Fabrizio Rodin-Miron on 2019-11-12.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import ObjectMapper

struct ErrorModel: Mappable {
    var code: String!
    var error: String!

    init?(map: Map) {}
    init(code: String, error: String) {
        self.code = code
        self.error = error

    }

    mutating func mapping(map: Map) {
        code <- map["code"]
        error <- map["error"]
    }
}