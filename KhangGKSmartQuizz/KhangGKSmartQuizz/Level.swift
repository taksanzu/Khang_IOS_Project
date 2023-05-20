//
//  Level.swift
//  KhangGKSmartQuizz
//
//  Created by BVU on 5/20/23.
//

import Foundation

enum LevelType: String {
    case SLOW, NORMAL, FAST
    
    var text: String {
        switch self {
        case .SLOW:
            return "Slow"
        case .NORMAL:
            return "Normal"
        case .FAST:
            return "Fast"
        }
    }
}

struct Level {
    var name: LevelType
    var totalQuestions: String
    var totalTime: String
    var timePerQuestion: Int
}
