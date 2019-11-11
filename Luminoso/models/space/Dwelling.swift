//
// Created by Fabrizio Rodin-Miron on 2019-11-04.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import ObjectMapper

struct Dwelling: Mappable {
    var name: String!
    var bedsCount: Int!
    var bathroomCount: Int!
    var squareFootage: String!
    var isFavorite: Bool!
    var coverPicture: String!
    var pictures: Array<String>!

    init(name: String, bedsCount: Int, bathroomCount: Int, squareFootage: String, isFavorite: Bool, coverPicture: String, pictures: Array<String>) {
        self.name = name
        self.bedsCount = bedsCount
        self.bathroomCount = bathroomCount
        self.squareFootage = squareFootage
        self.isFavorite = isFavorite
        self.coverPicture = coverPicture
        self.pictures = pictures
    }

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        name <- map["name"]
        bedsCount <- map["beds_count"]
        bathroomCount <- map["bathroom_count"]
        squareFootage <- map["square_footage"]
        isFavorite <- map["name"]
        coverPicture <- map["name"]
        pictures <- map["name"]
    }

}
