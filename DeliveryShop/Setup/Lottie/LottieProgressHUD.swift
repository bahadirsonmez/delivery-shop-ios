//
//  LottieProgressHUD.swift
//  DeliveryShop
//
//  Created by ssaylanc on 6.02.2021.
//

import Foundation
import UIKit
import Lottie

class LottieProgressHUD: UIView {
    static let shared = LottieProgressHUD()
    let hudView: UIView
    var animationView: AnimationView
    
    //options
    var hudWidth:CGFloat    = 80
    var hudHeight:CGFloat   = 80
    var hudBackgroundColor  = UIColor.white
    var animationFileName   = ""
    var borderRadius:CGFloat = 15
    
    override init(frame: CGRect) {
        self.hudView = UIView()
        self.animationView = AnimationView()
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.hudView = UIView()
        self.animationView = AnimationView()
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() {
        self.addSubview(hudView)
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        if let superview = self.superview {
            self.animationView.removeFromSuperview()
            let width: CGFloat  = self.hudWidth
            let height: CGFloat = self.hudHeight
            self.frame = CGRect(x: (superview.frame.size.width / 2) - (width / 2),y: (superview.frame.height / 2) - (height / 2), width: width, height: height)//make it centered in the view
            hudView.frame = self.bounds
            hudView.backgroundColor = self.hudBackgroundColor
            layer.cornerRadius  = self.borderRadius
            layer.masksToBounds = true
            
            self.animationView = AnimationView(name: self.animationFileName)
            self.animationView.frame = CGRect(x: 0, y: 0, width: self.hudView.frame.width, height: self.hudView.frame.size.height)
            self.animationView.contentMode = .scaleAspectFill
            
            animationView.layer.cornerRadius = 20.0
            animationView.layer.shadowColor = UIColor.gray.cgColor
            animationView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            animationView.layer.shadowRadius = 12.0
            animationView.layer.shadowOpacity = 0.7
            
            self.hudView.addSubview(animationView)
            self.animationView.loopMode = .loop
            self.animationView.play()
            self.animationView.backgroundBehavior = .pauseAndRestore
            self.hide()
        }
    }
    
    func show() {
        self.isHidden = false
    }
    
    func hide() {
        self.isHidden = true
    }
}
