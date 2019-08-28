//
//  MenuBar.swift
//  Purdue CS Courses
//
//  Created by chris on 8/27/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit
import SnapKit
import Then

class MenuBar: UIView{
    
    let cellId = "cellId"
    let menuNames = ["Statistics", "Advices", "Live Chat"]
    let layout = UICollectionViewFlowLayout()
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then { (cv) in
        cv.delegate = self
        cv.dataSource = self
    }
    var detailViewController: DetailViewController?
    
    override func layoutSubviews() {
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        flowLayout.invalidateLayout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpCollectionView()
    }
    
    func setUpCollectionView(){
        collectionView.backgroundColor = .white
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: [])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuBar: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        cell.label.text = menuNames[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 3, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        detailViewController?.scrollToMenuIndex(index: indexPath.item)
    }
}

class MenuCell: BaseCollectionViewCell{
    
    let label = UILabel().then { (label) in
        label.text = "Statistics"
        label.font = UIFont(name: "Tajawal-Regular", size: 20)
        label.textColor = .black
    }
    
    let backdropView = UIView().then{ (view) in
        view.layer.cornerRadius = 13
        view.layer.zPosition = -1
    }
    
    override var isHighlighted: Bool{
        didSet{
            backdropView.backgroundColor = isHighlighted ? UIColor(hex: "363534") : .white
            label.textColor = isHighlighted ? .white: .black
        }
    }
    
    override var isSelected: Bool{
        didSet{
            backdropView.backgroundColor = isSelected ? UIColor(hex: "363534") : .white
            label.textColor = isSelected ? .white: .black
        }
    }
        
    override func setUpViews(){
        super.setUpViews()
        addSubview(backdropView)
        backdropView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom).offset(-3)
            make.left.equalTo(self.snp.left).offset(8)
            make.right.equalTo(self.snp.right).offset(-8)
        }
    }
    
    override func setUpLabel(){
        super.setUpLabel()
        
        addSubview(label)
        label.snp.makeConstraints { (make) in
            make.center.equalTo(self.snp.center)
        }
    }
}
