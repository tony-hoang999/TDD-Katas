//
//  Roll.swift
//  BowlingGame
//
//  Created by Tony Hoang on 4/16/18.
//  Copyright © 2018 me. All rights reserved.
//

import Foundation

class Roll: NSObject {
    var score: Int
    
    init(score: Int) {
        self.score = score
        
        super.init()
    }
}
