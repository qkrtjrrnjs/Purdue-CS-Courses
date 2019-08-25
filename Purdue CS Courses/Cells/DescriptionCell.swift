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

class DescriptionCell: UITableViewCell {
    
    let descriptionLabel = UILabel().then{ (label) in
        label.textColor        = .black
        label.textAlignment    = .center
        label.font             = UIFont(name: "Tajawal-Medium", size: 18)
        label.numberOfLines    = 0
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(descriptionLabel)
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
