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

class CourseViewController: UIViewController {
    
    var courses = [
        Course(CS: 11100, description: "Introduction to Computers\n\nCredit Hours: 3.00. Computer applications and how they can be used for solving problems in everyday life. The Internet with an emphasis on obtaining information from the World Wide Web, use of a database with an emphasis on data storage and retrieval, spreadsheets, word processing, presentation software, integration of multiple software packages. May not be taken for credit by Computer Science majors. Typically offered Fall Spring Summer.", opened: false),
        Course(CS: 15900, description: "C Programming\n\nCredit Hours: 3.00. Fundamental principles, concepts, and methods of programming in C, with emphasis on applications in the physical sciences and engineering. Basic problem solving and programming techniques; fundamental algorithms and data structures; and use of programming logic in solving engineering problems. Students are expected to complete assignments in a collaborative learning environment. Credit cannot be obtained for both CS 15900 and any of CS 15600, CS 15800 and CS 18000. Typically offered Fall Spring Summer.", opened: false),
        Course(CS: 17700, description: "Programming With Multimedia Objects\n\nCredit Hours: 4.00. Introduction to computers and programming: number representations, primitive data types and operations, basic control structures, programming applets and applications using graphical user interfaces, programming for detecting events and performing actions, processing multimedia objects such as images and sounds. Throughout the course, examples are drawn from a variety of fields in the natural sciences. Not open to CS majors with a grade of C or better in CS 18000. Not open to non-CS majors with a grade of C or better in any course in computer programming. Typically offered Fall Spring.", opened: false),
        Course(CS: 18000, description: "Problem Solving And Object-Oriented Programming\n\nCredit Hours: 4.00. Problem solving and algorithms, implementation of algorithms in a high level programming language, conditionals, the iterative approach and debugging, collections of data, searching and sorting, solving problems by decomposition, the object-oriented approach, subclasses of existing classes, handling exceptions that occur when the program is running, graphical user interfaces (GUIs), data stored in files, abstract data types, a glimpse at topics from other CS courses. Intended primarily for students majoring in computer sciences. Credit cannot be obtained for both CS 18000 and any of 15600, 15800 and 15900. Not open to students with credit in CS 24000. Typically offered Fall Spring Summer.", opened: false),
        Course(CS: 18200, description: "Foundations Of Computer Science\n\nCredit Hours: 3.00. Logic and proofs; sets, functions, relations, sequences and summations; number representations; counting; fundamentals of the analysis of algorithms; graphs and trees; proof techniques; recursion; Boolean logic; finite state machines; pushdown automata; computability and undecidability. Typically offered Spring Fall Summer.", opened: false),
        Course(CS: 19100, description: "Freshman Resources Seminar\n\nCredit Hours: 1.00. This course is intended to integrate freshman majors in computer sciences into the department, help them adjust to university life, and assist them in developing academic and intellectual survival skills. Weekly recitation sections enable the students to work in teams. Strongly recommended for freshmen. The credit may be used only toward free electives. Typically offered Fall.", opened: false),
    ]
    
    let courseTableView = UITableView()
    let cellId          = "courseCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
    }
    
    func setUpTableView(){
        self.courseTableView.dataSource                     = self
        self.courseTableView.delegate                       = self
        self.courseTableView.showsVerticalScrollIndicator   = false
        self.courseTableView.separatorColor                 = .clear
        
        self.view.addSubview(courseTableView)
        
        courseTableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.topMargin).offset(50)
            make.bottom.equalTo(self.view.snp.bottomMargin)
            make.left.equalTo(self.view.snp.left).offset(30)
            make.right.equalTo(self.view.snp.right).offset(-30)
        }
        
        courseTableView.register(CourseCell.self, forCellReuseIdentifier: cellId)
    }
}

extension CourseViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if courses[section].opened == true{
            return 2
        }
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CourseCell
            cell.courseLabel.text = "CS \(courses[indexPath.section].number)"
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CourseCell
            cell.descriptionLabel.text = courses[indexPath.section].description
            cell.backdropView.isHidden = true
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if courses[indexPath.section].opened == false{
            courses[indexPath.section].opened = true
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        }else{
            courses[indexPath.section].opened = false
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        }
    }
}


