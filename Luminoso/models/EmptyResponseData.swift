//
// Created by Fabrizio Rodin-Miron on 2019-11-04.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//
import ObjectMapper

struct EmptyResponseData: Mappable {
    init?(map: Map) {}

    func mapping(map: Map) {}
}
