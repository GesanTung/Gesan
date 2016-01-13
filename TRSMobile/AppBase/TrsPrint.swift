//
//  TrsPrint.swift
//  TRSMobile
//
//  Created by tung on 16/1/13.
//  Copyright © 2016年 trs. All rights reserved.
//

import Foundation

public func TrsPrint<T>(object: T, _ file: String = __FILE__, _ function: String = __FUNCTION__, _ line: Int = __LINE__)
{
    if TRS_DEBUG_MODE {
        var filename:String! = NSURL(fileURLWithPath: file).lastPathComponent?.URLString
        filename = filename.stringByReplacingOccurrencesOfString(".swift", withString: "_", options: NSStringCompareOptions.LiteralSearch, range: nil)
        print("\(filename)_\(function)[\(line)]: \(object)\n", terminator: "")
    }
}