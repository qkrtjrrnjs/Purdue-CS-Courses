//
//  StatisticsViewController.swift
//  Purdue CS Courses
//
//  Created by chris on 8/22/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    var number: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let number = number else { return }
        print("\(number)")
    }


}
