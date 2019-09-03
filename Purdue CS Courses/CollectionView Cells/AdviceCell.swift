//
//  AdvicesCell.swift
//  Purdue CS Courses
//
//  Created by chris on 8/27/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class AdviceCell: BaseCollectionViewCell {
    
    let adviceTableView = UITableView()
    let cellId = "cellId"
    
    override func setUpTableView() {
        super.setUpTableView()
        
        self.adviceTableView.delegate                       = self
        self.adviceTableView.dataSource                     = self
        self.adviceTableView.showsVerticalScrollIndicator   = false
        self.adviceTableView.separatorColor                 = .clear
        
        addSubview(adviceTableView)
        
        adviceTableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            
        }
        
        adviceTableView.register(AdviceTableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    
}

extension AdviceCell: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = GlobalData.courseAdviceData["\(GlobalData.course!.number)"]{
            return data.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! AdviceTableViewCell
        cell.adviceLabel.text   = GlobalData.courseAdviceData["\(GlobalData.course!.number)"]![indexPath.row].advice
        
        let format = DateFormatter()
        format.dateFormat = "M/d/yy"
        let formattedDate = format.string(from: GlobalData.courseAdviceData["\(GlobalData.course!.number)"]![indexPath.row].date)
        
        cell.dateLabel.text = formattedDate
        return cell
    }
}

class AdviceTableViewCell: BaseTableViewCell{
    
    let backdropView = UIView().then { (view) in
        view.backgroundColor      = UIColor(hex: "E4ECF1")
        view.clipsToBounds        = true
        view.layer.cornerRadius   = 7
    }
    
    let adviceLabel = UILabel().then{ (label) in
        label.textColor        = .black
        label.font             = UIFont(name: "Tajawal-Regular", size: 20)
        label.numberOfLines    = 0
    }
    
    let dateLabel = UILabel().then{ (label) in
        label.textColor        = .black
        label.font             = UIFont(name: "Tajawal-Regular", size: 18)
        label.numberOfLines    = 0
    }
    
    override func setUpBackdropView() {
        super.setUpBackdropView()
        
        addSubview(backdropView)
        
        backdropView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(6)
            make.bottom.equalTo(self.snp.bottom).offset(-6)
            make.left.equalTo(self.snp.left).offset(10)
            make.right.equalTo(self.snp.right).offset(-10)
        }
    }
    
    override func setUpLabel() {
        super.setUpLabel()
        
        backdropView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(25)
            make.left.equalTo(self.snp.left).offset(20)
            make.right.equalTo(self.snp.right).offset(-20)
        }
        
        backdropView.addSubview(adviceLabel)
        adviceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.dateLabel.snp.bottom).offset(10)
            make.bottom.equalTo(self.snp.bottom).offset(-25)
            make.left.equalTo(self.snp.left).offset(20)
            make.right.equalTo(self.snp.right).offset(-20)
        }
        
        
    }
}
