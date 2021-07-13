//
//  StopWatchManager.swift
//  SudokuElves
//
//  Created by Cubik65536 on 2021-07-13.
//

import Foundation

enum stopWatchMode {
    case running
    case stopped
    case paused
}

class StopWatchManager: ObservableObject {
    
    @Published var mode: stopWatchMode = .stopped
    var hour = 0
    var minute = 0
    var second = 0
    @Published var time = "00:00:00"
    
    var timer = Timer()
    
    func start() {
        print("stopWatchManager Start")
        UserDefaults.standard.set(false, forKey: "paused")
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.second += 1
            if self.second == 60 {
                self.minute += 1
                self.second = 0
            }
            if self.minute == 60 {
                self.hour += 1
                self.minute = 0
            }
            self.time = "\(String(format: "%02d", self.hour)):\(String(format: "%02d", self.minute)):\(String(format: "%02d", self.second))"
        }
    }
    
    func pause() {
        print("stopWatchManager Pause")
        timer.invalidate()
        mode = .paused
    }
    
    func stop() {
        print("stopWatchManager Stop")
        timer.invalidate()
        hour = 0
        minute = 0
        second = 0
        time = "00:00:00"
        mode = .stopped
    }
}
