//
// Created by Marijn Schilling on 01/10/2017.
// Copyright (c) 2017 Bakken & Bæck. All rights reserved.
//

import UIKit
import TinyConstraints
import SweetUIKit
import QuartzCore

class LoadView: UIView {

    fileprivate lazy var ferryImageView: UIImageView = {
        let image = UIImage(named: "ferry")
        let ferryImageView = UIImageView(image: image)

        return ferryImageView
    }()

    fileprivate lazy var wavesImageView: UIImageView = {
        let image = UIImage(named: "waves")
        let wavesImageView = UIImageView(image: image)

        return wavesImageView
    }()

    override func layoutSubviews() {
        super.layoutSubviews()

        backgroundColor = Theme.buiksloterwegveerColor

        addSubviewsAndConstraints()
    }

    private func addSubviewsAndConstraints() {
        addSubview(ferryImageView)
        addSubview(wavesImageView)

        ferryImageView.size(CGSize(width: 209, height: 81))
        ferryImageView.centerXToSuperview()
        ferryImageView.centerYToSuperview()

        wavesImageView.size(CGSize(width: 275, height: 33))
        wavesImageView.bottom(to: ferryImageView, offset: 20)
        wavesImageView.right(to: ferryImageView, offset: -26)
    }

    func animate(completion: @escaping (Bool) -> Void) {
        UIView.animate(withDuration: 3, animations: {
           self.wavesImageView.transform = CGAffineTransform(translationX: 128, y: 0)
        }, completion: { success in
            completion(success)
        })
    }
}