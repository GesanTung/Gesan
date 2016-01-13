//
//  Extend+UIButton.swift
//  TRSMobile
//
//  Created by tung on 16/1/13.
//  Copyright © 2016年 trs. All rights reserved.
//

import UIKit


let NAV_BAR_HEIGHT = CGFloat(40.0)
let NAV_BUTTON_MIN_WIDTH = CGFloat(40.0)
let NAV_BUTTON_MIN_HEIGHT = CGFloat(40.0)

extension UIButton{
    public convenience init(navImage: UIImage){
        var buttonFrame = CGRectMake(CGFloat(0.0), CGFloat(0.0), navImage.size.width, NAV_BAR_HEIGHT)
        if  buttonFrame.size.width < NAV_BUTTON_MIN_WIDTH
        {
            buttonFrame.size.width = NAV_BUTTON_MIN_WIDTH
        }
        if buttonFrame.size.height < NAV_BUTTON_MIN_HEIGHT
        {
            buttonFrame.size.height = NAV_BUTTON_MIN_HEIGHT
        }
        self.init(frame:buttonFrame)
        self.contentMode = UIViewContentMode.ScaleAspectFill
        self.backgroundColor = UIColor.clearColor()
        self.setImage(navImage, forState: UIControlState.Normal)
    }
    
    public convenience init(navTitle: String,color: UIColor){
        let titleSize = navTitle.boundingRectWithSize(CGSizeMake(999999.0, NAV_BAR_HEIGHT), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: Dictionary(dictionaryLiteral: (NSFontAttributeName,UIFont.systemFontOfSize(16.0))), context: nil).size
        var buttonFrame = CGRectMake(CGFloat(0.0), CGFloat(0.0), titleSize.width, NAV_BAR_HEIGHT)
        if  buttonFrame.size.width < NAV_BUTTON_MIN_WIDTH
        {
            buttonFrame.size.width = NAV_BUTTON_MIN_WIDTH
        }
        if buttonFrame.size.height < NAV_BUTTON_MIN_HEIGHT
        {
            buttonFrame.size.height = NAV_BUTTON_MIN_HEIGHT
        }
        self.init(frame: buttonFrame)
        self.contentMode = UIViewContentMode.ScaleAspectFill
        self.backgroundColor = UIColor.clearColor()
        self.titleLabel?.font = UIFont.systemFontOfSize(16.0)
        self.setTitleColor(color, forState: UIControlState.Normal)
        self.setTitle(navTitle, forState: UIControlState.Normal)
    }
    
}
