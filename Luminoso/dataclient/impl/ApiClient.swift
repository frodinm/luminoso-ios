//
// Created by Fabrizio Rodin-Miron on 2019-09-15.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import Foundation
import RxAlamofire
import RxSwift

public final class ApiClient: IApiClient {
    private let errorHandler: IGlobalError
    private let baseUrl = "http://localhost:1000"

    init(errorHandler: IGlobalError){
        self.errorHandler = errorHandler
    }

    func login(loginBody: LoginBody) -> Observable<LoginResponse> {
        let parameters: [String: Any] = ["grant_type": "password", "username": loginBody.username, "password": loginBody.password]

        return RxAlamofire.requestJSON(.post, baseUrl + "/oauth/token", parameters: parameters)
                .debug()
                .mapObject(type: LoginResponse.self)
                .subscribeOn(MainScheduler.asyncInstance)
                .do(onError: handleError)
    }

    func register(registerBody: RegisterBody) -> Observable<RegisterResponse> {
        let parameters: [String: Any] = [
            "email": registerBody.email,
            "password": registerBody.password
        ]

        return RxAlamofire.requestJSON(.post, baseUrl + "/oauth/token", parameters: parameters)
                .debug()
                .mapObject(type: RegisterResponse.self)
                .subscribeOn(MainScheduler.asyncInstance)
                .do(onError: handleError)
    }

    func verify(token: String) -> Observable<(HTTPURLResponse, Any)> {
        RxAlamofire.requestJSON(.get, baseUrl + "/oauth/verify/\(token)")
                .debug()
                .subscribeOn(MainScheduler.asyncInstance)
                .do(onError: handleError)
    }

    private func handleError(error: Error){
        print(error.localizedDescription)
    }
}
