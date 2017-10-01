//
// Created by Marijn Schilling on 17/07/2017.
// Copyright (c) 2017 Bakken & Bæck. All rights reserved.
//

import UIKit

extension Date {
    func timeIntervalSinceBeginningOfDay() -> TimeInterval {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.hour, .minute, .second], from: self)

        let dateSeconds = dateComponents.hour! * 3600 + dateComponents.minute! * 60 + dateComponents.second!

        return TimeInterval(dateSeconds)
    }
}