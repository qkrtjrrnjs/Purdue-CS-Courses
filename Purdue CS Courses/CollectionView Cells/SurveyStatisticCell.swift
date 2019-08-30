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
    
    override func setUpLabel() {
        backdropViews[0].titleLabel.text = "Overall Quality"
        
        backdropViews[1].titleLabel.text = "Overall Difficulty"
        
        backdropViews[2].titleLabel.text = "Was this course useful?"
        
        backdropViews[3].titleLabel.text = "Was this course fun?"
    }
    
    override func setUpViews() {
        for i in backdropViews.indices{
            addSubview(backdropViews[i])
        }
        
        backdropViews[0].snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(90)
            make.height.equalTo(self.frame.height / 6)
            make.left.equalTo(self.snp.left).offset(30)
            make.right.equalTo(self.snp.right).offset(-30)
        }
        
        backdropViews[1].snp.makeConstraints { (make) in
            make.top.equalTo(self.backdropViews[0].snp.bottom).offset(15)
            make.height.equalTo(self.frame.height / 6)
            make.left.equalTo(self.snp.left).offset(30)
            make.right.equalTo(self.snp.right).offset(-30)
        }

        backdropViews[2].snp.makeConstraints { (make) in
            make.top.equalTo(self.backdropViews[1].snp.bottom).offset(15)
            make.height.equalTo(self.frame.height / 6)
            make.left.equalTo(self.snp.left).offset(30)
            make.right.equalTo(self.snp.right).offset(-30)
        }

        backdropViews[3].snp.makeConstraints { (make) in
            make.top.equalTo(self.backdropViews[2].snp.bottom).offset(15)
            make.height.equalTo(self.frame.height / 6)
            make.left.equalTo(self.snp.left).offset(30)
            make.right.equalTo(self.snp.right).offset(-30)
        }
        
        for i in stride(from: 0, through: 5, by: 2){
            backdropViews[2].circles[i].removeFromSuperview()
            backdropViews[3].circles[i].removeFromSuperview()
            backdropViews[2].labels[i].removeFromSuperview()
            backdropViews[3].labels[i].removeFromSuperview()
        }
        
        backdropViews[2].labels[1].text = "YES"
        backdropViews[2].labels[3].text = "NO"
        backdropViews[3].labels[1].text = "YES"
        backdropViews[3].labels[3].text = "NO"
    }
}
