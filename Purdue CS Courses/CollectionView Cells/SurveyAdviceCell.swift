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
        textView.backgroundColor        = UIColor(hex: "E4ECF1")
        textView.font                   = UIFont(name: "Tajawal-Regular", size: 20)
        textView.layer.cornerRadius     = 7
        textView.placeholder            = "Enter advice..."
        textView.placeholderColor       = .lightGray
        textView.textContainerInset     = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    let submitButton = UIButton().then{ (button) in
        button.backgroundColor = UIColor(hex: "88AAC2")
        button.setTitle("SUBMIT", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 7
    }
  
    var getSurveyData : (() -> ())?

    override func setUpTextView(){
        textView.delegate = self
        
        addSubview(textView)
        
        textView.snp.makeConstraints { (make) in
            make.height.equalTo(self.frame.height / 1.6)
            make.top.equalTo(self.snp.top).offset(90)
            make.left.equalTo(self.snp.left).offset(40)
            make.right.equalTo(self.snp.right).offset(-40)
        }
        
        addSubview(submitButton)
        
        submitButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.textView.snp.bottom).offset(15)
            make.left.equalTo(self.snp.left).offset(40)
            make.right.equalTo(self.snp.right).offset(-40)
            make.bottom.equalTo(self.snp.bottom).offset(-90)
        }
        
        submitButton.addTarget(self, action: #selector(submit), for: .touchUpInside)
    }
    
    @objc func submit(){
        
        getSurveyData?()
    }
    
    //dismiss keyboard upon return
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}

extension SurveyAdviceCell: UITextViewDelegate{
    
}
