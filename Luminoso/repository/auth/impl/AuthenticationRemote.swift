//
// Created by Fabrizio Rodin-Miron on 2019-09-15.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import Foundation
import RxAlamofire
import RxSwift

class AuthenticationRemote: IAuthenticationRemote {
    private let api: IApiClient

    init(apiClient: IApiClient){
        api = apiClient
    }

    func login(loginBody: LoginBody) -> Observable<LoginResponse> {
        api.login(loginBody: loginBody)
    }

}
