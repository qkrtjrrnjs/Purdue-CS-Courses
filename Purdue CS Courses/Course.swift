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
    var name: String
    var description: String
    var opened: Bool
    
    init(CS number: Int, _ name: String, description: String, opened: Bool){
        self.number         = number
        self.name           = name
        self.description    = description
        self.opened         = opened
    }
}


