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
        $0.textAlignment    = .center
        $0.font             = UIFont(name: "Tajawal-Regular", size: 20)
        $0.numberOfLines    = 0
    }
    
    let descriptionLabel = UILabel().then{
        $0.textColor        = .black
        $0.textAlignment    = .left
        $0.font             = UIFont(name: "Tajawal-Medium", size: 18)
        $0.numberOfLines    = 0
    }
    
    let backdropView = UIView().then{
        $0.backgroundColor      = UIColor(hex: "E4ECF1")
        $0.layer.cornerRadius   = 3
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(backdropView)
        addSubview(courseLabel)
        addSubview(descriptionLabel)
        
        courseLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(25)
            make.bottom.equalTo(self.snp.bottom).offset(-25)
            make.left.equalTo(self.snp.left).offset(5)
            make.right.equalTo(self.snp.right)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(20)
            make.bottom.equalTo(self.snp.bottom).offset(-20)
            make.left.equalTo(self.snp.left).offset(15)
            make.right.equalTo(self.snp.right).offset(-15)
        }
        
        backdropView.snp.makeConstraints { (make) in
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


