//
//  Game.swift
//  BowlingGame
//
//  Created by Tony Hoang on 4/16/18.
//  Copyright © 2018 me. All rights reserved.
//

import Foundation

class Game : NSObject {
    public static let maxScorePerFrame = 10
    public static let maxRollPerFrame = 2
    static let numOfFramePerGame = 10
    
    // Bonus rules
    static let numOfBonusRollPerStrike = 2
    static let numOfBonusRollPerSpare = 1

    var frames = [Frame]()
    
    func roll(with score: Int) {
        let roll = Roll(score: score)
//        let isBonus = frames.count == Game.numOfFramePerGame && frames.last!.isFinished
        
        // Update bonus points for previous frames
        var bonusRollCounter = max(Game.numOfBonusRollPerSpare, Game.numOfBonusRollPerStrike)
        var frameIdx = frames.endIndex-1
        
        while bonusRollCounter > 0 && frameIdx >= 0 {
            let prevFrame = frames[frameIdx]
            prevFrame.updateBonus(from: roll)
            
            bonusRollCounter -= prevFrame.rolls.count
            frameIdx -= 1
        }
        
        // Create new frame if there is no frame or last frame has finished
        // Don't create new frame if this is a bonus roll
        let lastFrame = frames.last
        if lastFrame != nil && !lastFrame!.isFinished {
            lastFrame?.rolls.append(roll)
        } else if (frames.count < Game.numOfFramePerGame) {
            let frame = Frame(roll: roll)
            frames.append(frame)
        }
    }
    
    var score : Int {
        get {
            return frames.compactMap({$0.score}).reduce(0, +)
        }
    }
}
