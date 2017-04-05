//
//  ETRPlatformCell.swift
//  EasyToRemember
//
//  Created by Tyler.Yin on 2017/4/3.
//  Copyright © 2017年 ayong. All rights reserved.
//

import UIKit

struct PlatformModel {
    var name = ""
    var icon = ""
    
    init(name: String, icon: String) {
        self.name = name
        self.icon = icon
    }
}

class ETRPlatformCell: UITableViewCell {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(model: PlatformModel) -> Void {
        self.nameLabel.text = model.name
        if model.icon.hasPrefix("http") {
            //加载网络图片
        }else {
            self.icon.image = UIImage.init(named: model.icon)
        }
    }

}
