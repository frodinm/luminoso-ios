//
// Created by Fabrizio Rodin-Miron on 2019-11-03.
// Copyright (c) 2019 Skylow. All rights reserved.
//

import UIKit
import RxSwift
import RxAlamofire
import ObjectMapper

extension ObservableType {

    public func mapApiResponseObject<T: Mappable>(type: T.Type) -> Observable<T> {
        return flatMap { data -> Observable<T> in
            let (_, json) = (data as? (HTTPURLResponse, Any))!
            guard let object = Mapper<ApiResponse<T>>().map(JSONObject: json) else {
                throw NSError(
                        domain: "",
                        code: -1,
                        userInfo: [NSLocalizedDescriptionKey: "ObjectMapper can't mapping"]
                )
            }

            return Observable.just(object.data)
        }
    }

    public func mapObject<T: Mappable>(type: T.Type) -> Observable<T> {
        return flatMap { data -> Observable<T> in
            let (_, json) = (data as? (HTTPURLResponse, Any))!
            guard let object = Mapper<T>().map(JSONObject: json) else {
                throw NSError(
                        domain: "",
                        code: -1,
                        userInfo: [NSLocalizedDescriptionKey: "ObjectMapper can't mapping"]
                )
            }

            return Observable.just(object)
        }
    }

    public func mapArray<T: Mappable>(type: T.Type) -> Observable<[T]> {
        return flatMap { data -> Observable<[T]> in
            let json = data
            guard let objects = Mapper<T>().mapArray(JSONObject: json) else {
                throw NSError(
                        domain: "",
                        code: -1,
                        userInfo: [NSLocalizedDescriptionKey: "ObjectMapper can't mapping"]
                )
            }

            return Observable.just(objects)
        }
    }
}


