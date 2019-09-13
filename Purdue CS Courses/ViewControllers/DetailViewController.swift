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
import Charts

struct GlobalData{
    static var course: Course?
    static var courseSurveyData = [String: [SurveyData]]()
    static var courseAdviceData = [String: [AdviceData]]()
}

class DetailViewController: UIViewController {
    
    var collectionView: UICollectionView!

    let backButton = UIButton().then{ (button) in
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(backToCourseVC), for: .touchUpInside)
    }
    let titleLabel = UILabel().then{ (label) in
        label.text = "Statistics"
        label.textColor = .black
        label.font = UIFont(name: "Tajawal-Regular", size: 30)
    }
    let addButton = UIButton().then{ (button) in
        button.setImage(UIImage(named: "add"), for: .normal)
        button.addTarget(self, action: #selector(addStatistic), for: .touchUpInside)
    }
    let lineView = UIView().then{ (view) in
        view.backgroundColor = .black
    }
    let menuBar = MenuBar()
    let statisticCellId = "statisticCellId"
    let adviceCellId = "adviceCellId"
    let liveChatCellId = "liveChatCellId"
    let titles = ["Statistics", "Advices", "Live Chat"]
    let pieChartView = PieChartView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpButton()
        setUpLabel()
        setUpMenuBar()
        setUpView()
        setUpCollectionView()
    }
    
    func scrollToMenuIndex(index: Int){
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.scrollToItem(at: indexPath, at: [], animated: true)
        titleLabel.text = titles[index]
    }
    
    @objc func backToCourseVC(){
        let courseVC                        = CourseViewController()
        courseVC.hero.isEnabled             = true
        courseVC.hero.modalAnimationType    = .push(direction: .right)
        courseVC.view.backgroundColor       = .white
        self.present(courseVC, animated: true, completion: nil)
    }
    
    @objc func addStatistic(){
        let surveyVC                        = SurveyViewController()
        surveyVC.hero.isEnabled             = true
        surveyVC.hero.modalAnimationType    = .push(direction: .left)
        surveyVC.view.backgroundColor       = .white
        self.present(surveyVC, animated: true, completion: nil)
    }
    
    func setUpButton(){
        self.view.addSubview(backButton)
        self.view.addSubview(addButton)
        
        backButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 33, height: 33))
            make.top.equalTo(self.view.snp.topMargin).offset(40)
            make.left.equalTo(self.view.snp.left).offset(20)
        }
        
        addButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 33, height: 33))
            make.top.equalTo(self.view.snp.topMargin).offset(40)
            make.right.equalTo(self.view.snp.right).offset(-20)
        }
    }
    
    func setUpLabel(){
        self.view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left).offset(20)
            make.top.equalTo(self.backButton.snp.bottom).offset(28)
        }
    }
    
    func setUpMenuBar(){
        menuBar.detailViewController = self
        
        self.view.addSubview(menuBar)
        
        menuBar.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.topMargin).offset(150)
            make.height.equalTo(35)
            make.left.equalTo(self.view.snp.left).offset(10)
            make.right.equalTo(self.view.snp.right).offset(-10)
        }
    }
    
    func setUpView(){
        self.view.addSubview(lineView)
        
        lineView.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.left.equalTo(self.view.snp.left).offset(18)
            make.right.equalTo(self.view.snp.right).offset(-18)
            make.top.equalTo(self.menuBar.snp.bottom).offset(5)
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
            make.top.equalTo(self.lineView.snp.bottom).offset(15)
            make.bottom.equalTo(self.view.snp.bottom)
            make.left.equalTo(self.view.snp.left).offset(18)
            make.right.equalTo(self.view.snp.right).offset(-18)
        }
        
        collectionView.register(StatisticCell.self, forCellWithReuseIdentifier: statisticCellId)
        collectionView.register(AdviceCell.self, forCellWithReuseIdentifier: adviceCellId)
        collectionView.register(LiveChatCell.self, forCellWithReuseIdentifier: liveChatCellId)
    }

}

extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.item{
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: statisticCellId, for: indexPath)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: adviceCellId, for: indexPath)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: liveChatCellId, for: indexPath)
            return cell
        default:
            return UICollectionViewCell()
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / collectionView.frame.width
        let indexPath = IndexPath(item: Int(index), section: 0)
        menuBar.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        flowLayout.invalidateLayout()
    }
    
}


