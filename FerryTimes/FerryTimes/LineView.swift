//
// Created by Marijn Schilling on 01/10/2017.
// Copyright (c) 2017 Bakken & Bæck. All rights reserved.
//

import UIKit

class LineView: UIView {
    fileprivate lazy var fromTextLabel: UILabel = {
        let fromTextLabel = UILabel()

        return fromTextLabel
    }()

    fileprivate lazy var fromStationLabel: UILabel = {
        let fromStationLabel = UILabel()

        return fromStationLabel
    }()

    fileprivate lazy var toTextLabel: UILabel = {
        let toTextLabel = UILabel()

        return toTextLabel
    }()

    fileprivate lazy var toStationLabel: UILabel = {
        let toStationLabel = UILabel()

        return toStationLabel
    }()

    fileprivate lazy var switchButton: UIButton = {
        let switchButton = UIButton()

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

        addSubviewsAndConstraints()
    }

    private func addSubviewsAndConstraints() {
        
    }
}
