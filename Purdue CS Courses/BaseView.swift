//
//  BaseView.swift
//  Purdue CS Courses
//
//  Created by chris on 8/28/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit
import Then

class BaseView: UIView{
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(code:) has not been initialized")
    }
    
    func setUpView(){
        backgroundColor = UIColor(hex: "E4ECF1")
        layer.cornerRadius = 7
    }
}
