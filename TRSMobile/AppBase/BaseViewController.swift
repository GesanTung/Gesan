//
//  BaseViewController.swift
//  TRSMobile
//
//  Created by tung on 16/1/8.
//  Copyright © 2016年 trs. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController,BaseViewControllerProtocol {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initContentData()
        
        initContentView()
    }
    
    func initContentView() {
        
    }
    
    func initContentData() {
        
    }
    
    func updateView(data: AnyObject) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
