//
// Created by Fabrizio Rodin-Miron on 2019-11-04.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import RxSwift

class AuthenticationRepository: IAuthenticationRepository {
    private var remote: IAuthenticationRemote

    init(remote: IAuthenticationRemote){
        self.remote = remote
    }

    func login(loginBody: LoginBody) -> Observable<LoginResponse> {
        remote.login(loginBody: loginBody)
    }

}
