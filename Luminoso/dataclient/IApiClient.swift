//
// Created by Fabrizio Rodin-Miron on 2019-09-15.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import RxSwift

protocol IApiClient {
    func login(loginBody: LoginBody) -> Observable<LoginResponse>
    func register(registerBody: RegisterBody) -> Observable<RegisterResponse>
    func verify(token: String) -> Observable<(HTTPURLResponse, Any)>
}
