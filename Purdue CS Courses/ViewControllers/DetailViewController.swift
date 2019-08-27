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

class DetailViewController: UIViewController {
    
    var course: Course?
    var collectionView: UICollectionView!

    let backButton = UIButton().then{ (button) in
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(backToCourseVC), for: .touchUpInside)
    }
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpButton()
        setUpCollectionView()
    }
    
    func setUpCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        self.collectionView.backgroundColor = .white
        self.collectionView.isPagingEnabled = true
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.topMargin).offset(100)
            make.bottom.equalTo(self.view.snp.bottom)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
        }
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
//        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
//        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
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

extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        cell.backgroundColor = .gray
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
