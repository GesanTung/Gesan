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
        
        initContentData()
        
        initContentView()
    }
    
    //导航条左右按钮设置 NAV是一个枚举值：.LEFT,.RIGHT
    func showBarButton(position:NAV,title:String,fontColor:UIColor){
        self.showBarButton(position, button: UIButton(navTitle: title, color: fontColor))
    }
    
    func showBarButton(position:NAV,imageName:String) -> Void{
        self.showBarButton(position, button: UIButton(navImage: UIImage(named: imageName)!))
    }
    
    func showBarButton(position:NAV,button:UIButton?){
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
    
    func setTitleView(titleView:UIView){
        self.navigationItem.titleView = titleView
    }
    
     func leftButtonTouch(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
     func rightButtonTouch(){
        
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
