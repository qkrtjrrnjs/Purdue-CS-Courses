//
//  ViewController.swift
//  Purdue CS Courses
//
//  Created by chris on 8/20/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit
import Then
import SnapKit
import Hero

class CourseViewController: UIViewController{
    
    let courseTableView         = UITableView()
    let courseCellId            = "courseCellId"
    let descriptionCellId       = "descriptionCellId"
    
    var courseManager           = CourseManager.shared
    
    let titleLabel      = UILabel().then{ (label) in
        label.text          = "COURSE"
        label.textColor     = .black
        label.font          = UIFont(name: "Tajawal-Regular", size: 20)
        label.textAlignment = .center
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabel()
        setUpTableView()
    }
    
    func setUpLabel(){
        self.view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(self.view.snp.topMargin).offset(50)
        }
    }
    
    func setUpTableView(){
        self.courseTableView.dataSource                     = self
        self.courseTableView.delegate                       = self
        self.courseTableView.showsVerticalScrollIndicator   = false
        self.courseTableView.separatorColor                 = .clear

        self.view.addSubview(courseTableView)
        
        courseTableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(40)
            make.bottom.equalTo(self.view.snp.bottomMargin)
            make.left.equalTo(self.view.snp.left).offset(40)
            make.right.equalTo(self.view.snp.right).offset(-40)
        }
        
        courseTableView.register(CourseCell.self, forCellReuseIdentifier: courseCellId)
        courseTableView.register(DescriptionCell.self, forCellReuseIdentifier: descriptionCellId)
    }
}

extension CourseViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return courseManager.getCourseCount()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if courseManager.getExpandedStatus(section) == true{
            return 2
        }else{
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: courseCellId, for: indexPath) as! CourseCell
            cell.courseLabel.text   = "CS \(courseManager.getCourse(indexPath.section).number)"
            cell.selectionStyle     = .none
            
            cell.showStatistics = { [unowned self] in
                self.transitionToStatisticsVC(indexPath: indexPath)
            }
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: descriptionCellId, for: indexPath) as! DescriptionCell
            cell.descriptionLabel.text  = courseManager.getCourse(indexPath.section).description
            cell.selectionStyle         = .none
            return cell
        }
    }
    
    func transitionToStatisticsVC(indexPath: IndexPath){
        let detailVC                            = DetailViewController()
        detailVC.hero.isEnabled                 = true
        detailVC.hero.modalAnimationType        = .push(direction: .left)
        detailVC.view.backgroundColor           = .white
        CourseManager.shared.currentCourseIndex        = indexPath.section
        self.present(detailVC, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            if courseManager.getExpandedStatus(indexPath.section) == false{
                courseManager.setExpandedStatus(true, indexPath.section)
                let sections = IndexSet.init(integer: indexPath.section)
                courseTableView.reloadSections(sections, with: .automatic)
            }else{
                courseManager.courses[indexPath.section].isExpanded = false
                courseManager.setExpandedStatus(false, indexPath.section)
                let sections = IndexSet.init(integer: indexPath.section)
                courseTableView.reloadSections(sections, with: .automatic)
            }
        }
    }
    
}


