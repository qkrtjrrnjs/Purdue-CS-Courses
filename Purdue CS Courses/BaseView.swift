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
    
    let circleView = UIView().then{ (view) in
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.backgroundColor = .white
    }
    
    let numberLabel = UILabel().then{ (label) in
        label.font = UIFont(name: "Tajawal-Regular", size: 14)
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
        addSubview(numberLabel)
        
        numberLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.circleView.snp.centerX)
            make.top.equalTo(self.snp.top).offset(20)
        }
    }
    
    func setUpView(){
        backgroundColor = UIColor(hex: "E4ECF1")
        layer.cornerRadius = 7
        
        addSubview(circleView)
        circleView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(10)
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.left.equalTo(self.snp.left).offset(10)
        }
    }
}


