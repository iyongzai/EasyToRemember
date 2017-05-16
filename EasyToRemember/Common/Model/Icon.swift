//
//  Icon.swift
//  EasyToRemember
//
//  Created by Tyler.Yin on 2017/5/6.
//  Copyright © 2017年 ayong. All rights reserved.
//

import RealmSwift
import Realm

class Icon: Object {
    //第一种：color
    dynamic var color: String = themeColorString
    dynamic var text: String = "容易记"//平台名字

    //第二种：fileName
    dynamic var fileName: String?//包资源文件名
    
    //第三种：url
    dynamic var url: String?//网络资源 URL
    
    func configure(color: String, text: String, fileName: String?, url: String?) -> Icon {
        self.color = color
        self.text = text
        self.fileName = fileName
        self.url = url
        
        return self
    }
}


// MARK: - 数据解析
extension Icon {
    class func model(dic: [String:String]) -> Icon {
        //eg:{"color" : "#ea4a43", "text" : "微信", "fileName" : "icon_sns_weixin_session", "url" : ""}
        let aModel = Icon()
        aModel.color = dic["color"] ?? themeColorString
        aModel.text = dic["text"] ?? "记"
        aModel.fileName = dic["fileName"]
        aModel.url = dic["url"]
        return aModel
    }
}
