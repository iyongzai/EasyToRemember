//
//  ETRDetailPlainCell.swift
//  EasyToRemember
//
//  Created by KuaiMeiZhuang on 2017/4/17.
//  Copyright © 2017年 ayong. All rights reserved.
//

import UIKit

class ETRDetailPlainCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
