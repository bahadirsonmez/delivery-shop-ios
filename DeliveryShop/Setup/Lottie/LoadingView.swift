//
//  LoadingView.swift
//  DeliveryShop
//
//  Created by ssaylanc on 6.02.2021.
//

import UIKit

class LoadingView: UIView {
    private var activityIndicatorView: UIActivityIndicatorView {
        return self.viewWithTag(1) as! UIActivityIndicatorView
    }

    var titleLabel: UILabel {
        return self.viewWithTag(2) as! UILabel
    }

    convenience init() {
        self.init(title: "Loading…")
    }

    init(title: String) {
        let activityIndicatorView = UIActivityIndicatorView(style: .medium)
        let width1 = activityIndicatorView.frame.width
        activityIndicatorView.center = CGPoint(x: width1/2, y: width1/2)
        activityIndicatorView.tag = 1
        activityIndicatorView.isUserInteractionEnabled = false

        let titleLabel = UILabel(frame: .zero)
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.tag = 2
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor(white: 102/255, alpha: 1)
        titleLabel.isUserInteractionEnabled = false

        super.init(frame: .zero)
        self.isUserInteractionEnabled = false

        self.addSubview(activityIndicatorView)
        self.addSubview(titleLabel)

        self.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints([
            NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: titleLabel, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: activityIndicatorView, attribute: .height, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: width1+4),
            NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: activityIndicatorView, attribute: .height, multiplier: 1, constant: -1)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func showInViewController(viewController: UIViewController) {
        activityIndicatorView.startAnimating()

        let view = viewController.view
        view!.addSubview(self)
        view!.addConstraints([
            NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: self.safeAreaLayoutGuide.layoutFrame.height)
        ])
    }

    func dismiss() {
        self.activityIndicatorView.stopAnimating()
        self.removeFromSuperview()
    }
}
