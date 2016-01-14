//
//  BaseViewController.swift
//  TRSMobile
//
//  Created by tung on 16/1/8.
//  Copyright © 2016年 trs. All rights reserved.
//

import UIKit

public enum NAV : Int {
    case LEFT
    case RIGHT
}

class BaseViewController: UIViewController,BaseViewControllerProtocol {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavBarView()
        
        initContentData()
        
        initContentView()
    }
    
    func setNavBarButton(position:NAV,string:String){
        if string .hasSuffix(".png")||string .hasSuffix(".png"){
            self.setNavBarButton(position, button: UIButton(navImage: UIImage(named: string)!))
        }else{
            self.setNavBarButton(position,title: string)
        }
    }
    
    //导航条左右按钮设置 NAV是一个枚举值：.LEFT,.RIGHT
    func setNavBarButton(position:NAV,title:String,fontColor:UIColor = UIColor.whiteColor()){
        self.setNavBarButton(position, button: UIButton(navTitle: title, color: fontColor))
    }
    
    func setNavBarButton(position:NAV,imageName:String) -> Void{
        self.setNavBarButton(position, button: UIButton(navImage: UIImage(named: imageName)!))
    }
    
    func setNavBarButton(position:NAV,button:UIButton?){
        // 1
        let nav = self.navigationController?.navigationBar
        // 2
        nav?.barTintColor  = UIColor(red: 20/255.0, green: 155/255, blue: 89/255, alpha: 1.0)
        
        // 5
        nav?.titleTextAttributes =  NSDictionary(object: UIColor.whiteColor(),
            forKey:   NSForegroundColorAttributeName) as? [String : AnyObject]
        if position == .LEFT {
            button?.addTarget(self, action: Selector("leftButtonTouch"), forControlEvents: UIControlEvents.TouchUpInside)
            self.navigationItem.leftBarButtonItem = nil
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button!)
            self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        }else if position == .RIGHT {
            button?.addTarget(self, action: Selector("rightButtonTouch"), forControlEvents: UIControlEvents.TouchUpInside)
            self.navigationItem.rightBarButtonItem = nil
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button!)
        }
    }
    
    func setNavTitle(title:String){
        navigationItem.title = title
    }
    
    func setNavTitleView(titleView:UIView){
        self.navigationItem.titleView = titleView
    }
    
    func initNavBarView(){
        // 1
        let nav = self.navigationController?.navigationBar
        // 2
        nav?.barTintColor  = UIColor(red: 20/255.0, green: 155/255, blue: 89/255, alpha: 1.0)
        
        // 5
        nav?.titleTextAttributes =  NSDictionary(object: UIColor.whiteColor(),
            forKey:   NSForegroundColorAttributeName) as? [String : AnyObject]
    }
    
    func initContentView() {
        
    }
    
    func initContentData() {
        
    }
    
    func updateView(data: AnyObject) {
        
    }
    
    func leftButtonTouch(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func rightButtonTouch(){
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
