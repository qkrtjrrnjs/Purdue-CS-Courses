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
import Charts

class StatisticCell: BaseCollectionViewCell {

    let views = [StatisticsView(), StatisticsView(), StatisticsView(), StatisticsView()]
    let usefulPieChart = PieChartView()
    let funPieChart = PieChartView()
    
    var usefulYesNoCount = [0, 0]
    var funYesNoCount = [0, 0]
    
    var surveyDataArr = CourseManager.shared.courses[CourseManager.shared.currentCourseIndex!].courseSurveyData

    override func setUpViews() {
        super.setUpViews()
        
        for i in views.indices{
            addSubview(views[i])
        }
        
//        if let data = GlobalData.courseSurveyData["\(GlobalData.course!.number)"], data.count > 0{
        if  surveyDataArr.count > 0{
            displayScores()
            getPieChartData()
            updateUsefulChart()
            updateFunChart()
            setUpPieCharts()
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
        
        views[2].addSubview(usefulPieChart)
        usefulPieChart.snp.makeConstraints { (make) in
            make.top.equalTo(self.views[2].snp.top)
            make.left.equalTo(self.views[2].snp.left)
            make.right.equalTo(self.views[2].snp.right)
            make.bottom.equalTo(self.views[2].snp.bottom).offset(-25)
        }
        
        views[3].statisticTitleLabel.text = "Fun"
        views[3].snp.makeConstraints { (make) in
            make.top.equalTo(self.views[0].snp.bottom).offset(16)
            make.right.equalTo(self.snp.right)
            make.height.equalTo(self.frame.size.height / 2.2)
            make.width.equalTo(self.frame.size.width / 2.1)
        }
        
        views[3].addSubview(funPieChart)
        funPieChart.snp.makeConstraints { (make) in
            make.top.equalTo(self.views[3].snp.top)
            make.left.equalTo(self.views[3].snp.left)
            make.right.equalTo(self.views[3].snp.right)
            make.bottom.equalTo(self.views[3].snp.bottom).offset(-25)
        }
    }
    
    func displayScores(){
        var avgQualityScore = 0.0
        var avgDifficultyScore = 0.0
//        for i in GlobalData.courseSurveyData["\(GlobalData.course!.number)"]!.indices{
//            avgQualityScore += GlobalData.courseSurveyData["\(GlobalData.course!.number)"]![i].qualityScore
//            avgDifficultyScore += GlobalData.courseSurveyData["\(GlobalData.course!.number)"]![i].difficultyScore
//        }
//        avgQualityScore /= Double(GlobalData.courseSurveyData["\(GlobalData.course!.number)"]!.count)
//        avgDifficultyScore /= Double(GlobalData.courseSurveyData["\(GlobalData.course!.number)"]!.count)
        
        views[0].statisticsLabel.text = "\(Double(round(10*avgQualityScore)/10))"
        views[1].statisticsLabel.text = "\(Double(round(10*avgDifficultyScore)/10))"
    }
    
    func getPieChartData(){
//        for i in GlobalData.courseSurveyData["\(GlobalData.course!.number)"]!.indices{
//            if GlobalData.courseSurveyData["\(GlobalData.course!.number)"]![i].isUseful{
//                usefulYesNoCount[0] += 1
//            }else{
//                usefulYesNoCount[1] += 1
//            }
//
//            if GlobalData.courseSurveyData["\(GlobalData.course!.number)"]![i].isFun{
//                funYesNoCount[0] += 1
//            }else{
//                funYesNoCount[1] += 1
//            }
//        }
    }
    
    func updateUsefulChart(){
        let labels = ["Yes", "No"]
        let values = usefulYesNoCount.map{ Double($0)}
        
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<labels.count {
            let dataEntry = PieChartDataEntry(value: values[i], label: labels[i], data: labels[i] as AnyObject)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = PieChartDataSet(entries: dataEntries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors                      = [UIColor(hex: "63acd8"), UIColor(hex: "ff715b")]
        chartDataSet.colors             = colors
        
        chartDataSet.entryLabelFont     = UIFont(name: "Tajawal-Regular", size: 13)
        chartDataSet.valueFont          = UIFont(name: "Tajawal-Regular", size: 13)!
        
        let formatter                   = NumberFormatter()
        formatter.minimumFractionDigits = 0
        
        chartData.setValueFormatter(DefaultValueFormatter(formatter:formatter))
        
        usefulPieChart.data             = chartData
    }
    
    func updateFunChart(){
        let labels = ["Yes", "No"]
        let values = funYesNoCount.map{ Double($0)}
        
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<labels.count {
            let dataEntry = PieChartDataEntry(value: values[i], label: labels[i], data: labels[i] as AnyObject)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = PieChartDataSet(entries: dataEntries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
    
        let colors                      = [UIColor(hex: "63acd8"), UIColor(hex: "ff715b")]
        chartDataSet.colors             = colors
        
        chartDataSet.entryLabelFont     = UIFont(name: "Tajawal-Regular", size: 13)
        chartDataSet.valueFont          = UIFont(name: "Tajawal-Regular", size: 13)!
        
        let formatter                   = NumberFormatter()
        formatter.minimumFractionDigits = 0
        
        chartData.setValueFormatter(DefaultValueFormatter(formatter:formatter))
        
        funPieChart.data                = chartData
    }
    
    func setUpPieCharts(){
        funPieChart.legend.enabled              = false
        funPieChart.holeRadiusPercent           = 0.2
        funPieChart.transparentCircleColor      = .clear
        
        usefulPieChart.legend.enabled           = false
        usefulPieChart.holeRadiusPercent        = 0.2
        usefulPieChart.transparentCircleColor   = .clear
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
