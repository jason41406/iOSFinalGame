//
//  AddWantGameTableViewController.swift
//  iOSFinalGame
//
//  Created by jasonchang on 2017/6/22.
//  Copyright © 2017年 jasonchang. All rights reserved.
//

import UIKit

class AddWantGameTableViewController: UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var selectPhotoBut2: UIButton!
    @IBOutlet weak var imageView2: UIImageView!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imageView2.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
    @IBAction func selectPhoto2(_ sender: Any) {
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.delegate = self
        present(controller, animated: true, completion: nil)
    }
    @IBOutlet weak var nameTextField2: UITextField!
    @IBOutlet weak var typeTextField2: UITextField!
    @IBOutlet weak var scoreSegmented2: UISegmentedControl!
    @IBAction func done2(_ sender: Any) {
        if nameTextField2.text?.characters.count == 0 || typeTextField2.text?.characters.count == 0{
            let controller = UIAlertController(title: "錯誤", message: "請把空白的欄位填上!", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .default, handler: nil)
            controller.addAction(action)
            
            present(controller, animated: true, completion: nil)
            return
        }
        let number = Date().timeIntervalSinceReferenceDate
        
        let dic = ["name":nameTextField2.text!,
                   "type":typeTextField2.text!,
                   "photo":"\(number)",
            "scoreSegmented":"\((scoreSegmented2.selectedSegmentIndex + 1)*20)%"] as [String : String]
        
        let data = UIImageJPEGRepresentation(imageView2.image!, 0.8)
        
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("\(number)")
        
        try? data?.write(to: url!)
        
        let notiName = Notification.Name("addGame")
        NotificationCenter.default.post(name: notiName, object: nil, userInfo: dic)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    /*
     override func numberOfSections(in tableView: UITableView) -> Int {
     // #warning Incomplete implementation, return the number of sections
     return 0
     }
     
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     // #warning Incomplete implementation, return the number of rows
     return 0
     }
     */
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
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
