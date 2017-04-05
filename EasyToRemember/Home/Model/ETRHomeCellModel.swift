//
//  ETRHomeCellModel.swift
//  EasyToRemember
//
//  Created by Tyler.Yin on 2017/4/3.
//  Copyright © 2017年 ayong. All rights reserved.
//

import Foundation

struct ETRHomeCellModel {
    var platformIcon: String
    var platformTitle: String
    var platformCount: Int
    
    init(platformIcon: String, platformTitle: String, platformCount: Int) {
        self.platformIcon = platformIcon
        self.platformTitle = platformTitle
        self.platformCount = platformCount
    }
    
    mutating func updateModel(platformIcon: String, platformTitle: String, platformCount: Int) -> Void {
        self.platformIcon = platformIcon
        self.platformTitle = platformTitle
        self.platformCount = platformCount
    }
    
}
