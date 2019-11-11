//
// Created by Fabrizio Rodin-Miron on 2019-11-10.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import ObjectMapper

protocol ViewModelType {
    associatedtype Input
    associatedtype Output

    func transform(input: Input) -> Output
}

class ViewModel: NSObject {

}



