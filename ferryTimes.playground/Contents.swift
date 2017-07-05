//: A UIKit based Playground to present user interface
  
import UIKit
import PlaygroundSupport

class Dienstregeling {

    enum Line {
        case buiksloterwegCentraalStation
        case centraalStationBuiksloterweg
    }

    var line: Line
    var departureTimes = [Date]()

    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"

        return dateFormatter
    }()

    init(line: Line) {
        self.line = line


        switch line {
        case .buiksloterwegCentraalStation:

            departureTimes = parseString(buiksloterwegCentraalStation)
        case .centraalStationBuiksloterweg:
            departureTimes = parseString(centraalStationBuiksloterweg)
        }
    }

    func parseString(_ departuresString: String) -> [Date] {
        var departures = [Date]()

        let departureTimeStrings = splitDepartureTimeStrings(from: departuresString)
        for departureTimeString in departureTimeStrings {
            if let departureTime = dateFormatter.date(from: departureTimeString) {
                departures.append(departureTime)
            }
        }

        return departures
    }

    func splitDepartureTimeStrings(from departuresString: String) -> [String] {
        var departuresStrings = [String]()
        departuresStrings = departuresString.components(separatedBy: " ")

        return departuresStrings
    }

    func timeTillNearestDeparture(from date: Date) -> TimeInterval {
        for departureTime in departureTimes {
            let compare = date.compare(departureTime)
            compare.rawValue
        }

        return 0
    }

    let centraalStationBuiksloterweg = ""
    let buiksloterwegCentraalStation = "06:30 06:36 06:42 06:48 06:54 07:00 07:04 07:08 07:12 07:16 07:20 07:24 07:28 07:32 07:36 07:40 07:44 07:48 07:52 07:56 08:00 08:04 08:08 08:12 08:16 08:20 08:24 08:28 08:32 08:36 08:40 08:44 08:48 08:52 08:56 09:00 09:04 09:08 09:12 09:16 08:05 08:09 08:13 08:17 08:21 08:25 08:29 08:33 08:37 08:41 08:45 08:49 08:53 08:57 09:01 09:05 09:09 09:13 09:17 09:21 09:20 09:24 09:28 09:32 09:36 09:40 09:44 09:48 09:52 09:56 10:00 10:06 10:12 10:18 10:24 10:30 10:36 10:42 10:48 10:54 11:00 11:06 11:12 11:18 11:24 11:30 11:36 11:42 11:48 11:54 12:00 12:06 12:12 12:18 12:24 12:30 12:36 12:42 12:48 12:54 13:00 13:06 13:12 13:18 13:24 13:30 13:36 13:42 13:48 13:54 14:00 14:06 14:12 14:18 14:24 14:30 14:36 14:42 14:48 14:54 15:00 15:06 15:12 15:18 15:24 15:30 15:36 15:40 15:44 15:48 15:52 15:56 16:00 16:04 16:08 16:12 16:16 16:20 16:24 16:28 16:32 16:36 16:40 16:44 16:48 16:52 16:56 17:00 17:04 17:08 17:12 17:16 17:20 17:24 17:28 17:32 17:36 17:40 17:44 17:48 17:52 17:56 18:00 18:04 18:08 18:12 18:16 18:20 18:24 18:28 18:32 18:36 18:42 18:48 18:54 19:00 19:06 19:12 19:18 19:24 19:30 19:36 19:42 19:48 19:54 20:00 20:06 20:12 20:18 20:24 20:30 20:36 20:42 20:48 20:54 21:00 21:06 21:12 21:18 21:24 21:30 21:36 21:42 21:48 21:54 22:00 22:06 22:12 22:18 22:24 22:30 22:36 22:42 22:48 22:54 23:00 23:06 23:12 23:18 23:24 23:30 23:36 23:42 23:48 23:54 24:00 24:12 24:24"
}

class myViewController : UIViewController {

    override func loadView() {
        let view = UIView()

        let label = UILabel()
        label.text = "Hello World!"
        label.textColor = .white

        view.addSubview(label)
        self.view = view

        let dienstregeling = Dienstregeling(line: .buiksloterwegCentraalStation)
        let timeTillNearestDeparture = dienstregeling.timeTillNearestDeparture(from: Date())
    }

}

PlaygroundPage.current.liveView = myViewController()


