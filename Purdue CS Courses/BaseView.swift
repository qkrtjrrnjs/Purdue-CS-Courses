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
    
    let circles = [circleView(), circleView(), circleView(), circleView(), circleView()]
    let labels = [ratingLabel(), ratingLabel(), ratingLabel(), ratingLabel(), ratingLabel()]
        
    let numberCircleView = UIView().then{ (view) in
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.backgroundColor = .white
    }
    
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
            make.top.equalTo(self.snp.top).offset(15)
            make.centerX.equalTo(self.snp.centerX)
        }

        for i in labels.indices{
            addSubview(labels[i])
            labels[i].text = "\(i + 1)"
            labels[i].snp.makeConstraints { (make) in
                make.center.equalTo(self.circles[i].snp.center)
            }
        }
    }
    
    func setUpView(){
        backgroundColor = UIColor(hex: "E4ECF1")
        layer.cornerRadius = 7
        
        for i in circles.indices{
            addSubview(circles[i])
        }
        
        print(self.frame.width)
        circles[0].snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY).offset(14)
            make.centerX.equalTo(self.snp.centerX).offset(-120)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        circles[1].snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY).offset(14)
            make.centerX.equalTo(self.snp.centerX).offset(-60)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }

        circles[2].snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY).offset(14)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        circles[3].snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY).offset(14)
            make.centerX.equalTo(self.snp.centerX).offset(60)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        circles[4].snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY).offset(14)
            make.centerX.equalTo(self.snp.centerX).offset(120)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        for i in circles.indices{
            circles[i].tag = i
            circles[i].addTarget(self, action: #selector(tapped), for: .touchUpInside)
        }
    }
    
    @objc func tapped(_ sender: UIButton){
        if !isTapped{
            circles[sender.tag].backgroundColor = UIColor(hex: "88AAC2")
            labels[sender.tag].textColor = .white
            
            for i in circles.indices{
                if circles[i].tag != sender.tag{
                    circles[i].backgroundColor = .white
                    labels[i].textColor = .black
                }
            }
        }
    }
}

extension UIView{
    var isTapped: Bool{
        get{
            if self.backgroundColor == UIColor(hex: "88AAC2"){
                return true
            }
            else{
                return false
            }
        }
    }
}

class circleView: UIButton{
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

class ratingLabel :UILabel{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLabel()
    }
    
    func setUpLabel(){
        textColor = .black
        font = UIFont(name: "Tajawal-Regular", size: 16)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(code:) has not been initialized")
    }
}
