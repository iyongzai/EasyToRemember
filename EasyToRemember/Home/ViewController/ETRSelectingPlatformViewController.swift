//
//  ETRSelectingPlatformViewController.swift
//  EasyToRemember
//
//  Created by Tyler.Yin on 2017/4/3.
//  Copyright © 2017年 ayong. All rights reserved.
//

import UIKit
import SwiftyJSON

class ETRSelectingPlatformViewController: UITableViewController {
    
    var selectedPlatform = PlatformModel.init()
    var finishSelectingHandle: ((_ selectedPlatform: PlatformModel) -> Void)?
    fileprivate var platforms = [PlatformModel]()

    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if platforms.count == 0 {
            if let jsonString = try? String.init(contentsOfFile: Bundle.main.path(forResource: "PlatformIcon", ofType: "json")!) {
                let aJSON = JSON.init(parseJSON: jsonString)
                var indexPaths = [IndexPath]()
                var index = 0
                (aJSON.arrayObject as? [[String:String]])?.forEach({ (dic) in
                    let aIcon = Icon.model(dic: dic)
                    let aPlatformModel = PlatformModel().configure(name: aIcon.text, icon: aIcon, userName: "", password: "", createAt: nil)
                    platforms.append(aPlatformModel)
                    indexPaths.append(IndexPath.init(row: index, section: 0))
                    index += 1
                })
                if indexPaths.count > 0 {
                    tableView.insertRows(at: indexPaths, with: .automatic)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func finishAction(_ sender: UIBarButtonItem) {
        if self.finishSelectingHandle != nil {
            self.finishSelectingHandle!(selectedPlatform)
        }
        self.navigationController?.popViewController(animated: true)
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return platforms.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ETRPlatformCell", for: indexPath) as! ETRPlatformCell

        if selectedPlatform.name.length == 0 {
            selectedPlatform = platforms.first!
        }
        let aModel = platforms[indexPath.row]
        cell.configure(model: aModel)
        if aModel.name == selectedPlatform.name {
            cell.accessoryType = .checkmark
            cell.tintColor = UIColor.lightRed
        }else{
            cell.accessoryType = .none
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedPlatform = platforms[indexPath.row]
        tableView.reloadData()
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
