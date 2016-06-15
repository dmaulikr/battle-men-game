//
//  ViewController.swift
//  battle-men-game
//
//  Created by Math LLC on 6/14/16.
//  Copyright © 2016 Math LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets
    
    @IBOutlet weak var enemyAttackLbl: UILabel!
    
    @IBOutlet weak var playerAttackLbl: UILabel!
    
    @IBOutlet weak var enemyImg: UIImageView!
    
    @IBOutlet weak var playerImg: UIImageView!
    
    @IBOutlet weak var printLbl: UILabel!
    
    @IBOutlet weak var enemyAttackBtn: UIButton!
    
    @IBOutlet weak var playerAttackBtn: UIButton!
    //Characters
    
    var player = Player(startingHp: 100, attackPwr: 10, name: "Good Dude")
    var enemy = Enemy(startingHp: 100, attackPwr: 10, name: "Bad Dude")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        printLbl.text = "\(enemy.name) vs. \(player.name)! Attack!"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func restartGameBtn(sender: AnyObject) {
    }
    
    @IBAction func enemyAttackBtn(sender: AnyObject) {
        if player.attemptAttack(enemy.attackPwr) {
            printLbl.text = "Attacked \(player.name) for \(enemy.attackPwr) hp"
            playerAttackLbl.text = "\(player.hp) hp"
            
            disableEnemyAttackBtn()
            
        } else {
            printLbl.text = "Attack was unsuccessful"
        }
    }
    
    @IBAction func playerAttackBtn(sender: AnyObject) {
        if enemy.attemptAttack(player.attackPwr) {
            printLbl.text = "Attacked \(enemy.name) for \(player.attackPwr) hp"
            enemyAttackLbl.text = "\(enemy.hp) hp"
        } else {
            printLbl.text = "Attack was unsuccessful"
        }
    }
    
    func disableEnemyAttackBtn() {
        enemyAttackBtn.enabled = false
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "enableEnemyAttackBtn", userInfo: nil, repeats: false)
        
    }
    
    func enableEnemyAttackBtn() {
        enemyAttackBtn.enabled = true
    }
    
    
}