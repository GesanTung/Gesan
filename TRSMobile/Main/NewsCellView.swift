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
    
    @IBOutlet weak var gViewImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func initCellView(){
        gViewTitle.text = gDict["title"] as? String
        gViewImage.kf_setImageWithURL(NSURL(string: (gDict["image"] as? String)!)!, placeholderImage: nil)
    }
    
    override class func height(dict:AnyObject) -> CGFloat{
        return 80;
    }
    
}
