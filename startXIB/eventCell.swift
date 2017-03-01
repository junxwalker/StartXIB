//
//  myCell.swift
//  testTableView
//
//  Created by jun walker on 16/9/8.
//  Copyright © 2016年 junx. All rights reserved.
//

import UIKit

class eventCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!

    @IBOutlet weak var cellIcon: UIImageView!
    
    @IBOutlet weak var cellTital: UILabel!
    
    @IBOutlet weak var cellDate: UILabel!
    
    @IBOutlet weak var cellContext: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //设置cell是有圆角边框显示
        cellIcon.layer.cornerRadius = 4.0
        cellIcon.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
