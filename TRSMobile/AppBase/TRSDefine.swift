//
//  TRSDefine.swift
//  TRSMobile
//
//  Created by tung on 16/1/8.
//  Copyright © 2016年 trs. All rights reserved.
//

import UIKit

public let KScreenWidth    = UIScreen.mainScreen().bounds.size.width

public let KScreenHeight   = UIScreen.mainScreen().bounds.size.height

public let KScreenSize     = UIScreen.mainScreen().bounds

public let KTabbarHeight   = CGFloat(49)

public let KNavBar         = CGFloat(64)

public let KStatusBar      = CGFloat(20)

public let KIsSimulator    = isSimulator

let appName = Application.name             // CFBundleDisplayName : String

let appVersion = Application.version       // CFBundleShortVersionString : String

let appExecutable = Application.executable // CFBundleExecutable : String

let appBundle = Application.bundle         // CFBundleIdentifier : String

public let IS_SCREEN_4_INCH = CGSizeEqualToSize(CGSizeMake(640, 1136), UIScreen.mainScreen().currentMode!.size)
public let IS_SCREEN_35_INCH = CGSizeEqualToSize(CGSizeMake(640, 960), UIScreen.mainScreen().currentMode!.size)
public let IS_SCREEN_47_INCH = CGSizeEqualToSize(CGSizeMake(750, 1334), UIScreen.mainScreen().currentMode!.size)
public let IS_SCREEN_55_INCH = CGSizeEqualToSize(CGSizeMake(1242, 2208), UIScreen.mainScreen().currentMode!.size)


