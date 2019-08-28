//
//  DescriptionCell.swift
//  Purdue CS Courses
//
//  Created by chris on 8/25/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit
import Then
import SnapKit

class DescriptionCell: BaseTableViewCell {
    
    let descriptionLabel = UILabel().then{ (label) in
        label.textColor        = .black
        label.textAlignment    = .center
        label.font             = UIFont(name: "Tajawal-Medium", size: 18)
        label.numberOfLines    = 0
    }
    
    override func setUpLabel(){
        super.setUpLabel()
        addSubview(descriptionLabel)
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(5)
            make.bottom.equalTo(self.snp.bottom).offset(-5)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
        }
    }
}
