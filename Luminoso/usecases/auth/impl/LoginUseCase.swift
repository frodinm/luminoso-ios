//
// Created by Fabrizio Rodin-Miron on 2019-11-04.
// Copyright (c) 2019 Skylow. All rights reserved.
//

import RxSwift

class LoginUseCase: ILoginUseCase {
    private var authenticationRepository: IAuthenticationRepository

    init(authenticationRepository: IAuthenticationRepository){
        self.authenticationRepository = authenticationRepository
    }

    func loginWithUsername(loginBody: LoginBody) -> Observable<LoginResponse> {
        authenticationRepository.login(loginBody: loginBody)
    }
}
