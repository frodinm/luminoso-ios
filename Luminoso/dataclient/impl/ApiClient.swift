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
    // TODO: Use UserDefaults
    private let token = "8a600588-e7ce-429c-b2b5-8f4453a8a80a"

    // This is a public client, no client secret.
    private let clientId = "29300ead-cb16-4d49-84a9-141c07d46f66:"

    init(errorHandler: IGlobalError){
        self.errorHandler = errorHandler
    }

    func login(loginBody: LoginBody) -> Observable<LoginResponse> {
        let parameters: [String: Any] = ["grant_type": "password", "username": loginBody.username, "password": loginBody.password]
        let headers: [String: String] = ["Authorization": "Basic " + clientId.toBase64()]

        return RxAlamofire.requestJSON(.post, baseUrl + "/luminoso-security/oauth/token", parameters: parameters, headers: headers)
                .debug()
                .mapObject(type: LoginResponse.self)
                .subscribeOn(MainScheduler.asyncInstance)
                .do(onError: handleError)
    }

    func postSpace() -> Observable<EmptyResponseData> {
        let parameters: [String: Any] = ["name": "test"]
        let headers: [String: String] = ["Authorization": "Bearer " + token]

       return RxAlamofire.requestJSON(.post, baseUrl + "/luminoso-real-estate/spaces/post", parameters: parameters, headers: headers)
                .debug()
                .mapApiResponseObject(type: EmptyResponseData.self)
    }

    private func handleError(error: Error){
        print(error.localizedDescription)
    }
}
