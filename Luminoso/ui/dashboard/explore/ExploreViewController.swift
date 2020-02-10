//
// Created by Fabrizio Rodin-Miron on 2019-11-04.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import UIKit
import RxSwift

class ExploreViewController: BaseCollectionViewController {

    private let loginVC: LoginViewController

    private let cellId = "cellId"

    lazy var locationMarker: UIImageView = {
        let image = R.image.pinOutline()?.withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: image)

        imageView.theme.tintColor = themed { $0.onSurface }

        return imageView
    }()

    lazy var locationTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: R.font.montserratMedium.fontName, size: 10)
        label.theme.textColor = themed { $0.onPrimaryText }
        label.text = R.string.localizable.location.key.localized()

        return label
    }()

    lazy var locationCity: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: R.font.montserratMedium.fontName, size: 10)
        label.theme.textColor = themed { $0.onPrimaryText }
        return label
    }()

    lazy var arrowDown: UIImageView = {
        let image = R.image.arrowDown()?.withRenderingMode(.alwaysTemplate)
        return UIImageView(image: image)
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

    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setImage(R.image.checkmark(), for: .normal)
        button.addTarget(self, action: #selector(onLoginPress), for: .touchDown)

        return button
    }()

    init(viewModel: ViewModel?, navigator: Navigator, loginVC: LoginViewController) {
        self.loginVC = loginVC
        super.init(viewModel: viewModel, navigator: navigator)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(ExploreCollectionViewCell.self,forCellWithReuseIdentifier: cellId)
        setupNavigationItem()

    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        return CGSize(width: (screenWidth/3)-6, height: (screenWidth/3)-6);
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ExploreCollectionViewCell
        cell.textLabel.text = "Test"
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }

    private func setupNavigationItem(){
        self.navigationItem.title = "Explore"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: R.image.mdFunnel(), style: .plain, target: .none, action: .none)

    }

    @objc func onLoginPress(sender:UIButton) {
        navigator.show(target: loginVC, sender: self)
    }

    private func learningLayoutConstraints(){
        let redView = UIView()
        redView.backgroundColor = .red

        let blueView = UIView()
        blueView.backgroundColor = .blue

        let greenView = UIView()
        greenView.backgroundColor = .green

        [redView,blueView,greenView].forEach { view.addSubview($0) }

        redView.anchor(
                top: view.safeAreaLayoutGuide.topAnchor,
                leading: nil, bottom: nil,
                trailing: view.safeAreaLayoutGuide.trailingAnchor,
                padding: .init(top: 0, left: 0, bottom: 0, right: 12),
                size: .init(width: 50, height: 0)
        )

        redView.heightAnchor.constraint(equalTo: redView.widthAnchor).isActive = true

        blueView.anchor(top: redView.bottomAnchor, leading: nil,bottom: nil,trailing: redView.trailingAnchor,
                padding: .init(top: 12, left: 0, bottom: 0, right: 0))

        blueView.anchorSize(to: redView)

        greenView.anchor(
                top: redView.topAnchor,
                leading: view.safeAreaLayoutGuide.leadingAnchor ,
                bottom: blueView.bottomAnchor,
                trailing: redView.leadingAnchor,
                padding: .init(top: 0, left: 12, bottom: 0, right: 12))
    }

}
