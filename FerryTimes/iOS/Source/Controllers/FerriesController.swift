//
//  ViewController.swift
//  FerryTimes
//
//  Created by Marijn Schilling on 17/07/2017.
//  Copyright © 2017 Bakken & Bæck. All rights reserved.
//

import UIKit
import TinyConstraints

class FerriesController : UIViewController {
    static let lineViewHeight: CGFloat = 220.0

    fileprivate lazy var lineView: LineView = {
        let lineView = LineView()

        return lineView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        view.addSubview(lineView)

        lineView.top(to: view)
        lineView.right(to: view)
        lineView.left(to: view)
        lineView.height(FerriesController.lineViewHeight, relation: .equalOrGreater)
    }
}
