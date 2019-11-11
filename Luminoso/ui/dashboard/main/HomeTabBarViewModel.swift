//
// Created by Fabrizio Rodin-Miron on 2019-11-10.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class HomeTabBarViewModel: ViewModel, ViewModelType {

    struct Input {}
    struct Output {
        let tabBarItems: Driver<[HomeTabBarItem]>
    }

    func transform(input: HomeTabBarViewModel.Input) -> HomeTabBarViewModel.Output {
        let tabBarItems: [HomeTabBarItem] = [.explore, .saved, .alerts, .profile]

        return Output(tabBarItems: Driver.just(tabBarItems))
    }
}