//
//  ViewController.swift
//  Two Fighters Game
//
//  Created by Atef H Ataya on 11/30/15.
//  Copyright © 2015 Atef H Ataya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playerButton: UIButton!
    
    @IBOutlet weak var enemyButton: UIButton!
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var player: Character!
    var enemy: Character!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        
        let hpPlayer = Int(arc4random_uniform(100))
        let hpEnemy = Int(arc4random_uniform(100))
        
        let powerPlayer = Int(arc4random_uniform(30))
        let powerEnemy = Int(arc4random_uniform(30))

        
    
        player = Character(startingHp: hpPlayer, attackPwr: powerPlayer, playerName: "Player")
        enemy = Character(startingHp: hpEnemy, attackPwr: powerEnemy, playerName: "Enemy")
        
        print (player.hp)
        print(enemy.hp)
        print(player.attackPwr)
        print(enemy.attackPwr)
        
    }


    @IBAction func playerAction(sender: AnyObject) {
        
        if enemy.attemptAttack(player.attackPwr){
            
            outputLabel.text = "\(player.name) attack \(enemy.name)"
        } else {
            outputLabel.text = "Attack was unsuccessful"
        }
        
        if !enemy.isAlive {
            outputLabel.text = "\(player.name) killed \(enemy.name)"
            
        }
        
        self.playerButton.enabled = false
        NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "enablePlayerButton", userInfo: nil, repeats: false)
        
    }
    func enablePlayerButton () {
        
        if self.playerButton.enabled == false {
            self.playerButton.enabled = true
        }
        
        
    }
    
    func enableEnemyButton () {
        
        if self.enemyButton.enabled == false {
            self.enemyButton.enabled = true
        }
    }
    @IBAction func enemyAction(sender: AnyObject) {
        
        if player.attemptAttack(enemy.attackPwr) {
            outputLabel.text = "\(enemy.name) attack \(player.name)"
        }else {
            outputLabel.text = "Attack was usuccessful"
        }
        
        if !player.isAlive {
            outputLabel.text = "\(enemy.name) killed \(player.name)"
        }
        
        self.enemyButton.enabled = false
        NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "enableEnemyButton", userInfo: nil, repeats: false)

    }
    
    func restartGame(){
        
        
    }
    
}

