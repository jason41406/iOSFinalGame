//
//  PlayingGameViewController.swift
//  iOSFinalGame
//
//  Created by jasonchang on 2017/6/20.
//  Copyright © 2017年 jasonchang. All rights reserved.
//

import UIKit

class PlayingGameViewController: UIViewController {
    
    var gameInfoDic:[String:String]!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = gameInfoDic["name"]
        typeLabel.text = gameInfoDic["type"]
        scoreLabel.text = gameInfoDic["scoreSegmented"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
