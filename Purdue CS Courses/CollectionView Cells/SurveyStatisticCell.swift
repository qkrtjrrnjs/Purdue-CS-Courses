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
    let backdropView1 = BaseView()
    let backdropView2 = BaseView()
    let backdropView3 = BaseView()
    let backdropView4 = BaseView()
    
    override func setUpViews() {
        addSubview(backdropView1)
        addSubview(backdropView2)
        addSubview(backdropView3)
        addSubview(backdropView4)
        
        backdropView1.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(90)
            make.height.equalTo(115)
            make.left.equalTo(self.snp.left).offset(40)
            make.right.equalTo(self.snp.right).offset(-40)
        }
        
        backdropView2.snp.makeConstraints { (make) in
            make.top.equalTo(self.backdropView1.snp.bottom).offset(15)
            make.height.equalTo(115)
            make.left.equalTo(self.snp.left).offset(40)
            make.right.equalTo(self.snp.right).offset(-40)
        }
        
        backdropView3.snp.makeConstraints { (make) in
            make.top.equalTo(self.backdropView2.snp.bottom).offset(15)
            make.height.equalTo(115)
            make.left.equalTo(self.snp.left).offset(40)
            make.right.equalTo(self.snp.right).offset(-40)
        }
        
        backdropView4.snp.makeConstraints { (make) in
            make.top.equalTo(self.backdropView3.snp.bottom).offset(15)
            make.height.equalTo(115)
            make.left.equalTo(self.snp.left).offset(40)
            make.right.equalTo(self.snp.right).offset(-40)
        }
    }
}
