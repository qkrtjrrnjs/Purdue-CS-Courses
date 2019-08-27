//
//  StatisticsViewController.swift
//  Purdue CS Courses
//
//  Created by chris on 8/22/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit
import Then
import SnapKit

class StatisticsViewController: UIViewController {
    
    var course: Course?
    
    let backButton = UIButton().then{ (button) in
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(backToCourseVC), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpButton()
    }
    
    func setUpButton(){
        self.view.addSubview(backButton)
        
        backButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 30, height: 30))
            make.top.equalTo(self.view.snp.topMargin).offset(50)
            make.left.equalTo(self.view.snp.left).offset(17)
        }
    }
    
    @objc func backToCourseVC(){
        self.hero.modalAnimationType = .push(direction: .right)
        self.hero.dismissViewController()
    }
}
