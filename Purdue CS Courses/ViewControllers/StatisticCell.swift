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

class StatisticCell: UICollectionViewCell {
    
    let label = UILabel().then{ (label) in
        label.text = "test"
        label.font = UIFont(name: "Tajawal-Regular", size: 20)
        label.textColor = .black
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpLabel()
    }
    
    func setUpLabel(){
        addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.center.equalTo(self.snp.center)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
