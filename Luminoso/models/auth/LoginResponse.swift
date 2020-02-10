//
// Created by Fabrizio Rodin-Miron on 2019-11-03.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import ObjectMapper

struct LoginResponse: Mappable {
    var accessToken: String!
    var expiresIn: Int!
    var refreshToken: String!
    var tokenType: String!
    var scope: String!

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        accessToken <- map["access_token"]
        expiresIn <- map["expires_in"]
        refreshToken <- map["refresh_token"]
        tokenType <- map["token_type"]
        scope <- map["scope"]
    }
}
