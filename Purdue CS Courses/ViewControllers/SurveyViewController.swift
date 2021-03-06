//
//  SurveyViewController.swift
//  Purdue CS Courses
//
//  Created by chris on 8/28/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var surveyData = SurveyData(qualityScore: 3, difficultyScore: 3, isUseful: true, isFun: true)
    var adviceData = AdviceData()
    
    let SurveyStatisticCellId     = "SurveyStatisticCellId"
    let SurveyAdviceCellId        = "SurveyAdviceCellId"
    let backButton = UIButton().then{ (button) in
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(backToCourseVC), for: .touchUpInside)
    }
    let locationIndicatorView1 = UIView().then{ (view) in
        view.backgroundColor        = UIColor(hex: "88AAC2")
        view.layer.cornerRadius     = 3
    }
    
    let locationIndicatorView2 = UIView().then{ (view) in
        view.backgroundColor        = UIColor(hex: "E4ECF1")
        view.layer.cornerRadius     = 3
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpButton()
        setUpViews()
        setUpCollectionView()
        hideKeyboardOnScreenTap()
    }
    
    func setUpButton(){
        self.view.addSubview(backButton)
        
        backButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 33, height: 33))
            make.top.equalTo(self.view.snp.topMargin).offset(40)
            make.left.equalTo(self.view.snp.left).offset(17)
        }
    }
    
    func setUpViews(){
        self.view.addSubview(locationIndicatorView1)
        
        locationIndicatorView1.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.backButton.snp.centerY)
            make.centerX.equalTo(self.view.snp.centerX).offset(-30)
            make.width.equalTo(50)
            make.height.equalTo(5)
        }
        
        self.view.addSubview(locationIndicatorView2)
        
        locationIndicatorView2.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.backButton.snp.centerY)
            make.centerX.equalTo(self.view.snp.centerX).offset(30)
            make.width.equalTo(50)
            make.height.equalTo(5)
        }
    }
    
    func setUpCollectionView(){
        let layout                  = UICollectionViewFlowLayout()
        layout.scrollDirection      = .horizontal
        layout.minimumLineSpacing   = 0
        
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.collectionView.showsHorizontalScrollIndicator  = false
        self.collectionView.backgroundColor                 = .white
        self.collectionView.isPagingEnabled                 = true
        self.collectionView.dataSource                      = self
        self.collectionView.delegate                        = self
        
        self.view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(90)
            make.bottom.equalTo(self.view.snp.bottom)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
        }
        
        collectionView.register(SurveyStatisticCell.self, forCellWithReuseIdentifier: SurveyStatisticCellId)
        collectionView.register(SurveyAdviceCell.self, forCellWithReuseIdentifier: SurveyAdviceCellId)
        
    }

    @objc func backToCourseVC(){
        self.hero.modalAnimationType = .push(direction: .right)
        self.hero.dismissViewController()
    }

}

extension SurveyViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let statisticsCell = collectionView.dequeueReusableCell(withReuseIdentifier: SurveyStatisticCellId, for: indexPath) as! SurveyStatisticCell
        let adviceCell = collectionView.dequeueReusableCell(withReuseIdentifier: SurveyAdviceCellId, for: indexPath) as! SurveyAdviceCell
        
        switch indexPath.item{
        case 0:
            statisticsCell.backdropViews[0].getSurveyData = {
                for i in statisticsCell.backdropViews[0].labels.indices{
                    if statisticsCell.backdropViews[0].labels[i].textColor == .white{
                        self.surveyData.qualityScore = Double(statisticsCell.backdropViews[0].labels[i].text!)!
                    }
                }
            }
            
            statisticsCell.backdropViews[1].getSurveyData = {
                for i in statisticsCell.backdropViews[1].labels.indices{
                    if statisticsCell.backdropViews[1].labels[i].textColor == .white{
                        self.surveyData.difficultyScore = Double(statisticsCell.backdropViews[0].labels[i].text!)!
                    }
                }
            }
            
            statisticsCell.backdropViews[2].getSurveyData = {
                if statisticsCell.backdropViews[2].labels[1].textColor == .white{
                    self.surveyData.isUseful = true
                }else{
                    self.surveyData.isUseful = false
                }
            }
            
            statisticsCell.backdropViews[3].getSurveyData = {
                if statisticsCell.backdropViews[3].labels[1].textColor == .white{
                    self.surveyData.isFun = true
                }else{
                    self.surveyData.isFun = false
                }
            }
            
            return statisticsCell
        case 1:
            adviceCell.getSurveyData = {
                //guard let course = GlobalData.course  else { return }
                self.adviceData.advice  = adviceCell.textView.text!
                self.adviceData.date    = Date()
                if adviceCell.textView.text! != ""{
                    CourseManager.shared.courses[CourseManager.shared.getCurrentIndex()].courseAdviceData.append(self.adviceData)
                    //GlobalData.courseAdviceData.appendAdviceData(self.adviceData, key: "\(course.number)")
                }
                CourseManager.shared.courses[CourseManager.shared.getCurrentIndex()].courseSurveyData.append(self.surveyData)
                //GlobalData.courseSurveyData.appendSurveyData(self.surveyData, key: "\(course.number)")
                
                let detailVC                        = DetailViewController()
                detailVC.view.backgroundColor       = .white
                detailVC.hero.isEnabled             = true
                detailVC.hero.modalAnimationType    = .push(direction: .right)
                self.present(detailVC, animated: true, completion: nil)
            }
            return adviceCell
        default:
            return UICollectionViewCell()
        }
        
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / view.frame.width
        let indexPath = IndexPath(item: Int(index), section: 0)
        if indexPath.item == 0{
            locationIndicatorView1.backgroundColor = UIColor(hex: "88AAC2")
            locationIndicatorView2.backgroundColor = UIColor(hex: "E4ECF1")
        }else{
            locationIndicatorView1.backgroundColor = UIColor(hex: "E4ECF1")
            locationIndicatorView2.backgroundColor = UIColor(hex: "88AAC2")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}

//closes keyboard on tap
extension UIViewController {
    func hideKeyboardOnScreenTap() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension Dictionary where Key == String, Value == Array<SurveyData>{
    
    mutating func appendSurveyData(_ data:SurveyData, key:String) {
        
        if var value = self[key] {
            // if an array exist, append to it
            value.append(data)
            self[key] = value
        } else {
            // create a new array since there is nothing here
            self[key] = [data]
        }
    }
    
}

extension Dictionary where Key == String, Value == Array<AdviceData>{
    
    mutating func appendAdviceData(_ data:AdviceData, key:String) {
        
        if var value = self[key] {
            // if an array exist, append to it
            value.append(data)
            self[key] = value
        } else {
            // create a new array since there is nothing here
            self[key] = [data]
        }
    }
    
}
