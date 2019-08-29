//
//  SurveyStatisticCell.swift
//  Purdue CS Courses
//
//  Created by chris on 8/28/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit
import SnapKit

class SurveyStatisticCell: BaseCollectionViewCell {
    let backdropViews = [BaseView(), BaseView(), BaseView(), BaseView()]
    
    override func setUpViews() {
        for i in backdropViews.indices{
            addSubview(backdropViews[i])
        }
        
        backdropViews[0].numberLabel.text = "1"
        backdropViews[0].titleLabel.text = "Overall Quality"
        
        backdropViews[0].snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(90)
            make.height.equalTo(self.frame.height / 6)
            make.left.equalTo(self.snp.left).offset(40)
            make.right.equalTo(self.snp.right).offset(-40)
        }
        
        backdropViews[1].numberLabel.text = "2"
        backdropViews[1].titleLabel.text = "Overall Difficulty"

        backdropViews[1].snp.makeConstraints { (make) in
            make.top.equalTo(self.backdropViews[0].snp.bottom).offset(15)
            make.height.equalTo(self.frame.height / 6)
            make.left.equalTo(self.snp.left).offset(40)
            make.right.equalTo(self.snp.right).offset(-40)
        }
        
        backdropViews[2].numberLabel.text = "3"
        backdropViews[2].titleLabel.text = "Was this course useful?"

        backdropViews[2].snp.makeConstraints { (make) in
            make.top.equalTo(self.backdropViews[1].snp.bottom).offset(15)
            make.height.equalTo(self.frame.height / 6)
            make.left.equalTo(self.snp.left).offset(40)
            make.right.equalTo(self.snp.right).offset(-40)
        }
        
        backdropViews[3].numberLabel.text = "4"
        backdropViews[3].titleLabel.text = "Was this course fun?"

        backdropViews[3].snp.makeConstraints { (make) in
            make.top.equalTo(self.backdropViews[2].snp.bottom).offset(15)
            make.height.equalTo(self.frame.height / 6)
            make.left.equalTo(self.snp.left).offset(40)
            make.right.equalTo(self.snp.right).offset(-40)
        }
    
    }
}
