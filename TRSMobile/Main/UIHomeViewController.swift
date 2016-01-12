//
//  UIHomeViewController.swift
//  TRSMobile
//
//  Created by tung on 16/1/8.
//  Copyright © 2016年 trs. All rights reserved.
//
import Alamofire
import UIKit

class UIHomeViewController: BaseViewController,BaseTableViewDelegate {
    
    var gDataChannel : NSMutableArray?
    
    var gViewContent = BaseTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func initContentView() {
        // 1
        let nav = self.navigationController?.navigationBar
        // 2
        nav?.barTintColor  = UIColor(red: 20/255.0, green: 155/255, blue: 89/255, alpha: 1.0)

        // 5
        nav?.titleTextAttributes =  NSDictionary(object: UIColor.whiteColor(),
            forKey:   NSForegroundColorAttributeName) as? [String : AnyObject]
        
        navigationItem.title = "首页"
        
        gViewContent.gTableUrl = KURLAppColumn
        gViewContent.delegate = self;
        gViewContent.gTableCellName = "NewsCellView"
        gViewContent.view.frame = CGRectMake(0,0,KScreenWidth,KScreenHeight)
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
    
    func tableViewDidSelectRowAtIndexPath(tableView: UITableView!,indexPath: NSIndexPath!,dict:AnyObject!){
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
