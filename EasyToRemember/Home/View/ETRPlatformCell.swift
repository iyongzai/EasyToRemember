//
//  ETRPlatformCell.swift
//  EasyToRemember
//
//  Created by Tyler.Yin on 2017/4/3.
//  Copyright © 2017年 ayong. All rights reserved.
//

import UIKit

class ETRPlatformCell: UITableViewCell {
    
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        icon.setCornerRadius(radius: 17.5)
        iconLabel.setCornerRadius(radius: 17.5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(model: PlatformModel) -> Void {
        self.nameLabel.text = model.name
        self.iconLabel.backgroundColor = UIColor.init(hexColor: model.icon?.color ?? themeColorString)
        self.iconLabel.text = model.icon?.text[model.icon!.text.length-1..<model.icon!.text.length]
        if let fileName = model.icon?.fileName, fileName.length > 0 {
            icon.image = UIImage.init(named: fileName)
        }
        if let url = model.icon?.url, url.length > 0 {//读取网络图片
            //todo:读取网络图片
        }
    }

}
