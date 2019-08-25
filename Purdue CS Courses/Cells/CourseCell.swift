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
    
    let courseLabel = UILabel().then{ (label) in
        label.textColor        = .black
        label.textAlignment    = .center
        label.font             = UIFont(name: "Tajawal-Regular", size: 20)
        label.numberOfLines    = 0
    }
    
    let descriptionButton = UIButton().then{ (button) in
        button.backgroundColor = UIColor(hex: "c6c6c6")
    }
    
    let backdropView = UIView().then{ (view) in
        view.backgroundColor      = UIColor(hex: "E4ECF1")
        view.clipsToBounds        = true
        view.layer.cornerRadius   = 3
    }
    
    var descriptionButtonAction : (() -> ())?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(backdropView)
        addSubview(courseLabel)

        backdropView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(6)
            make.bottom.equalTo(self.snp.bottom).offset(-6)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
        }
        
        courseLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(25)
            make.bottom.equalTo(self.snp.bottom).offset(-25)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
        }
        
        self.descriptionButton.addTarget(self, action: #selector(descriptionButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func descriptionButtonTapped(){
        descriptionButtonAction?()
    }
}


