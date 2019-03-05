//
//  SoundManager.swift
//  AwesomeLand
//
//  Created by Wouter Willebrands on 11/02/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit
import Foundation
import AudioToolbox

// SoundManager class retrieves sound from files
// Sound are loaded within methods
// Soudn are activated when passes are swiped
class SoundManager {
    
    static var gameSound: SystemSoundID = 0
    
    private static func loadAccessGrantedSound() {
        let path = Bundle.main.path(forResource: "AccessGranted", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &gameSound)
    }
    
    static func playAccessGrantedSound() {
        loadAccessGrantedSound()
        AudioServicesPlaySystemSound(gameSound)
    }
    
    private static func loadAccessDeniedSound() {
        let path = Bundle.main.path(forResource: "AccessDenied", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &gameSound)
    }
    
    static func PlayAccessDeniedSound() {
        loadAccessDeniedSound()
        AudioServicesPlaySystemSound(gameSound)
    }
    
}

