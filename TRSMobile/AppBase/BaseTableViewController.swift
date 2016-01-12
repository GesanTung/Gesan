//
//  BaseTableViewController.swift
//  TRSMobile
//
//  Created by tung on 16/1/8.
//  Copyright © 2016年 trs. All rights reserved.
//

import UIKit
import Alamofire

class BaseTableViewController: UITableViewController {
    
    internal var gTableUrl:String?
    
    internal var gTableCellName:String?
    
    internal var delegate : BaseTableViewDelegate?
    
    private  var gDataSource = [AnyObject]()
    
    private  var gIsRefresh:Bool?
    
    private  var gCurrentPage:UInt?
    
    private  var gTotalPage:UInt?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gIsRefresh = true
        
        gCurrentPage = 0
        
        gTotalPage = 0
        
         weak var weakSelf = self as BaseTableViewController
        // 及时上拉刷新
        tableView.nowRefresh({ () -> Void in
            weakSelf?.delay(2.0, closure: { () -> () in})
            weakSelf?.delay(2.0, closure: { () -> () in
                print("nowRefresh success")
                
                weakSelf?.tableView.reloadData()
                weakSelf?.tableView.doneRefresh()
            })
        })
        
        // 上啦加载更多
        tableView.toLoadMoreAction({ () -> Void in
            print("toLoadMoreAction success")
            weakSelf?.tableView.reloadData()
            weakSelf?.tableView.doneRefresh()
            weakSelf?.tableView.endLoadMoreData()
      
        })
        
        httpDataRequest()
    }
    
    func httpDataRequest(){
        Alamofire.request(.GET, KURLAppColumn)
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    self.gDataSource += (JSON.objectForKey("datas") as! [AnyObject])
                    print("JSON: \(JSON)")
                }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        let number = (self.delegate != nil) ?(self.delegate?.tableViewNumberOfSections!(tableView))!:1
        return  number
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.gDataSource.isEmpty{
            return 0
        }else{
            let number = (self.delegate != nil) ? (self.delegate?.tableViewNumberOfRowsInSection?(tableView,section: section))! :self.gDataSource.count
            return  number
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if self.gDataSource.isEmpty {return 0}
        let obj:AnyObject? = self.gDataSource[indexPath.row]
        var height = (self.delegate != nil) ? (self.delegate?.tableViewHeightForRowAtIndexPath?(tableView, indexPath: indexPath,dict:obj))!:0
        if height>0 {return height}
        if gTableCellName != nil {
            let className = NSBundle.mainBundle().infoDictionary!["CFBundleName"] as! String + "." + gTableCellName!

            let basecell:AnyClass = NSClassFromString(className)!
            height =  (basecell as! BaseTableViewCell.Type).height(obj!)
        }
        return height
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let obj:AnyObject? = self.gDataSource[indexPath.row]
        let cell:BaseTableViewCell! = tableView.dequeueReusableCellWithIdentifier("BaseTableViewCell", forIndexPath: indexPath)as!BaseTableViewCell
        cell.gDict = obj
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

}
