//
// Created by Fabrizio Rodin-Miron on 2019-11-12.
// Copyright (c) 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import UIKit

class TableView: UITableView {

    init () {
        super.init(frame: CGRect(), style: .plain)
    }

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        makeUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeUI()
    }

    func makeUI() {
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = 260
        sectionHeaderHeight = 40
        backgroundColor = .cyan
        cellLayoutMarginsFollowReadableWidth = false
        keyboardDismissMode = .onDrag
        separatorColor = .black
        separatorInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: 0)
        tableHeaderView = View(height: 1)
        tableFooterView = UIView()
    }
}

