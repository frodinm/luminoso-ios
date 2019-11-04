//
// Created by Fabrizio Rodin-Miron on 2019-11-04.
// Copyright (c) 2019 Skylow. All rights reserved.
//
import ObjectMapper

class EmptyResponseData: Mappable {
    required init?(map: Map) {}

    func mapping(map: Map) {}
}
