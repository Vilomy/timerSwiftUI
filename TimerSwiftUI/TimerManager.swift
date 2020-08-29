//
//  TimerManager.swift
//  TimerSwiftUI
//
//  Created by Gleb Zadonskiy on 29.08.2020.
//

import Foundation
import SwiftUI

class TimerManager: ObservableObject {
    @Published var timerMode: TimerMode = .initial
    
    @Published var secondLeft = UserDefaults.standard.integer(forKey: "timerLength")
    
    var timer = Timer()
    
    func setTimerLength(minutes: Int) {
        let defaults = UserDefaults.standard
        defaults.set(minutes, forKey: "timerLength")
        secondLeft = minutes
    }
    
    
    func start() {
        timerMode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            if self.secondLeft == 0 {
                self.reset()
                timer.invalidate()
            }
            self.secondLeft -= 1
        })
        
    }
    func reset() {
        self.timerMode = .initial
        self.secondLeft = UserDefaults.standard.integer(forKey: "timerLength")
        timer.invalidate()
    }
    func pause() {
        self.timerMode = .paused
        timer.invalidate()
    }
}
