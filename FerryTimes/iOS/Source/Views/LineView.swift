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
        fromTextLabel.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: .systemFont(ofSize: 16), maximumPointSize: 28)
        fromTextLabel.text = "Van"
        fromTextLabel.textColor = Theme.lightTextColor
        fromTextLabel.adjustsFontForContentSizeCategory = true

        return fromTextLabel
    }()

    private lazy var fromStationLabel: UILabel = {
        let fromStationLabel = UILabel()
        fromStationLabel.font = UIFontMetrics(forTextStyle: .title1).scaledFont(for: .systemFont(ofSize: 28), maximumPointSize: 40)
        fromStationLabel.text = "Centraal Station"
        fromStationLabel.textColor = Theme.lightTextColor
        fromStationLabel.adjustsFontForContentSizeCategory = true

        return fromStationLabel
    }()

    private lazy var toTextLabel: UILabel = {
        let toTextLabel = UILabel()
        toTextLabel.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: .systemFont(ofSize: 16), maximumPointSize: 28)
        toTextLabel.text = "Naar"
        toTextLabel.textColor = Theme.lightTextColor
        toTextLabel.adjustsFontForContentSizeCategory = true

        return toTextLabel
    }()

    private lazy var toStationLabel: UILabel = {
        let toStationLabel = UILabel()
        toStationLabel.font = UIFontMetrics(forTextStyle: .title1).scaledFont(for: .systemFont(ofSize: 28), maximumPointSize: 40)
        toStationLabel.text = "Buiksloterweg"
        toStationLabel.textColor = Theme.lightTextColor
        toStationLabel.adjustsFontForContentSizeCategory = true

        return toStationLabel
    }()

    fileprivate lazy var switchButton: UIButton = {
        let switchButton = UIButton()
        switchButton.backgroundColor = .white
        
        switchButton.addTarget(self, action: #selector(self.switchAnimation), for: .touchUpInside)

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
        fromTextLabel.left(to: self, offset: margin)
        fromTextLabel.right(to: self, offset: -margin, relation: .equalOrGreater)

        fromStationLabel.topToBottom(of: fromTextLabel, offset: 5)
        fromStationLabel.left(to: self, offset: margin)
        fromStationLabel.right(to: self, offset: -margin, relation: .equalOrGreater)

        switchButton.size(CGSize(width: buttonSize, height: buttonSize))
        switchButton.layer.masksToBounds = true
        switchButton.layer.cornerRadius = buttonSize / 2

        switchButton.right(to: self, offset: -margin)
        switchButton.centerY(to: self, offset: 20)

        toTextLabel.topToBottom(of: fromStationLabel, offset: margin)
        toTextLabel.left(to: self, offset: margin)
        toTextLabel.right(to: self, offset: -margin, relation: .equalOrGreater)

        toStationLabel.topToBottom(of: toTextLabel, offset: 5)
        toStationLabel.left(to: self, offset: margin)
        toStationLabel.right(to: self, offset: -margin, relation: .equalOrGreater)
        toStationLabel.bottom(to: self, offset: -margin)
    }

    @objc func switchAnimation() {
        switchButton.isEnabled = false
        
        let fromStationLabelPos = fromStationLabel.frame.origin.y
        let toStationLabelPos = toStationLabel.frame.origin.y

        let previousToStation = toStationLabel.text
        let previousFromStation = fromStationLabel.text

        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, animations: {
            self.fromStationLabel.transform = CGAffineTransform(translationX: 0, y: toStationLabelPos - fromStationLabelPos)
            self.toStationLabel.transform = CGAffineTransform(translationX: 0, y:  fromStationLabelPos - toStationLabelPos)
        }, completion: { success in
            self.fromStationLabel.text = previousToStation
            self.toStationLabel.text = previousFromStation

            self.fromStationLabel.transform = .identity
            self.toStationLabel.transform = .identity

            self.switchButton.isEnabled = true
        })
    }
}
