//
// Created by Fabrizio Rodin-Miron on 2019-11-04.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import RxSwift

protocol ILoginUseCase {
    func loginWithUsername(loginBody: LoginBody) -> Observable<LoginResponse>
}
