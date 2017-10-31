//
// Created by Marijn Schilling on 26/10/2017.
//

import UIKit

extension UIViewController {
    open func navigationBarBottomAnchor() -> NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return view.safeAreaLayoutGuide.topAnchor
        } else {
            return topLayoutGuide.bottomAnchor
        }
    }

    open func layoutGuide() -> UILayoutGuide {
        if #available(iOS 11.0, *) {
            return view.safeAreaLayoutGuide
        } else {
            let layoutGuide = UILayoutGuide()
            view.addLayoutGuide(layoutGuide)

            layoutGuide.topAnchor.constraint(equalTo:  topLayoutGuide.bottomAnchor).isActive = true
            layoutGuide.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor).isActive = true
            layoutGuide.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            layoutGuide.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true

            return layoutGuide
        }
    }
}