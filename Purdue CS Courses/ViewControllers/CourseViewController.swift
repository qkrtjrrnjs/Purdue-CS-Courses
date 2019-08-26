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

class CourseViewController: UIViewController{
    
    var courses = [
        Course(CS: 11100, description: "Introduction to Computers\n\nCredit Hours: 3.00. Computer applications and how they can be used for solving problems in everyday life. The Internet with an emphasis on obtaining information from the World Wide Web, use of a database with an emphasis on data storage and retrieval, spreadsheets, word processing, presentation software, integration of multiple software packages. May not be taken for credit by Computer Science majors. Typically offered Fall Spring Summer.", isExpanded: false),
        Course(CS: 15900, description: "C Programming\n\nCredit Hours: 3.00. Fundamental principles, concepts, and methods of programming in C, with emphasis on applications in the physical sciences and engineering. Basic problem solving and programming techniques; fundamental algorithms and data structures; and use of programming logic in solving engineering problems. Students are expected to complete assignments in a collaborative learning environment. Credit cannot be obtained for both CS 15900 and any of CS 15600, CS 15800 and CS 18000. Typically offered Fall Spring Summer.", isExpanded: false),
        Course(CS: 17700, description: "Programming With Multimedia Objects\n\nCredit Hours: 4.00. Introduction to computers and programming: number representations, primitive data types and operations, basic control structures, programming applets and applications using graphical user interfaces, programming for detecting events and performing actions, processing multimedia objects such as images and sounds. Throughout the course, examples are drawn from a variety of fields in the natural sciences. Not open to CS majors with a grade of C or better in CS 18000. Not open to non-CS majors with a grade of C or better in any course in computer programming. Typically offered Fall Spring.", isExpanded: false),
        Course(CS: 18000, description: "Problem Solving And Object-Oriented Programming\n\nCredit Hours: 4.00. Problem solving and algorithms, implementation of algorithms in a high level programming language, conditionals, the iterative approach and debugging, collections of data, searching and sorting, solving problems by decomposition, the object-oriented approach, subclasses of existing classes, handling exceptions that occur when the program is running, graphical user interfaces (GUIs), data stored in files, abstract data types, a glimpse at topics from other CS courses. Intended primarily for students majoring in computer sciences. Credit cannot be obtained for both CS 18000 and any of 15600, 15800 and 15900. Not open to students with credit in CS 24000. Typically offered Fall Spring Summer.", isExpanded: false),
        Course(CS: 18200, description: "Foundations Of Computer Science\n\nCredit Hours: 3.00. Logic and proofs; sets, functions, relations, sequences and summations; number representations; counting; fundamentals of the analysis of algorithms; graphs and trees; proof techniques; recursion; Boolean logic; finite state machines; pushdown automata; computability and undecidability. Typically offered Spring Fall Summer.", isExpanded: false),
        Course(CS: 19100, description: "Freshman Resources Seminar\n\nCredit Hours: 1.00. This course is intended to integrate freshman majors in computer sciences into the department, help them adjust to university life, and assist them in developing academic and intellectual survival skills. Weekly recitation sections enable the students to work in teams. Strongly recommended for freshmen. The credit may be used only toward free electives. Typically offered Fall.", isExpanded: false)
    ]
    
    let courseTableView         = UITableView()
    let courseCellId            = "courseCellId"
    let descriptionCellId       = "descriptionCellId"
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
        self.courseTableView.rowHeight                      = UITableView.automaticDimension

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
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if courses[section].isExpanded == true{
            return 2
        }else{
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: courseCellId, for: indexPath) as! CourseCell
            cell.courseLabel.text = "CS \(courses[indexPath.section].number)"
            cell.selectionStyle = .none
            
            cell.showStatistics = { [unowned self] in
//                let statisticsVC = StatisticsViewController()
//                statisticsVC.modalTransitionStyle = .partialCurl
//                statisticsVC.number = self.courses[indexPath.section].number
//                statisticsVC.view.backgroundColor = .white
//                self.present(statisticsVC, animated: true, completion: nil)
                let transition = CATransition()
                transition.duration = 0.4
                transition.type = CATransitionType.reveal
                transition.subtype = CATransitionSubtype.fromRight
                transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                self.view.window!.layer.add(transition, forKey: kCATransition)
                
                let presentedVC = StatisticsViewController()
                presentedVC.view.backgroundColor = .white
                self.present(presentedVC, animated: false, completion: nil)
            }
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: descriptionCellId, for: indexPath) as! DescriptionCell
            cell.descriptionLabel.text = courses[indexPath.section].description
            cell.selectionStyle = .none
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            if courses[indexPath.section].isExpanded == false{
                courses[indexPath.section].isExpanded = true
                let sections = IndexSet.init(integer: indexPath.section)
                courseTableView.reloadSections(sections, with: .automatic)
            }else{
                courses[indexPath.section].isExpanded = false
                let sections = IndexSet.init(integer: indexPath.section)
                courseTableView.reloadSections(sections, with: .automatic)
            }
        }
    }
    
}


