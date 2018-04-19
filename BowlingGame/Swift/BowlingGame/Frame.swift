//
//  Frame.swift
//  BowlingGame
//
//  Created by Tony Hoang on 4/16/18.
//  Copyright © 2018 me. All rights reserved.
//

import Foundation

class Frame: CustomStringConvertible, Equatable {
    var rolls = [Roll]()
    var bonuses = [Int]()
    
    init(roll: Roll) {
        rolls.append(roll)
    }

    static func == (lhs: Frame, rhs: Frame) -> Bool {
        return lhs.rolls == rhs.rolls
    }
    
    func updateBonus(from roll:Roll) {
        if (self.isStrike) {
            if (bonuses.count < Game.numOfBonusRollPerStrike) {
                bonuses.append(roll.score)
            }
        } else if (self.isSpare) {
            if (bonuses.count < Game.numOfBonusRollPerSpare) {
                bonuses.append(roll.score)
            }
        }
    }
    
    var description: String {
        var desc = "rolls: ("
        desc += rolls.compactMap({String($0.score)}).joined(separator: ", ")
    
        desc += "), bonuses: ("
        desc += bonuses.compactMap({ String($0)}).joined(separator: ", ")
        desc += "))"

        return desc
    }
    
    var isStrike: Bool {
        return rolls[0].score == Game.maxScorePerFrame
    }
    
    var isSpare: Bool {
        return !isStrike && (score == Game.maxScorePerFrame)
    }
    
    var isFinished: Bool {
        return isStrike || isSpare || rolls.count == Game.maxRollPerFrame
    }
    
    var score: Int {
        return rolls.compactMap({Int($0.score)}).reduce(0, +) + bonuses.reduce(0, +)
    }
}
