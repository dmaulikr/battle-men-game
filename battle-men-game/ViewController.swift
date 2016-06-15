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
    
    @IBOutlet weak var restartGameBtn: UIButton!
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
    
    @IBAction func restartGameBtnTapped(sender: AnyObject) {
        enemyAttackLbl.text = "Attack!"
        playerAttackLbl.text = "Attack!"
        restartGameBtn.hidden = true
        enemyImg.hidden = false
        playerImg.hidden = false
        player = Player(startingHp: 100, attackPwr: 10, name: "Good Dude")
        enemy = Enemy(startingHp: 100, attackPwr: 10, name: "Bad Dude")
        printLbl.text = "\(enemy.name) vs. \(player.name)! Attack!"
        
        
    }
    
    //Enemy controls
    
    @IBAction func enemyAttackBtn(sender: AnyObject) {
        if player.attemptAttack(enemy.attackPwr) {
            printLbl.text = "Attacked \(player.name) for \(enemy.attackPwr) hp"
            playerAttackLbl.text = "\(player.hp) hp"
            
            disablePlayerAttackBtn()
            
        } else {
            printLbl.text = "Attack was unsuccessful"
        }
        
        if !enemy.isAlive {
            printLbl.text = "\(enemy.name) killed \(player.name)"
        }
        if !player.isAlive {
            printLbl.text = "\(player.name) killed \(enemy.name)"
            playerImg.hidden = true
            playerAttackLbl.text = "Game Over!"
            enemyAttackLbl.text = "You Won!"
            restartGameBtn.hidden = false
        }
    }
    
    //Player controlls
    
    @IBAction func playerAttackBtn(sender: AnyObject) {
        if enemy.attemptAttack(player.attackPwr) {
            printLbl.text = "Attacked \(enemy.name) for \(player.attackPwr) hp"
            enemyAttackLbl.text = "\(enemy.hp) hp"
            
            disableEnemyAttackBtn()
            
        } else {
            printLbl.text = "Attack was unsuccessful"
        }
        
        if !player.isAlive {
            printLbl.text = "\(player.name) killed \(enemy.name)"
        }
        if !enemy.isAlive {
            printLbl.text = "\(enemy.name) killed \(player.name)"
            enemyImg.hidden = true
            playerAttackLbl.text = "You won!"
            enemyAttackLbl.text = "Game Over!"
            restartGameBtn.hidden = false
            
        }
    }
    
    
    // Timer functions
    
    func disableEnemyAttackBtn() {
        enemyAttackBtn.enabled = false
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "enableEnemyAttackBtn", userInfo: nil, repeats: false)
        
    }
    
    func enableEnemyAttackBtn() {
        enemyAttackBtn.enabled = true
    }
    
    func disablePlayerAttackBtn() {
        playerAttackBtn.enabled = false
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "enablePlayerAttackBtn", userInfo: nil, repeats: false)
        
    }
    
    func enablePlayerAttackBtn() {
        playerAttackBtn.enabled = true
    }
    
    
    
}