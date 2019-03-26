//
//  RepeatTimer.swift
//  AwesomeLand
//
//  Created by Wouter Willebrands on 11/02/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

// This still needs to be implemtented when pass is swiped
// to prevent second swipe within set time
import Foundation

class TimerForGates {
    
    static var seconds = 0
    var isTimerRunning = false
    
    static let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
        print("Timer is running")
        seconds += 1
        
        if seconds >= 5 {
            timer.invalidate()
            seconds = 0
        }
    }
}
