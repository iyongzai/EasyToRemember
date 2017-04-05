//
//  ETRAddingCell.swift
//  EasyToRemember
//
//  Created by Tyler.Yin on 2017/4/3.
//  Copyright © 2017年 ayong. All rights reserved.
//

import UIKit


struct EditModel {
    var text = ""
    var placeholder = ""
    var textFieldIsEnabled = true
    var accessoryType = UITableViewCellAccessoryType.disclosureIndicator
    init(text: String, placeholder: String, textFieldIsEnabled: Bool, accessoryType: UITableViewCellAccessoryType) {
        self.text = text
        self.placeholder = placeholder
        self.textFieldIsEnabled = textFieldIsEnabled
        self.accessoryType = accessoryType
    }
}

class ETRAddingCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(model: EditModel) -> Void {
        label.text = model.text
        textField.placeholder = model.placeholder
        textField.isEnabled = model.textFieldIsEnabled
        self.accessoryType = model.accessoryType
    }

}
