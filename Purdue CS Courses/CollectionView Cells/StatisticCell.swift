//
//  StatisticsCell.swift
//  Purdue CS Courses
//
//  Created by chris on 8/27/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit
import SnapKit
import Then

class StatisticCell: BaseCollectionViewCell {
    
    let label = UILabel().then{ (label) in
        label.text = GlobalData.surveyDataArr.count > 0 ? "\(GlobalData.surveyDataArr[0].difficultyScore)" : "not available"
        label.font = UIFont(name: "Tajawal-Regular", size: 20)
        label.textColor = .black
    }
    
    override func setUpLabel(){
        super.setUpLabel()
        addSubview(label)

        label.snp.makeConstraints { (make) in
            make.center.equalTo(self.snp.center)
        }
    }
}
