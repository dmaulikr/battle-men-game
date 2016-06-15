//
//  Character.swift
//  battle-men-game
//
//  Created by Math LLC on 6/15/16.
//  Copyright © 2016 Math LLC. All rights reserved.
//

import Foundation

class Character {
    
    private var _hp: Int = 200
    private var _attackPwr: Int = 10
    private var _name: String
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var name: String {
        get {
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
    
    init(startingHp: Int, attackPwr: Int, name: String) {
        self._hp = startingHp
        self._attackPwr = attackPwr
        self._name = name
        
    }
    
    func attemptAttack(attackPwr: Int) -> Bool {
        self._hp -= attackPwr
        
        return true
    }
    
}
