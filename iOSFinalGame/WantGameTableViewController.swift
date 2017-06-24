//
//  WantGameTableViewController.swift
//  iOSFinalGame
//
//  Created by jasonchang on 2017/6/22.
//  Copyright © 2017年 jasonchang. All rights reserved.
//

import UIKit

class WantGameTableViewController: UITableViewController {

    var isUpdate = false
    var games:[[String:String]] = []
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isUpdate{
            isUpdate = false
            let indexPath = IndexPath(row:0,section:0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    func updateFile(){
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for: .documentDirectory,in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("Games.txt")
        (games as NSArray).write(to: url!, atomically: true)
    }
    
    func addfoodNoti(noti:Notification) {
        let dic = noti.userInfo as! [String:String]
        games.insert(dic, at: 0)
        updateFile()
        isUpdate = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for:.documentDirectory, in:.userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("Games.txt")
        let array = NSArray(contentsOf:url!)
        if array != nil{
            games = array as![[String:String]]
        }
        let notiName = Notification.Name("addGame")
        NotificationCenter.default.addObserver(self, selector: #selector(PlayingGameTableViewController.addfoodNoti(noti:)), name: notiName, object: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return games.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wantGameCell", for: indexPath)
        
        let dic = games[indexPath.row]
        
        // Configure the cell...
        
        cell.textLabel?.text = dic["name"]
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("\(dic["photo"]!)")
        cell.imageView?.image = UIImage(contentsOfFile: url!.path)
        
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        games.remove(at: indexPath.row)
        updateFile()
        self.tableView.deleteRows(at: [indexPath], with: .automatic)    }
    
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
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showWantGameDetail" {
            let indexPath = self.tableView.indexPathForSelectedRow
            let dic:[String:String]
            dic = games[indexPath!.row]
            let controller = segue.destination as! WantGameViewController
            controller.gameInfoDic = dic
        }
    }

}
