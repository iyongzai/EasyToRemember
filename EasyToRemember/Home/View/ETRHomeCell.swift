//
//  ETRHomeCell.swift
//  EasyToRemember
//
//  Created by Tyler.Yin on 2017/4/3.
//  Copyright © 2017年 ayong. All rights reserved.
//

import UIKit

class ETRHomeCell: UITableViewCell {
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var platformIcon: UIImageView!
    @IBOutlet weak var platformTitle: UILabel!
    @IBOutlet weak var platformCount: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        platformIcon.setCornerRadius(radius: 17.5)
        iconLabel.setCornerRadius(radius: 17.5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func configure(model: ETRHomeCellModel) -> Void {
        //icon
        self.iconLabel.backgroundColor = UIColor.init(hexColor: model.platformModels[0].icon?.color ?? themeColorString)
        self.iconLabel.text = model.platformModels[0].icon?.text
        self.iconLabel.text = model.platformModels[0].icon?.text[model.platformModels[0].icon!.text.length-1..<model.platformModels[0].icon!.text.length]
        if let fileName = model.platformModels[0].icon?.fileName, fileName.length > 0 {
            platformIcon.image = UIImage.init(named: fileName)
        }
        if let url = model.platformModels[0].icon?.url, url.length > 0 {//读取网络图片
            //todo:读取网络图片
        }
        
        //title
        platformTitle.text = model.platformModels.first!.name
        platformCount.text = "\(model.platformModels.count)个"
    }

}
