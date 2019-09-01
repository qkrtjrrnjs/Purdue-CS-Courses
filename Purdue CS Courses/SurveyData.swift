//
//  SurveyData.swift
//  Purdue CS Courses
//
//  Created by chris on 8/31/19.
//  Copyright © 2019 com. All rights reserved.
//

import Foundation

struct SurveyData{
    var advice: String
    var qualityScore: Int
    var difficultyScore: Int
    var isUseful: Bool
    var isFun: Bool
    
    init(advice: String, qualityScore: Int, difficultyScore: Int, isUseful: Bool, isFun: Bool){
        self.advice             = advice
        self.qualityScore       = qualityScore
        self.difficultyScore    = difficultyScore
        self.isUseful           = isUseful
        self.isFun              = isFun
    }
}
