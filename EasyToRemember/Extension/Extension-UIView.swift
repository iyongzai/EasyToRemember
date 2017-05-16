//
//  Extension-UIView.swift
//  EasyToRemember
//
//  Created by Tyler.Yin on 2017/5/16.
//  Copyright © 2017年 ayong. All rights reserved.
//

import UIKit


// MARK: - 设置圆角
extension UIView {
    func setCornerRadius(radius: CGFloat) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
    }
}
