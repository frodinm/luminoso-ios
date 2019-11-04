//
// Created by Fabrizio Rodin-Miron on 2019-09-15.
// Copyright (c) 2019 Skylow. All rights reserved.
//

import RxSwift

protocol IApiClient {
    func login(loginBody: LoginBody) -> Observable<LoginResponse>
    func postSpace() -> Observable<EmptyResponseData>
}
