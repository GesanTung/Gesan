//
//  NewsCellView.swift
//  TRSMobile
//
//  Created by tung on 16/1/12.
//  Copyright © 2016年 trs. All rights reserved.
//

import UIKit

class NewsCellView: BaseTableViewCell {

    @IBOutlet weak var gViewTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func initCellView(){
        gViewTitle.text = String(gDict["title"])
    }
    
    override class func height(dict:AnyObject) -> CGFloat{
        return 80;
    }
    
}
