//
// Created by Fabrizio Rodin-Miron on 2019-09-14.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import UIKit


extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?,
                leading:NSLayoutXAxisAnchor?,
                bottom:NSLayoutYAxisAnchor?,
                trailing:NSLayoutXAxisAnchor?,
                padding: UIEdgeInsets = .zero){
        // Required for  auto layout
        translatesAutoresizingMaskIntoConstraints = false

        if top != nil {
            topAnchor.constraint(equalTo: top!,constant: padding.top).isActive = true
        }
        if leading != nil {
            leadingAnchor.constraint(equalTo: leading!, constant: padding.left).isActive = true
        }
        if bottom != nil {
            bottomAnchor.constraint(equalTo: bottom!,constant: padding.bottom).isActive = true
        }
        if trailing != nil {
            trailingAnchor.constraint(equalTo: trailing!, constant: padding.right).isActive = true
        }
    }
}