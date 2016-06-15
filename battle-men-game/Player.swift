//
//  Player.swift
//  battle-men-game
//
//  Created by Math LLC on 6/15/16.
//  Copyright © 2016 Math LLC. All rights reserved.
//

import Foundation

class Player: Character {
    
    convenience init(name: String, hp: Int, attackPwr: Int) {
        self.init(startingHp: hp, attackPwr: attackPwr, name: name)
        

    }
}