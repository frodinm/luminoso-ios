//
// Created by Fabrizio Rodin-Miron on 2019-11-04.
// Copyright (c) 2019 Skylow. All rights reserved.
//

import ObjectMapper

class ApiResponse<T>: Mappable {
    var success: Bool!
    var data: T!
    var message: String!

    init(success: Bool, data: T, message: String){
        self.success = success
        self.data = data
        self.message = message
    }

    required init?(map: Map) {}

    func mapping(map: Map) {
        success <- map["success"]
        data <- map["data"]
        message <- map["message"]
    }
}