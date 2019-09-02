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

class StatisticCell: BaseCollectionViewCell {
    
    let label = UILabel().then{ (label) in
        label.text = GlobalData.surveyDataArr.count > 0 ? "\(GlobalData.surveyDataArr[0].difficultyScore)" : "not available"
        label.font = UIFont(name: "Tajawal-Regular", size: 20)
        label.textColor = .black
    }
    
    let views = [StatisticsView(), StatisticsView(), StatisticsView(), StatisticsView()]
    
    override func setUpViews() {
        super.setUpViews()
        print("WORKS\n\n\n\n\n\n\n\n\n|")
        for i in views.indices{
            addSubview(views[i])
        }
        
        if GlobalData.surveyDataArr.count > 0{
            var avgQualityScore = 0.0
            var avgDifficultyScore = 0.0
            for i in GlobalData.surveyDataArr.indices{
                print(GlobalData.surveyDataArr[i].qualityScore)
                avgQualityScore += GlobalData.surveyDataArr[i].qualityScore
                avgDifficultyScore += GlobalData.surveyDataArr[i].difficultyScore
            }
            avgQualityScore /= Double(GlobalData.surveyDataArr.count)
            avgDifficultyScore /= Double(GlobalData.surveyDataArr.count)
            views[0].statisticsLabel.text = "\(Double(round(10*avgQualityScore)/10))"
            views[1].statisticsLabel.text = "\(Double(round(10*avgDifficultyScore)/10))"
        }else{
            views[0].statisticsLabel.text = ""
            views[1].statisticsLabel.text = ""
        }
    
        views[0].statisticTitleLabel.text = "Overall Quality"
        views[0].snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
            make.height.equalTo(self.frame.size.height / 2.2)
            make.width.equalTo(self.frame.size.width / 2.1)
        }
        
        views[1].statisticTitleLabel.text = "Overall Difficulty"
        views[1].snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.right.equalTo(self.snp.right)
            make.height.equalTo(self.frame.size.height / 2.2)
            make.width.equalTo(self.frame.size.width / 2.1)
        }
        
        views[2].statisticTitleLabel.text = "Useful"
        views[2].snp.makeConstraints { (make) in
            make.top.equalTo(self.views[0].snp.bottom).offset(16)
            make.left.equalTo(self.snp.left)
            make.height.equalTo(self.frame.size.height / 2.2)
            make.width.equalTo(self.frame.size.width / 2.1)
        }
        
        views[3].statisticTitleLabel.text = "Fun"
        views[3].snp.makeConstraints { (make) in
            make.top.equalTo(self.views[0].snp.bottom).offset(16)
            make.right.equalTo(self.snp.right)
            make.height.equalTo(self.frame.size.height / 2.2)
            make.width.equalTo(self.frame.size.width / 2.1)
        }
    }
}

class StatisticsView: UIView{
    
    let statisticTitleLabel = UILabel().then{ (label) in
        label.font = UIFont(name: "Tajawal-Regular", size: 18)
        label.textColor = .black
    }
    
    let statisticsLabel = UILabel().then{ (label) in
        label.font = UIFont(name: "Tajawal-Regular", size: 70)
        label.textColor = .black
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    func setUpView(){
        backgroundColor = UIColor(hex: "E4ECF1")
        layer.cornerRadius = 7
        
        addSubview(statisticTitleLabel)
        
        statisticTitleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(self.snp.bottom).offset(-20)
        }
        
        addSubview(statisticsLabel)
        
        statisticsLabel.snp.makeConstraints { (make) in
            make.center.equalTo(self.snp.center)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(code:) has not been initialized")
    }
}
