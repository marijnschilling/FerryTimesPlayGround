//
//  ViewController.swift
//  FerryTimes
//
//  Created by Marijn Schilling on 17/07/2017.
//  Copyright © 2017 Bakken & Bæck. All rights reserved.
//

import UIKit
import TinyConstraints

class ViewController : UIViewController {
    static let lineViewHeight: CGFloat = 220.0

    fileprivate lazy var lineView: LineView = {
        let lineView = LineView()

        return lineView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

//        let departureTimes = DepartureTimes(line: .buiksloterwegCentraalStation)
//        let timeTillNearestDeparture = departureTimes.timeTillNearestDeparture()

        view.addSubview(lineView)

        lineView.top(to: view)
        lineView.right(to: view)
        lineView.left(to: view)
        lineView.height(ViewController.lineViewHeight, relation: .equalOrGreater)
    }
}
