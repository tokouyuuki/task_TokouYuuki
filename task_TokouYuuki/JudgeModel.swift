//
//  JudgeModel.swift
//  task_TokouYuuki
//
//  Created by 都甲裕希 on 2022/03/11.
//

import Foundation
import UIKit

final class JudgeModel{
    
    enum RangeType{
        case standard
        case equal
        case other
    }
    
    private let startTime: Int
    private let endTime: Int
    private let selectedTime: Int
    private var rengeType: RangeType {
        if startTime < endTime{
            return .standard
        }else if startTime == endTime{
            return .equal
        }else{
            return .other
        }
    }
    
    init(statTime: Int, endTime: Int, selectedTime: Int){
        self.startTime = statTime
        self.endTime = endTime
        self.selectedTime = selectedTime
    }
    
    func result() -> Bool{
        switch rengeType {
        case .standard:
            if startTime <= selectedTime && selectedTime < endTime{
                return true
            }else{
                return false
            }
        case .equal:
            if startTime == selectedTime{
                return true
            }else{
                return false
            }
        case .other:
            if startTime <= selectedTime || endTime > selectedTime{
                return true
            }else{
                return false
            }
        }
    }
}
