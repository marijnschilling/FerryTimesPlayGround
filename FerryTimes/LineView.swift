//
// Created by Marijn Schilling on 01/10/2017.
// Copyright (c) 2017 Bakken & Bæck. All rights reserved.
//

import UIKit
import TinyConstraints
import SweetUIKit

class LineView: UIView {
    fileprivate lazy var fromTextLabel: UILabel = {
        let fromTextLabel = UILabel(withAutoLayout: true)
        fromTextLabel.font = .preferredFont(forTextStyle: .body)
        fromTextLabel.text = "Van"

        return fromTextLabel
    }()

    fileprivate lazy var fromStationLabel: UILabel = {
        let fromStationLabel = UILabel()
        fromStationLabel.font = .preferredFont(forTextStyle: .title1)
        fromStationLabel.text = "Amsterdam Centraal"

        return fromStationLabel
    }()

    fileprivate lazy var toTextLabel: UILabel = {
        let toTextLabel = UILabel()
        toTextLabel.font = .preferredFont(forTextStyle: .body)
        toTextLabel.text = "Van"

        return toTextLabel
    }()

    fileprivate lazy var toStationLabel: UILabel = {
        let toStationLabel = UILabel()
        toStationLabel.font = .preferredFont(forTextStyle: .title1)
        toStationLabel.text = "Buiksloterweg"

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

        backgroundColor = .blue

        addSubviewsAndConstraints()
    }

    private func addSubviewsAndConstraints() {
        addSubview(toTextLabel)
        addSubview(toStationLabel)

        addSubview(fromTextLabel)
        addSubview(fromStationLabel)

        addSubview(switchButton)

        toTextLabel.top(to:)

    }
}
