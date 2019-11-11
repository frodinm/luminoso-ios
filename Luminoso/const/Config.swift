//
// Created by Fabrizio Rodin-Miron on 2019-11-03.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import Foundation

struct Config {
    struct Network {
        static let useStaging = false  // set true for tests and generating screenshots with fastlane
        static let loggingEnabled = false
        static let baseUrl = "http://localhost:1000"
    }
}
