//
//  TimerData.swift
//  LifeCycleDemo
//
//  Created by Tzuzul Rosas on 01/02/22.
//

import Foundation
import Combine

class TimerData : ObservableObject{
    @Published var timerCount = 0
    
    var timer : Timer?
    
    init(){
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerDidChange), userInfo: nil, repeats: true)
    }
    
    @objc func timerDidChange(){
        timerCount+=1
    }
    
    func resetCount(){
        timerCount = 0
    }
    
}
