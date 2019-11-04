//
// Created by Fabrizio Rodin-Miron on 2019-11-03.
// Copyright (c) 2019 Skylow. All rights reserved.
//

import Foundation

extension String {

    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }

    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
}