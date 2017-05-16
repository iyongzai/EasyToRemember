//
//  PlatformModel.swift
//  EasyToRemember
//
//  Created by Tyler.Yin on 2017/5/6.
//  Copyright © 2017年 ayong. All rights reserved.
//

import RealmSwift
import Realm

class PlatformModel: Object {
    dynamic var name = ""
    dynamic var userName = ""
    dynamic var password = ""
    dynamic var createAt: Date?
    dynamic var icon: Icon? = Icon()
    
    func configure(name: String, icon: Icon, userName: String, password: String, createAt: Date?) -> PlatformModel {
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
}


extension PlatformModel {
    class func property_CreateAt() -> String {
        return "createAt"
    }
}

