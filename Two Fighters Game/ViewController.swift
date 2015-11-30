//
//  ViewController.swift
//  Two Fighters Game
//
//  Created by Atef H Ataya on 11/30/15.
//  Copyright © 2015 Atef H Ataya. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    @IBOutlet weak var playerButton: UIButton!
    
    @IBOutlet weak var enemyButton: UIButton!
    
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBOutlet weak var restartButton: UIButton!
    
    var player: Character!
    var enemy: Character!
    
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        initialize()
        
    }

    func initialize(){
        self.restartButton.enabled = false
        self.restartButton.hidden = true
        
        let hpPlayer = Int(arc4random_uniform(100))
        let hpEnemy = Int(arc4random_uniform(100))
        
        let powerPlayer = Int(arc4random_uniform(30))
        let powerEnemy = Int(arc4random_uniform(30))
        
        
        
        player = Character(startingHp: hpPlayer, attackPwr: powerPlayer, playerName: "Player")
        enemy = Character(startingHp: hpEnemy, attackPwr: powerEnemy, playerName: "Enemy")
        
        self.playerButton.enabled = true
        self.enemyButton.enabled = true
        self.outputLabel.text = "Click Attack to Start"
    }

    @IBAction func playerAction(sender: AnyObject) {
        playMusicAttack()
        
        if enemy.attemptAttack(player.attackPwr){
            
            outputLabel.text = "\(player.name) attack \(enemy.name)"
            self.enemyButton.enabled = false
            NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "enableEnemyButton", userInfo: nil, repeats: false)
        } else {
            outputLabel.text = "Attack was unsuccessful"
        }
        
        if !enemy.isAlive {
            playMusicDeath()
            outputLabel.text = "\(player.name) killed \(enemy.name)"
            self.playerButton.enabled = false
            self.enemyButton.enabled = false
            self.outputLabel.text = "Player WON!!!!The End"
            self.restartButton.hidden = false
            self.restartButton.enabled = true
        }
    }
 
    @IBAction func enemyAction(sender: AnyObject) {
        playMusicAttack()
        if player.attemptAttack(enemy.attackPwr) {
            outputLabel.text = "\(enemy.name) attack \(player.name)"
            self.playerButton.enabled = false
            NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "enablePlayerButton", userInfo: nil, repeats: false)
        }else {
            outputLabel.text = "Attack was usuccessful"
        }
        
        if !player.isAlive {
            playMusicDeath()
            outputLabel.text = "\(enemy.name) killed \(player.name)"
            self.playerButton.enabled = false
            self.enemyButton.enabled = false
            self.outputLabel.text = "Enemy WON!!!!The End"
            self.restartButton.hidden = false
            self.restartButton.enabled = true
        }
    }

    @IBAction func restartAction(sender: AnyObject) {
        initialize()
    }
    
    func enablePlayerButton () {
        
        if self.restartButton.enabled != true {
            self.playerButton.enabled = true
        }
    }
    
    func enableEnemyButton () {
        if self.restartButton.enabled != true{
            self.enemyButton.enabled = true
        }
    }
    
    func playMusicAttack (){
        
        do{
            let soundPath = NSBundle.mainBundle().pathForResource("Attack", ofType: ".mp3")
            let soundURL = NSURL.fileURLWithPath(soundPath!)
            try! self.audioPlayer = AVAudioPlayer (contentsOfURL: soundURL)
            self.audioPlayer.prepareToPlay()
            self.audioPlayer.play()
            
        } catch let err as NSError {
            print (err)
        }
        
        
    }
    func playMusicDeath(){
        do{
            let soundPath = NSBundle.mainBundle().pathForResource("Death", ofType: ".mp3")
            let soundURL = NSURL.fileURLWithPath(soundPath!)
            try! self.audioPlayer = AVAudioPlayer (contentsOfURL: soundURL)
            self.audioPlayer.prepareToPlay()
            self.audioPlayer.play()
            
        } catch let err as NSError {
            print (err)
        }
    }
}

