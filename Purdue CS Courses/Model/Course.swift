//
//  Course.swift
//  Purdue CS Courses
//
//  Created by chris on 8/20/19.
//  Copyright © 2019 com. All rights reserved.
//

import Foundation

struct Course{
    var number: Int
    var description: String
    var isExpanded: Bool
    var courseSurveyData = [SurveyData]()
    var courseAdviceData = [AdviceData]()
    
    init(CS number: Int, description: String, isExpanded: Bool, courseSurveyData: [SurveyData], courseAdviceData: [AdviceData]){
        self.number         = number
        self.description    = description
        self.isExpanded     = isExpanded
        self.courseSurveyData = courseSurveyData
        self.courseAdviceData = courseAdviceData
    }
}


