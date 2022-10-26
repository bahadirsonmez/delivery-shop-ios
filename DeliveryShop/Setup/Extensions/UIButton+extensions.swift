//
//  UIButton+extensions.swift
//  bolomio
//
//  Created by Serdar Aylanc on 13.09.2020.
//  Copyright © 2020 Serdar Aylanc. All rights reserved.
//

import UIKit

class ButtonWithImage: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 5, left: (bounds.width - 35), bottom: 5, right: 5)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: -60, bottom: 0, right: 0)
        }
    }
}

extension UIButton {
    func centerTextAndImage(spacing: CGFloat) {
        let insetAmount = spacing / 2
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount, bottom: 0, right: insetAmount)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: -insetAmount)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
    }
}

extension UIButton {
    func loadingIndicator(_ show: Bool, color : UIColor) {
        let tag = 808404
        if show {
            let indicator = UIActivityIndicatorView()
            indicator.style = UIActivityIndicatorView.Style.medium
            indicator.color = color
            let buttonHeight = self.bounds.size.height
            let buttonWidth = self.bounds.size.width
            self.setTitleColor(.clear, for: .normal)
            indicator.center = CGPoint(x: buttonWidth/2, y: buttonHeight/2)
            indicator.tag = tag
            self.isUserInteractionEnabled = false
            self.alpha = 1.0
            self.addSubview(indicator)
            indicator.startAnimating()
        } else {
//            self.isEnabled = true
            self.isUserInteractionEnabled = true
            self.alpha = 1.0
            self.setTitleColor(color, for: .normal)
            if let indicator = self.viewWithTag(tag) as? UIActivityIndicatorView {
                indicator.stopAnimating()
                indicator.removeFromSuperview()
            }
        }
    }
}

