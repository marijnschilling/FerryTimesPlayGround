//
// Created by Marijn Schilling on 01/10/2017.
// Copyright (c) 2017 Bakken & Bæck. All rights reserved.
//

import UIKit
import TinyConstraints
import SweetUIKit
import QuartzCore

class LineView: UIView {
    fileprivate lazy var fromTextLabel: UILabel = {
        let fromTextLabel = UILabel(withAutoLayout: true)
        fromTextLabel.font = .preferredFont(forTextStyle: .body)
        fromTextLabel.text = "Van"
        fromTextLabel.textColor = Theme.lightTextColor

        return fromTextLabel
    }()

    fileprivate lazy var fromStationLabel: UILabel = {
        let fromStationLabel = UILabel()
        fromStationLabel.font = .preferredFont(forTextStyle: .title1)
        fromStationLabel.text = "Amsterdam Centraal"
        fromStationLabel.textColor = Theme.lightTextColor

        return fromStationLabel
    }()

    fileprivate lazy var toTextLabel: UILabel = {
        let toTextLabel = UILabel()
        toTextLabel.font = .preferredFont(forTextStyle: .body)
        toTextLabel.text = "Naar"
        toTextLabel.textColor = Theme.lightTextColor

        return toTextLabel
    }()

    fileprivate lazy var toStationLabel: UILabel = {
        let toStationLabel = UILabel()
        toStationLabel.font = .preferredFont(forTextStyle: .title1)
        toStationLabel.text = "Buiksloterweg"
        toStationLabel.textColor = Theme.lightTextColor

        return toStationLabel
    }()

    fileprivate lazy var switchButton: UIButton = {
        let switchButton = UIButton()
        switchButton.backgroundColor = .white

        return switchButton
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        backgroundColor = Theme.buiksloterwegveerColor

        addSubviewsAndConstraints()
    }

    private func addSubviewsAndConstraints() {
        let buttonSize: CGFloat = 48.0
        let margin: CGFloat = 24.0

        addSubview(toTextLabel)
        addSubview(toStationLabel)

        addSubview(fromTextLabel)
        addSubview(fromStationLabel)

        addSubview(switchButton)

        fromTextLabel.top(to: self, offset: 38)
        fromTextLabel.height(21, relation: .equalOrGreater)
        fromTextLabel.left(to: self, offset: margin)
        fromTextLabel.right(to: self, offset: -margin, relation: .equalOrGreater)

        fromStationLabel.topToBottom(of: fromTextLabel, offset: 5)
        fromStationLabel.height(21, relation: .equalOrGreater)
        fromStationLabel.left(to: self, offset: margin)
        fromStationLabel.right(to: self, offset: -margin, relation: .equalOrGreater)

        switchButton.size(CGSize(width: buttonSize, height: buttonSize))
        switchButton.layer.masksToBounds = true
        switchButton.layer.cornerRadius = buttonSize/2

        switchButton.right(to: self, offset: -margin)
        switchButton.centerY(to: self, offset: 20)

        toTextLabel.topToBottom(of: fromStationLabel, offset: margin)
        toTextLabel.height(21, relation: .equalOrGreater)
        toTextLabel.left(to: self, offset: margin)
        toTextLabel.right(to: self, offset: -margin, relation: .equalOrGreater)

        toStationLabel.topToBottom(of: toTextLabel, offset: 5)
        toStationLabel.height(21, relation: .equalOrGreater)
        toStationLabel.left(to: self, offset: margin)
        toStationLabel.right(to: self, offset: -margin, relation: .equalOrGreater)
    }
}
