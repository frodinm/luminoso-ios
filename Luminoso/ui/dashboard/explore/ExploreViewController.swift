//
// Created by Fabrizio Rodin-Miron on 2019-11-04.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import UIKit
import RxSwift

class ExploreViewController: ViewController {

    lazy var locationMarker: UIImageView = {
        let image = R.image.pinOutline()?.withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: image)
        
        imageView.theme.tintColor = themed { $0.onSurface }


        return imageView
    }()

    lazy var locationTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: R.font.montserratMedium.fontName, size: 10)
        label.theme.textColor = themed { $0.onBackground }

        label.anchor(
                top: locationSubContainerStackView.topAnchor,
                bottom: locationButton.topAnchor,
                right: locationContainerStackView.leadingAnchor)

        return label
    }()

    lazy var locationCity: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: R.font.montserratMedium.fontName, size: 10)
        label.theme.textColor = themed { $0.onBackground }
        return label
    }()

    lazy var arrowDown: UIImageView = {
        let image = R.image.arrowDown()?.withRenderingMode(.alwaysTemplate)
        return UIImageView(image: image)
    }()

    lazy var locationContainerStackView: UIStackView = {
        let stackView = UIStackView()
        let subviews: [UIView] = [locationMarker]

        stackView.axis = .horizontal
        stackView.addArrangedSubviews(subviews)
//
//        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor)

        return stackView
    }()

    lazy var locationSubContainerStackView: UIStackView = {
        let stackView = UIStackView()
        let subviews = [locationTitle,locationCity]

        stackView.axis = .vertical

        return stackView
    }()

    lazy var locationButton: UIButton = {
        let button = UIButton()
        button.setTitle(locationCity.text, for: .normal)
        return button
    }()

    lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(R.image.settings(), for: .normal)
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupTopBar()
    }

    private func setupTopBar(){

        view.addSubview(locationMarker)

        locationMarker.anchor(
                top: view.safeAreaLayoutGuide.topAnchor,
                left: view.leftAnchor)



    }

}
