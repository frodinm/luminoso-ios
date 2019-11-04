//
// Created by Fabrizio Rodin-Miron on 2019-11-03.
// Copyright (c) 2019 Skylow. All rights reserved.
//

import ObjectMapper

class LoginResponse: Mappable {
    var accessToken: String!
    var tokenType: String!
    var refreshToken: String!
    var expiresIn: Int!
    var scope: String!

    required init?(map: Map) {}

    func mapping(map: Map) {
        accessToken <- map["access_token"]
        tokenType <- map["token_type"]
        refreshToken <- map["refresh_token"]
        expiresIn <- map["expires_in"]
        scope <- map["scope"]
    }
}