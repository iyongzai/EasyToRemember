//
//  ETRAddingAccountViewController.swift
//  EasyToRemember
//
//  Created by Tyler.Yin on 2017/4/3.
//  Copyright © 2017年 ayong. All rights reserved.
//

import UIKit
import RealmSwift

class ETRAddingAccountViewController: UITableViewController {
    
    fileprivate var editCellModelArray = [EditModel]()
    fileprivate var selectedPlatform = PlatformModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        let model1 = EditModel.init(text: "平台：", placeholder: "", textFieldIsEnabled: false, accessoryType: .disclosureIndicator)
        let model2 = EditModel.init(text: "账号：", placeholder: "请填写账号", textFieldIsEnabled: true, accessoryType: .none)
        let model3 = EditModel.init(text: "密码：", placeholder: "请填写密码", textFieldIsEnabled: true, accessoryType: .none)
        editCellModelArray.append(model1)
        editCellModelArray.append(model2)
        editCellModelArray.append(model3)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        selectedPlatform.userName = (tableView.visibleCells[1] as! ETRAddingCell).textField.text ?? ""
        selectedPlatform.password = (tableView.visibleCells[2] as! ETRAddingCell).textField.text ?? ""
        if selectedPlatform.name.length == 0 {
            print("请选择平台")
            return
        }
        if selectedPlatform.userName.length == 0 {
            print("请输入账号")
            return
        }
        if selectedPlatform.password.length == 0 {
            print("请输入密码")
            return
        }
        //存储到数据库
        let realm = try! Realm()
        try! realm.write {
            realm.add(selectedPlatform)
        }
        print("添加成功")
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return editCellModelArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ETRAddingCell", for: indexPath) as! ETRAddingCell
        cell.configure(model: editCellModelArray[indexPath.row])
        if indexPath.row == 0 {
            cell.textField.text = selectedPlatform.name
        }
        if indexPath.row == 2 {
            cell.textField.isSecureTextEntry = true
        }else{
            cell.textField.isSecureTextEntry = false
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            unowned let weakSelf = self
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "ETRSelectingPlatformViewController") as! ETRSelectingPlatformViewController
            vc.selectedPlatform = selectedPlatform
            vc.finishSelectingHandle = { (selectedPlatform) in
                weakSelf.selectedPlatform.name = selectedPlatform.name
                weakSelf.selectedPlatform.icon = selectedPlatform.icon
                DispatchQueue.main.async(execute: {
                    weakSelf.tableView.reloadRows(at: [indexPath], with: .automatic)
                })
            }
            self.show(vc, sender: nil)
        }
        for cell in tableView.visibleCells {
            (cell as! ETRAddingCell).textField.resignFirstResponder()
        }
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
