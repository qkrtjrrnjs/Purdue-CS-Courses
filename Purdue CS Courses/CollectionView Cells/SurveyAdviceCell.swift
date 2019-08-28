//
//  SurveyAdviceCell.swift
//  Purdue CS Courses
//
//  Created by chris on 8/28/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit
import Then
import UITextView_Placeholder

class SurveyAdviceCell: BaseCollectionViewCell {
    
    let textView = UITextView().then{ (textView) in
        textView.backgroundColor = UIColor(hex: "E4ECF1")
        textView.font = UIFont(name: "Tajawal-Regular", size: 20)
        textView.layer.cornerRadius = 7
        textView.placeholder = "Enter advice..."
        textView.placeholderColor = .lightGray
    }
    
    override func setUpTextView(){
        addSubview(textView)
        
        textView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(90)
            make.bottom.equalTo(self.snp.bottom).offset(-140)
            make.left.equalTo(self.snp.left).offset(40)
            make.right.equalTo(self.snp.right).offset(-40)
        }
    }

}
