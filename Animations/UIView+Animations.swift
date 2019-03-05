//
//  UIView+Animations.swift
//  Animations
//
//  Created by Yi Wang on 3/4/19.
//  Copyright © 2019 Yi Wang. All rights reserved.
//

import UIKit

extension UIView {
    
    func move(to destination: CGPoint, duration: TimeInterval, options: UIView.AnimationOptions) {
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            self.center = destination
        }, completion: nil)
    }

    func rotate180(duration: TimeInterval, options: UIView.AnimationOptions) {
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            self.transform = self.transform.rotated(by: CGFloat.pi)
        }, completion: nil)
    }

    func addSubviewWithZoomInAnimation(_ view: UIView, duration: TimeInterval, options: UIView.AnimationOptions) {
        view.transform = view.transform.scaledBy(x: 0.01, y: 0.01)
        addSubview(view)

        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            view.transform = CGAffineTransform.identity
        }, completion: nil)
    }

    func removeWithZoomOutAnimation(duration: TimeInterval, options: UIView.AnimationOptions) {
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            self.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        }, completion: { _ in
            self.removeFromSuperview()
        })
    }

    func addSubviewWithFadeAnimation(_ view: UIView, duration: TimeInterval, options: UIView.AnimationOptions) {
        view.alpha = 0.0
        addSubview(view)

        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            view.alpha = 1.0
        }, completion: nil)
    }

    func removeWithSinkAnimation(steps: Int) {
        guard 1..<100 ~= steps else {
            fatalError("Steps must be between 0 and 100")
        }
        tag = steps
        _ = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(removeWithSinkAnimationRotateTimer), userInfo: nil, repeats: true)
    }

    @objc func removeWithSinkAnimationRotateTimer(timer: Timer) {
        let scale = transform.scaledBy(x: 0.9, y: 0.9)
        transform = scale.rotated(by: 0.314)
        alpha *= 0.98
        tag -= 1;
        if tag <= 0 {
            timer.invalidate()
            removeFromSuperview()
        }
    }

    func changeColor(to color: UIColor, duration: TimeInterval, options: UIView.AnimationOptions) {
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            self.backgroundColor = color
        }, completion: nil)
    }

}
