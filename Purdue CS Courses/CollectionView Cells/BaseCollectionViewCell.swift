//
//  BaseCollectionViewCell.swift
//  Purdue CS Courses
//
//  Created by chris on 8/27/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
        setUpLabel()
        setUpTextView()
        setUpTableView()
        setUpChatVC()
    }
    
    func setUpLabel(){}
    func setUpViews(){}
    func setUpTextView(){}
    func setUpTableView(){}
    func setUpChatVC(){}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
