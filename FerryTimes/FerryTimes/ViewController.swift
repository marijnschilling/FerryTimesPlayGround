//
//  ViewController.swift
//  FerryTimes
//
//  Created by Marijn Schilling on 17/07/2017.
//  Copyright © 2017 Bakken & Bæck. All rights reserved.
//

import UIKit

class ViewController : UIViewController {

    lazy var timeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        label.text = "Hello World!"
        label.textColor = .black

        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(timeLabel)

        let departureTimes = DepartureTimes(line: .buiksloterwegCentraalStation)
        let timeTillNearestDeparture = departureTimes.timeTillNearestDeparture()

        self.timeLabel.text = "\(timeTillNearestDeparture)"
    }
}