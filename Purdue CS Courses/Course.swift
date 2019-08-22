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
    var opened: Bool
    
    init(CS number: Int, description: String, opened: Bool){
        self.number         = number
        self.description    = description
        self.opened         = opened
    }
}


