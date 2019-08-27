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
    
    let showStatisticsButton = UIButton().then{ (button) in
        button.setImage(UIImage(named: "arrow"), for: .normal)
    }
    
    let backdropView = UIView().then{ (view) in
        view.backgroundColor      = UIColor(hex: "E4ECF1")
        view.clipsToBounds        = true
        view.layer.cornerRadius   = 3
    }
    
    var showStatistics : (() -> ())?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpDropView()
        setUpLabel()
        setUpButton()
    }
    
    func setUpDropView(){
        addSubview(backdropView)

        backdropView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(6)
            make.bottom.equalTo(self.snp.bottom).offset(-6)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
        }
    }
    
    func setUpLabel(){
        backdropView.addSubview(courseLabel)
        
        courseLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(25)
            make.bottom.equalTo(self.snp.bottom).offset(-25)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
        }
    }
    
    func setUpButton(){
        backdropView.addSubview(showStatisticsButton)
        
        showStatisticsButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 30, height: 30))
            make.centerY.equalTo(self.snp.centerY)
            make.right.equalTo(self.snp.right).offset(-10)
        }
        
        self.showStatisticsButton.addTarget(self, action: #selector(descriptionButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func descriptionButtonTapped(){
        showStatistics?()
    }
}


