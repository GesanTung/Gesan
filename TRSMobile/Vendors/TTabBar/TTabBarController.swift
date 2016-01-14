//
//  TTabBarController.swift
//  TRSMobile
//
//  Created by tung on 16/1/14.
//  Copyright © 2016年 trs. All rights reserved.
//

import UIKit

class TTabBarItem: UITabBarItem {
    

    @IBInspectable var textColor: UIColor = UIColor.blackColor()
    
    
    var iconView: (icon: UIImageView, textLabel: UILabel)?
    
    func select() {
        iconView!.textLabel.textColor = kTabBarTextSelectedColor
        
        if let iconImage = iconView!.icon.image {
            let renderImage = iconImage.imageWithRenderingMode(.AlwaysTemplate)
            iconView!.icon.image = renderImage
            iconView!.icon.tintColor = kTabBarTextSelectedColor
        }
       
    }
    
    func deselect() {
        iconView!.textLabel.textColor = kTabBarTextDeSelectedColor
        
        if let iconImage = iconView!.icon.image {
            let renderImage = iconImage.imageWithRenderingMode(.AlwaysTemplate)
            iconView!.icon.image = renderImage
        }
    }
    
    func selectedState() {
        iconView!.textLabel.textColor = kTabBarTextSelectedColor
        
        if let iconImage = iconView!.icon.image {
            let renderImage = iconImage.imageWithRenderingMode(.AlwaysTemplate)
            iconView!.icon.image = renderImage
            iconView!.icon.tintColor = kTabBarTextSelectedColor
        }
    }
}

class TTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let containers = createViewContainers()
        
        createCustomIcons(containers)
    }
    func createCustomIcons(containers : NSDictionary) {
        
        if let _ = tabBar.items {
            let itemsCount = tabBar.items!.count as Int - 1
            var index = 0
            for item in self.tabBar.items as! [TTabBarItem] {
                
                assert(item.image != nil, "add image icon in UITabBarItem")
                
                let container : UIView = containers["container\(itemsCount-index)"] as! UIView
                container.tag = index
                
                let icon = UIImageView(image: item.image)
                icon.translatesAutoresizingMaskIntoConstraints = false
                icon.tintColor = UIColor.clearColor()
                
                // text
                let textLabel = UILabel()
                textLabel.text = item.title
                textLabel.backgroundColor = UIColor.clearColor()
                textLabel.textColor = item.textColor
                textLabel.font = UIFont.systemFontOfSize(10)
                textLabel.textAlignment = NSTextAlignment.Center
                textLabel.translatesAutoresizingMaskIntoConstraints = false
                
                container.addSubview(icon)
                createConstraints(icon, container: container, size: item.image!.size, yOffset: -5)
                
                container.addSubview(textLabel)
                let textLabelWidth = tabBar.frame.size.width / CGFloat(tabBar.items!.count) - 5.0
                createConstraints(textLabel, container: container, size: CGSize(width: textLabelWidth , height: 10), yOffset: 16)
                
                item.iconView = (icon:icon, textLabel:textLabel)
                
                if 0 == index { // selected first elemet
                    item.selectedState()
                }
                
                item.image = nil
                item.title = ""
                index++
            }
        }
    }
    
    func createConstraints(view:UIView, container:UIView, size:CGSize, yOffset:CGFloat) {
        
        let constX = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: container,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1,
            constant: 0)
        container.addConstraint(constX)
        
        let constY = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: NSLayoutRelation.Equal,
            toItem: container,
            attribute: NSLayoutAttribute.CenterY,
            multiplier: 1,
            constant: yOffset)
        container.addConstraint(constY)
        
        let constW = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: size.width)
        view.addConstraint(constW)
        
        let constH = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: size.height)
        view.addConstraint(constH)
    }
    
    func createViewContainers() -> NSDictionary {
        
        var containersDict = [String: AnyObject]()
        let itemsCount : Int = tabBar.items!.count as Int - 1
        
        for index in 0...itemsCount {
            let viewContainer = createViewContainer()
            containersDict["container\(index)"] = viewContainer
        }
        
        //let keys = containersDict.keys
        
        var formatString = "H:|-(0)-[container0]"
        for index in 1...itemsCount {
            formatString += "-(0)-[container\(index)(==container0)]"
        }
        formatString += "-(0)-|"
        let  constranints = NSLayoutConstraint.constraintsWithVisualFormat(formatString,
            options:NSLayoutFormatOptions.DirectionRightToLeft,
            metrics: nil,
            views: (containersDict as [String : AnyObject]))
        view.addConstraints(constranints)
        
        return containersDict
    }
    
    func createViewContainer() -> UIView {
        let viewContainer = UIView();
        viewContainer.backgroundColor = UIColor.clearColor() // for test
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewContainer)
        
        // add gesture
        let tapGesture = UITapGestureRecognizer(target: self, action: "tapHandler:")
        tapGesture.numberOfTouchesRequired = 1
        viewContainer.addGestureRecognizer(tapGesture)
        
        // add constrains
        let constY = NSLayoutConstraint(item: viewContainer,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: 0)
        
        view.addConstraint(constY)
        
        let constH = NSLayoutConstraint(item: viewContainer,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: tabBar.frame.size.height)
        viewContainer.addConstraint(constH)
        
        return viewContainer
    }
    
    // MARK: actions
    
    func tapHandler(gesture:UIGestureRecognizer) {
        
        let items = tabBar.items as! [TTabBarItem]
        
        let currentIndex = gesture.view!.tag
        
        if let shouldSelect = delegate?.tabBarController?(self, shouldSelectViewController: self)
            where !shouldSelect {
                return
        }
        
        if selectedIndex != currentIndex {
            let selectItem : TTabBarItem = items[currentIndex]
            selectItem.select()
            
            let deselectItem = items[selectedIndex]
            deselectItem.deselect()
            
            selectedIndex = gesture.view!.tag
            
            delegate?.tabBarController?(self, didSelectViewController: self)
        } else if selectedIndex == currentIndex {
            
            if let navVC = self.viewControllers![selectedIndex] as? UINavigationController {
                navVC.popToRootViewControllerAnimated(true)
            }
        }
    }
    
    func setSelectIndex(from from:Int,to:Int) {
        self.selectedIndex = to
        let items = self.tabBar.items as! [TTabBarItem]
        items[from].deselect()
        items[to].select()
    }

}
