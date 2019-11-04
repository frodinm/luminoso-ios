//
// Created by Fabrizio Rodin-Miron on 2019-09-14.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import UIKit


extension UIImageView {
    func anchor(top: NSLayoutYAxisAnchor,
                leading:NSLayoutXAxisAnchor,
                bottom:NSLayoutYAxisAnchor,
                trailing:NSLayoutXAxisAnchor,
                padding: UIEdgeInsets = .zero){

        translatesAutoresizingMaskIntoConstraints = false

        topAnchor.constraint(equalTo: top,constant: padding.top).isActive = true
        leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        bottomAnchor.constraint(equalTo: bottom,constant: padding.bottom).isActive = true
        trailingAnchor.constraint(equalTo: trailing, constant: padding.right).isActive = true

    }
}