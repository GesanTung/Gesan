//
//  BaseTableViewCell.swift
//  TRSMobile
//
//  Created by tung on 16/1/8.
//  Copyright © 2016年 trs. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    var gDict:AnyObject!{
        didSet {
            initCellView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //TODO 初始化cell 内容
    func initCellView(){
    
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    static func height(dict:AnyObject) -> float_t{
        return 0;
    }

}
