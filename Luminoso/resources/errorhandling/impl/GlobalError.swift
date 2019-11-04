//
// Created by Fabrizio Rodin-Miron on 2019-11-03.
// Copyright (c) 2019 Skylow. All rights reserved.
//

import Foundation
import Bugsnag

class GlobalError: IGlobalError {

    static let generic = NSError(domain: "", code: 444, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("ErrorMessageGeneric", comment: "")])

    func configure(){
        Bugsnag.start(withApiKey: "")
    }

    func leaveBreadcrumb(analyticEvent event: Events) {
        Bugsnag.leaveBreadcrumb(withMessage: "\(event)")
    }

    func logError(e: NSError){
        // Return if network request was successful
        guard !e.code.isSuccess else {
            return
        }
        Bugsnag.notifyError(e)
    }




}