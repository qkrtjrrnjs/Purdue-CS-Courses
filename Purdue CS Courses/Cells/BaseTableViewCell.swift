//
//  BaseCell.swift
//  Purdue CS Courses
//
//  Created by chris on 8/27/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpBackdropView()
        setUpLabel()
        setUpButton()
    }
    
    func setUpBackdropView(){}
    func setUpLabel(){}
    func setUpButton(){}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
