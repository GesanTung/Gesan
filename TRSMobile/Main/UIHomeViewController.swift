//
//  UIHomeViewController.swift
//  TRSMobile
//
//  Created by tung on 16/1/8.
//  Copyright © 2016年 trs. All rights reserved.
//
import Alamofire
import UIKit

class UIHomeViewController: BaseViewController {
    
    var gDataChannel : NSMutableArray?
    
    var gViewContent = BaseTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func initContentView() {
        gViewContent.gTableUrl = KURLAppColumn
        gViewContent.view.frame = CGRectMake(0,KNavBar,KScreenWidth,KScreenHeight-KNavBar)
        self.view .addSubview(gViewContent.view)
        addChildViewController(gViewContent)
    }
    
    override func initContentData() {
        gDataChannel = NSMutableArray();
        
        Alamofire.request(.GET, KURLAppColumn)
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                   self.gDataChannel!.addObjectsFromArray(JSON.objectForKey("datas") as! [AnyObject])
                    print("JSON: \(JSON)")
                }
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
