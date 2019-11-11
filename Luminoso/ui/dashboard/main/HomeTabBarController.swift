//
// Created by Fabrizio Rodin-Miron on 2019-11-04.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import UIKit

class HomeTabBarController: UITabBarController {

    private let vm: HomeTabBarViewModel
    private let navigator: Navigator

    private let exploreViewController: ExploreViewController
    private let savedViewController: SavedViewController
    private let alertsViewController: AlertsViewController
    private let profileViewController: ProfileViewController

    init(viewModel: HomeTabBarViewModel, navigator: Navigator, exploreVC: ExploreViewController, savedVC: SavedViewController, alertsVC: AlertsViewController, profileVC: ProfileViewController){
        vm = viewModel
        self.navigator = navigator
        exploreViewController = exploreVC
        savedViewController = savedVC
        alertsViewController = alertsVC
        profileViewController = profileVC
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        bindViewModel()
    }

    func makeUI(){
        tabBar.theme.tintColor = themed { $0.onSurface }
        tabBar.theme.barTintColor = themed { $0.surface }
    }

    func bindViewModel() {
        let input = HomeTabBarViewModel.Input()
        let output = vm.transform(input: input)

        output.tabBarItems.drive(onNext: { [weak self] (tabBarItems) in
            if let strongSelf = self {
                let controllers = tabBarItems.map { self!.controller(tabBarItem: $0) }
                strongSelf.setViewControllers(controllers, animated: false)
            }
        }).disposed(by: rx.disposeBag)
    }

    private func controller(tabBarItem: HomeTabBarItem) -> UIViewController {
        switch (tabBarItem) {
        case .explore:
            return controllerWithTabBarItem(tabBarItem: tabBarItem, rootController: exploreViewController)
        case .saved:
            return controllerWithTabBarItem(tabBarItem: tabBarItem, rootController: savedViewController)
        case .alerts:
            return controllerWithTabBarItem(tabBarItem: tabBarItem, rootController: alertsViewController)
        case .profile:
            return controllerWithTabBarItem(tabBarItem: tabBarItem, rootController: profileViewController)
        }
    }

    private func controllerWithTabBarItem(tabBarItem: HomeTabBarItem, rootController: UIViewController) -> UIViewController {
        let controller = NavigationController(rootViewController: rootController)
        controller.tabBarItem = UITabBarItem(title: tabBarItem.title, image: tabBarItem.image, selectedImage: tabBarItem.image)
        controller.setNavigationBarHidden(true, animated: false)
        return controller
    }

}
