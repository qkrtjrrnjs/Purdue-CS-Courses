//
//  CourseCell.swift
//  Purdue CS Courses
//
//  Created by chris on 8/21/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit
import Then
import SnapKit

class CourseCell: UITableViewCell {
    
    let courseLabel = UILabel().then{
        $0.textColor        = .black
        $0.textAlignment    = .left
        $0.font             = UIFont.systemFont(ofSize: 16)
        $0.numberOfLines    = 0
    }
    
    let descriptionLabel = UILabel().then{
        $0.textColor        = .black
        $0.textAlignment    = .left
        $0.font             = UIFont.systemFont(ofSize: 16)
        $0.numberOfLines    = 0
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(courseLabel)
        addSubview(descriptionLabel)
        
        courseLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(10)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(5)
            make.bottom.equalTo(self.snp.bottom).offset(-5)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


}
