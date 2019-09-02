//
//  AdviceData.swift
//  Purdue CS Courses
//
//  Created by chris on 9/1/19.
//  Copyright © 2019 com. All rights reserved.
//

import Foundation

struct AdviceData{
    var advice: String
    var likeDislikeCount: Int
    
    init(advice: String = "", likeDislikeCount: Int = 0){
        self.advice = advice
        self.likeDislikeCount = likeDislikeCount
    }
}
