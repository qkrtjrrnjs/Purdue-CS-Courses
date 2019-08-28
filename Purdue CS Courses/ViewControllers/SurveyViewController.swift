//
//  SurveyViewController.swift
//  Purdue CS Courses
//
//  Created by chris on 8/28/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController {
    
    var course: Course?
    var collectionView: UICollectionView!
    
    let SurveyStatisticCellId     = "SurveyStatisticCellId"
    let SurveyAdviceCellId        = "SurveyAdviceCellId"
    let backButton = UIButton().then{ (button) in
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(backToCourseVC), for: .touchUpInside)
    }    

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpButton()
        setUpCollectionView()
    }
    
    func setUpButton(){
        self.view.addSubview(backButton)
        
        backButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 33, height: 33))
            make.top.equalTo(self.view.snp.topMargin).offset(40)
            make.left.equalTo(self.view.snp.left).offset(17)
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
        switch indexPath.item{
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SurveyStatisticCellId, for: indexPath)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SurveyAdviceCellId, for: indexPath)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
