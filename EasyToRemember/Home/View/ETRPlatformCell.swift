//
//  ETRPlatformCell.swift
//  EasyToRemember
//
//  Created by Tyler.Yin on 2017/4/3.
//  Copyright © 2017年 ayong. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class PlatformModel: Object {
    dynamic var name = ""
    dynamic var icon = ""
    dynamic var userName = ""
    dynamic var password = ""
    dynamic var createAt: Date?
    
    func configure(name: String, icon: String, userName: String, password: String, createAt: Date?) -> PlatformModel {
        self.name = name
        self.icon = icon
        self.userName = userName
        self.password = password
        self.createAt = createAt
        
        return self
    }
    func update(newPlatformModel: PlatformModel) -> Void {
        self.name = newPlatformModel.name
        self.icon = newPlatformModel.icon
        self.userName = newPlatformModel.userName
        self.password = newPlatformModel.password
        self.createAt = newPlatformModel.createAt
    }
    
    class func property_CreateAt() -> String {
        return "createAt"
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
