//
//  BaseView.swift
//  Purdue CS Courses
//
//  Created by chris on 8/28/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit
import Then
import SnapKit

class BaseView: UIView{
    
    var number: Int?
    
    let numberCircleView = UIView().then{ (view) in
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.backgroundColor = .white
    }

    lazy var circles = [circleView(), circleView(), circleView(), circleView(), circleView()]
    
    let numberLabel = UILabel().then{ (label) in
        label.font = UIFont(name: "Tajawal-Regular", size: 14)
        label.textColor = .black
    }
    
    let titleLabel = UILabel().then{ (label) in
        label.font = UIFont(name: "Tajawal-Regular", size: 20)
        label.textColor = .black
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setUpView()
        setUpLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(code:) has not been initialized")
    }
    
    func setUpLabel(){
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(30)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        addSubview(numberLabel)
        
        numberLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.numberCircleView.snp.centerX)
            make.top.equalTo(self.snp.top).offset(20)
        }
    }
    
    func setUpView(){
        backgroundColor = UIColor(hex: "E4ECF1")
        layer.cornerRadius = 7
        
        addSubview(numberCircleView)
        numberCircleView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(10)
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.left.equalTo(self.snp.left).offset(10)
        }
        
        for i in circles.indices{
            addSubview(circles[i])
        }

        circles[0].snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY).offset(23)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
    }
}

class circleView: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    func setUpView(){
        layer.cornerRadius = 25
        clipsToBounds = true
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(code:) has not been initialized")
    }
}
