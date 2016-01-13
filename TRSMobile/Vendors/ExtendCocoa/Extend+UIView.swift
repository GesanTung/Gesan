//
//  Extend+UIView.swift
//  TRSMobile
//
//  Created by tung on 16/1/13.
//  Copyright © 2016年 trs. All rights reserved.
//

import UIKit

extension UIView {
    // MARK: Frame Extensions
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        } set (value) {
            self.frame = CGRect (x: value, y: self.y, width: self.w, height: self.h)
        }
    }

    public var y: CGFloat {
        get {
            return self.frame.origin.y
        } set (value) {
            self.frame = CGRect (x: self.x, y: value, width: self.w, height: self.h)
        }
    }

    public var w: CGFloat {
        get {
            return self.frame.size.width
        } set (value) {
            self.frame = CGRect (x: self.x, y: self.y, width: value, height: self.h)
        }
    }

    public var h: CGFloat {
        get {
            return self.frame.size.height
        } set (value) {
            self.frame = CGRect (x: self.x, y: self.y, width: self.w, height: value)
        }
    }
    
    // MARK: addBorder CornerRadius
    public func addBorder (width: CGFloat,color: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.CGColor
        self.layer.masksToBounds = true
    }
    
    
    public func setCornerRadius (radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    // MARK: Gesture Extensions
    
    public func addTapGesture (tapNumber: NSInteger,
        target: AnyObject, action: Selector) {
            let tap = UITapGestureRecognizer (target: target, action: action)
            tap.numberOfTapsRequired = tapNumber
            self.addGestureRecognizer(tap)
    }
    
    public func addSwipeGesture (direction: UISwipeGestureRecognizerDirection,
        numberOfTouches: Int,
        target: AnyObject,
        action: Selector) {
            let swipe = UISwipeGestureRecognizer (target: target, action: action)
            swipe.direction = direction
            swipe.numberOfTouchesRequired = numberOfTouches
            self.addGestureRecognizer(swipe)
    }
    
    public func addPanGesture (target: AnyObject,
        action: Selector) {
            let pan = UIPanGestureRecognizer (target: target, action: action)
            self.addGestureRecognizer(pan)
    }
}
