//
//  ETRHomeCell.swift
//  EasyToRemember
//
//  Created by Tyler.Yin on 2017/4/3.
//  Copyright © 2017年 ayong. All rights reserved.
//

import UIKit

class ETRHomeCell: UITableViewCell {
    @IBOutlet weak var platformIcon: UIImageView!
    @IBOutlet weak var platformTitle: UILabel!
    @IBOutlet weak var platformCount: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        platformIcon.layer.masksToBounds = true
        platformIcon.layer.cornerRadius = 17.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func configure(model: ETRHomeCellModel) -> Void {
        //icon
        if model.platformModels.first!.icon.hasPrefix("http") {
            //读取网络图片
            //todo:读取网络图片
        }else{//本地图片
            platformIcon.image = UIImage.init(named: model.platformModels.first!.icon)
        }
        
        //title
        platformTitle.text = model.platformModels.first!.name
        platformCount.text = "\(model.platformModels.count)个"
    }

}
