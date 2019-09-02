//
//  SurveyData.swift
//  Purdue CS Courses
//
//  Created by chris on 8/31/19.
//  Copyright © 2019 com. All rights reserved.
//

import Foundation

struct SurveyData{
    var qualityScore: Double
    var difficultyScore: Double
    var isUseful: Bool
    var isFun: Bool
    
    init(qualityScore: Double, difficultyScore: Double, isUseful: Bool, isFun: Bool){
        self.qualityScore       = qualityScore
        self.difficultyScore    = difficultyScore
        self.isUseful           = isUseful
        self.isFun              = isFun
    }
}
