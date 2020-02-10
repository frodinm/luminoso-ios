//
// Created by Fabrizio Rodin-Miron on 2019-09-15.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import RxSwift

protocol IAuthenticationRemote {
    func manual(loginBody: LoginBody) -> Observable<LoginResponse>
    func google(loginBody: LoginBody) -> Observable<LoginResponse>
}
