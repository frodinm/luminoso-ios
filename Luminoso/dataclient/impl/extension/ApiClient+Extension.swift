//
// Created by Fabrizio Rodin-Miron on 2019-11-03.
// Copyright (c) 2019 Skylow. All rights reserved.
//

import Foundation

enum ServerEnvironment: String {
    case staging = "STAGING"
    case production = "PROD"
    case custom = "custom"
}

extension Int {
    ///All successes begin with 2**
    var isSuccess: Bool {
        return (self >= 200 && self < 300)
    }

    ///All errors are begin with 4**
    var isError: Bool {
        return (self >= 400 && self < 500)
    }
    ///HTTP request timeouts should be these error codes
    var isTimeout: Bool {
        return self == 504 || self == 508
    }

    ///HTTP request timeouts should be these error codes
    var isServerError: Bool {
        return self == 500 || self == 502 || self == 503
    }
}