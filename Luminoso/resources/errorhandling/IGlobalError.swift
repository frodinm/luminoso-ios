//
// Created by Fabrizio Rodin-Miron on 2019-11-03.
// Copyright (c) 2019 Skylow. All rights reserved.
//

import Foundation

protocol IGlobalError {
    static var generic: NSError { get }
    func configure()
    func leaveBreadcrumb(analyticEvent event: Events)
    func logError(e: NSError)
}