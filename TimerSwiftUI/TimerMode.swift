//
//  Helper.swift
//  TimerSwiftUI
//
//  Created by Gleb Zadonskiy on 29.08.2020.
//

import Foundation

enum TimerMode {
    case running
    case paused
    case initial
}


func secondToMinutesAndSeconds(seconds: Int) -> String {
    let minutes = "\((seconds % 3600) / 60)"
    let seconds = "\((seconds % 3600) % 60)"
    let minuteStamp = minutes.count > 1 ? minutes : "0" + minutes
    let secondStamp = seconds.count > 1 ? seconds : "0" + seconds
    
    return "\(minuteStamp) : \(secondStamp)"
}
