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
    let menuBar = MenuBar()
    let statisticCellId = "statisticCellId"
    let adviceCellId = "adviceCellId"
    let liveChatCellId = "liveChatCellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpButton()
        setUpCollectionView()
        setUpMenuBar()
    }
    
    func setUpCollectionView(){
        let layout                  = UICollectionViewFlowLayout()
        layout.scrollDirection      = .horizontal
        layout.minimumLineSpacing   = 0
        
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.collectionView.showsHorizontalScrollIndicator  = false
        self.collectionView.backgroundColor                 = .gray
        self.collectionView.isPagingEnabled                 = true
        self.collectionView.dataSource                      = self
        self.collectionView.delegate                        = self
        
        self.view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.topMargin).offset(100)
            make.bottom.equalTo(self.view.snp.bottom)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
        }
        
        collectionView.register(StatisticCell.self, forCellWithReuseIdentifier: statisticCellId)
        collectionView.register(AdviceCell.self, forCellWithReuseIdentifier: adviceCellId)
        collectionView.register(LiveChatCell.self, forCellWithReuseIdentifier: liveChatCellId)
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
    
    func setUpMenuBar(){
        self.view.addSubview(menuBar)
        
        menuBar.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(70)
            make.bottom.equalTo(self.collectionView.snp.top).offset(-10)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
        }
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
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        flowLayout.invalidateLayout()
    }
}
