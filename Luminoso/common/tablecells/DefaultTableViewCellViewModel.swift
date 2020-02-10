//
// Created by Fabrizio Rodin-Miron on 2019-11-13.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import Foundation
import RxSwift

class DefaultTableViewCellViewModel: NSObject {
    let image = BehaviorSubject<UIImage?>(value: nil)
    let priceRange = BehaviorSubject<String?>(value: nil)
    let bedsRange = BehaviorSubject<String?>(value: nil)
    let bathRange = BehaviorSubject<String?>(value: nil)
    let location = BehaviorSubject<String>(value: "")
}

