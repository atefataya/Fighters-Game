//
//  Character.swift
//  2-D Game - OOP
//
//  Created by Atef H Ataya on 11/30/15.
//  Copyright © 2015 Atef H Ataya. All rights reserved.
//

import Foundation


class Character {
    private var _hp: Int = 100 //data hiding or encapsultation, protect the variables
    private var _attackPwr: Int = 10
    private var _name: String = "Default"
    
  
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
        // we cann't use the set directly on a private variable.
    }
    
    var name: String{
        get{
            return _name
        }
    }
    
    var isAlive: Bool {
        get {
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    
    init (startingHp: Int, attackPwr: Int, playerName: String) {
        self._hp   = startingHp
        self._attackPwr = attackPwr
        self._name = playerName
    }
    
    func attemptAttack (attackPwr: Int) -> Bool {
        self._hp -= attackPwr
        
        return true
    }
}

