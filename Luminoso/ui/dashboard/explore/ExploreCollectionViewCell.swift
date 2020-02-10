//
// Created by Fabrizio Rodin-Miron on 2020-02-09.
// Copyright (c) 2020 Fabrizio Rodin-Miron. All rights reserved.
//

import UIKit
import Foundation

class ExploreCollectionViewCell: UICollectionViewCell {

    static var identifier: String = "Cell"

    weak var textLabel: UILabel!


    override init(frame: CGRect) {
        super.init(frame: frame)

        let textLabel = UILabel(frame: .infinite)
        textLabel.text = "Test"
        textLabel.textColor = .white


        self.contentView.addSubview(textLabel)

        textLabel.anchorCenterSuperview()

        backgroundColor = .green

        self.textLabel = textLabel
        self.reset()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.reset()
    }

    func reset() {
        self.textLabel.textAlignment = .center
    }
}