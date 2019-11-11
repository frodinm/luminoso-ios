//
// Created by Fabrizio Rodin-Miron on 2019-11-03.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import ObjectMapper

struct LoginResponse: Mappable {
    var accessToken: String!
    var tokenType: String!
    var refreshToken: String!
    var expiresIn: Int!
    var scope: String!

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        accessToken <- map["access_token"]
        tokenType <- map["token_type"]
        refreshToken <- map["refresh_token"]
        expiresIn <- map["expires_in"]
        scope <- map["scope"]
    }
}
