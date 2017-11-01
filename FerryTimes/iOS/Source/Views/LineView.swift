//
// Created by Marijn Schilling on 01/10/2017.
// Copyright (c) 2017 Bakken & Bæck. All rights reserved.
//

import UIKit
import TinyConstraints
import SweetUIKit
import QuartzCore

class LineView: UIView {
    private lazy var fromTextLabel: UILabel = {
        let fromTextLabel = UILabel(withAutoLayout: true)
        fromTextLabel.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: .systemFont(ofSize: 16), maximumPointSize: 34)
        fromTextLabel.text = "Van"
        fromTextLabel.textColor = Theme.lightTextColor
        fromTextLabel.adjustsFontForContentSizeCategory = true

        return fromTextLabel
    }()

    private lazy var fromStationLabel: UILabel = {
        let fromStationLabel = UILabel()
        fromStationLabel.font = UIFontMetrics(forTextStyle: .title1).scaledFont(for: .systemFont(ofSize: 28), maximumPointSize: 50)
        fromStationLabel.text = "Centraal Station"
        fromStationLabel.textColor = Theme.lightTextColor
        fromStationLabel.adjustsFontForContentSizeCategory = true

        return fromStationLabel
    }()

    private lazy var toTextLabel: UILabel = {
        let toTextLabel = UILabel()
        toTextLabel.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: .systemFont(ofSize: 16), maximumPointSize: 34)
        toTextLabel.text = "Naar"
        toTextLabel.textColor = Theme.lightTextColor
        toTextLabel.adjustsFontForContentSizeCategory = true

        return toTextLabel
    }()

    private lazy var toStationLabel: UILabel = {
        let toStationLabel = UILabel()
        toStationLabel.font = UIFontMetrics(forTextStyle: .title1).scaledFont(for: .systemFont(ofSize: 28), maximumPointSize: 50)
        toStationLabel.text = "Buiksloterweg"
        toStationLabel.textColor = Theme.lightTextColor
        toStationLabel.adjustsFontForContentSizeCategory = true

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

        addSubview(fromTextLabel)
        addSubview(fromStationLabel)

        addSubview(toTextLabel)
        addSubview(toStationLabel)

        addSubview(switchButton)

        fromTextLabel.top(to: self, offset: 38)
        fromTextLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        fromTextLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        fromTextLabel.left(to: self, offset: margin)
        fromTextLabel.right(to: self, offset: -margin, relation: .equalOrGreater)

        fromStationLabel.topToBottom(of: fromTextLabel, offset: 5)
        fromStationLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        fromStationLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        fromStationLabel.left(to: self, offset: margin)
        fromStationLabel.right(to: self, offset: -margin, relation: .equalOrGreater)

        switchButton.size(CGSize(width: buttonSize, height: buttonSize))
        switchButton.layer.masksToBounds = true
        switchButton.layer.cornerRadius = buttonSize/2

        switchButton.right(to: self, offset: -margin)
        switchButton.centerY(to: self, offset: 20)

        toTextLabel.topToBottom(of: fromStationLabel, offset: margin)
        toTextLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        toTextLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        toTextLabel.left(to: self, offset: margin)
        toTextLabel.right(to: self, offset: -margin, relation: .equalOrGreater)

        toStationLabel.topToBottom(of: toTextLabel, offset: 5)
        toStationLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        toStationLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
        toStationLabel.left(to: self, offset: margin)
        toStationLabel.right(to: self, offset: -margin, relation: .equalOrGreater)
        toStationLabel.bottom(to: self, offset: -margin, relation: .equalOrGreater)
    }
}
