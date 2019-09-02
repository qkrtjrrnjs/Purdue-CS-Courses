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
    
    var courses = [
        Course(CS: 11100, description: "Introduction to Computers\n\nCredit Hours: 3.00. Computer applications and how they can be used for solving problems in everyday life. The Internet with an emphasis on obtaining information from the World Wide Web, use of a database with an emphasis on data storage and retrieval, spreadsheets, word processing, presentation software, integration of multiple software packages. May not be taken for credit by Computer Science majors. Typically offered Fall Spring Summer.", isExpanded: false),
        Course(CS: 15900, description: "C Programming\n\nCredit Hours: 3.00. Fundamental principles, concepts, and methods of programming in C, with emphasis on applications in the physical sciences and engineering. Basic problem solving and programming techniques; fundamental algorithms and data structures; and use of programming logic in solving engineering problems. Students are expected to complete assignments in a collaborative learning environment. Credit cannot be obtained for both CS 15900 and any of CS 15600, CS 15800 and CS 18000. Typically offered Fall Spring Summer.", isExpanded: false),
        Course(CS: 17700, description: "Programming With Multimedia Objects\n\nCredit Hours: 4.00. Introduction to computers and programming: number representations, primitive data types and operations, basic control structures, programming applets and applications using graphical user interfaces, programming for detecting events and performing actions, processing multimedia objects such as images and sounds. Throughout the course, examples are drawn from a variety of fields in the natural sciences. Not open to CS majors with a grade of C or better in CS 18000. Not open to non-CS majors with a grade of C or better in any course in computer programming. Typically offered Fall Spring.", isExpanded: false),
        Course(CS: 18000, description: "Problem Solving And Object-Oriented Programming\n\nCredit Hours: 4.00. Problem solving and algorithms, implementation of algorithms in a high level programming language, conditionals, the iterative approach and debugging, collections of data, searching and sorting, solving problems by decomposition, the object-oriented approach, subclasses of existing classes, handling exceptions that occur when the program is running, graphical user interfaces (GUIs), data stored in files, abstract data types, a glimpse at topics from other CS courses. Intended primarily for students majoring in computer sciences. Credit cannot be obtained for both CS 18000 and any of 15600, 15800 and 15900. Not open to students with credit in CS 24000. Typically offered Fall Spring Summer.", isExpanded: false),
        Course(CS: 18200, description: "Foundations Of Computer Science\n\nCredit Hours: 3.00. Logic and proofs; sets, functions, relations, sequences and summations; number representations; counting; fundamentals of the analysis of algorithms; graphs and trees; proof techniques; recursion; Boolean logic; finite state machines; pushdown automata; computability and undecidability. Typically offered Spring Fall Summer.", isExpanded: false),
        Course(CS: 19100, description: "Freshman Resources Seminar\n\nCredit Hours: 1.00. This course is intended to integrate freshman majors in computer sciences into the department, help them adjust to university life, and assist them in developing academic and intellectual survival skills. Weekly recitation sections enable the students to work in teams. Strongly recommended for freshmen. The credit may be used only toward free electives. Typically offered Fall.", isExpanded: false),
        Course(CS: 19300, description: "Tools/n/nCredit Hours: 1.00. This course is designed to introduce new Computer Science students to various programming tools which will aid them in their Computer Science classes, personal projects, and software development job experiences. Typically offered Fall Spring.", isExpanded: false),
        Course(CS: 23500, description: "Introduction To Organizational Computing\n\nCredit Hours: 3.00. People and organizations, decision-making, information systems, telecommunications, desktop systems, integration tools, collaboration and groupware, multimedia, authoring multimedia documents, emerging technologies. May not be taken for credit by Computer Science majors. Typically offered Fall Spring Summer.", isExpanded: false),
        Course(CS: 24000, description: "Programming In C/n/nCredit Hours: 3.00. The UNIX environment, C development cycle, data representation, operators, program structure, recursion, macros, C preprocessor, pointers and addresses, dynamic memory allocation, structures, unions, typedef, bit-fields, pointer/structure applications, UNIX file abstraction, file access, low-level I/O, concurrency. Typically offered Fall Spring.", isExpanded: false),
        Course(CS: 24200, description: "Introduction To Data Science\n\nCredit Hours: 3.00. (STAT 24200) This course provides a broad introduction to the field of data science. The course focuses on using computational methods and statistical techniques to analyze massive amounts of data and to extract knowledge. It provides an overview of foundational computational and statistical tools for data acquisition and cleaning, data management and big data systems. The course surveys the complete data science process from data to knowledge and gives students hands-on experience with tools and methods. Basic knowledge of Python required. Computer Science majors cannot count this course as a degree requirement but can take it for credit as a free elective if taken before CS 37300, 34800, 47100, 47300, 44800. Typically offered Fall Spring.", isExpanded: false),
        Course(CS: 25000, description: "Computer Architecture\n\nCredit Hours: 4.00. Digital logic: transistors, gates, and combinatorial circuits; clocks; registers and register banks; arithmetic-logic units; data representation: big-endian and little-endian integers; ones and twos complement arithmetic; signed and unsigned values; Von-Neumann architecture and bottleneck; instruction sets; RISC and CISC designs; instruction pipelines and stalls; rearranging code; memory and address spaces; physical and virtual memory; interleaving; page tables; memory caches; bus architecture; polling and interrupts; DMA; device programming; assembly language; optimizations; parallelism; data pipelining. Typically offered Fall Spring.", isExpanded: false),
        Course(CS: 25100, description: "Data Structures And Algorithms\n\nCredit Hours: 3.00. Running time analysis of algorithms and their implementations, one-dimensional data structures, trees, heaps, additional sorting algorithms, binary search trees, hash tables, graphs, directed graphs, weighted graph algorithms, additional topics. Typically offered Fall Spring.", isExpanded: false),
        Course(CS: 25200, description: "Systems Programming\n\nCredit Hours: 4.00. Low-level programming; review of addresses, pointers, memory layout, and data representation; text, data, and bss segments; debugging and hex dumps; concurrent execution with threads and processes; address spaces; file names; descriptors and file pointers; inheritance; system calls and library functions; standard I/O and string libraries; simplified socket programming; building tools to help programmers; make and make files; shell scripts and quoting; unix tools including sed, echo, test, and find; scripting languages such as awk; version control; object and executable files (.o and a.out); symbol tables; pointers to functions; hierarchical directories; and DNS hierarchy; programming embedded systems. Typically offered Fall Spring.", isExpanded: false),
        Course(CS: 29100, description: "Soph Developmt Seminar\n\nCredit Hours: 1.00. Presentations by corporate partners about careers in computer science. Presentations by faculty about careers in academia and research. Students learn about upper-division courses, tour research laboratories, and attend job fairs. Typically offered Fall.", isExpanded: false),
        Course(CS: 30700, description: "Software Engineering I\n\nCredit Hours: 3.00. An introduction to the methods and tools of software engineering; software life cycle; specification and design of software, software testing, cost and effort estimation; laboratory exercises with design, testing, and other tools. Typically offered Fall Spring.", isExpanded: false),
        Course(CS: 31400, description: "Numerical Methods\n\nCredit Hours: 3.00. Iterative methods for solving nonlinear equations; direct and iterative methods for solving linear systems; approximations of functions, derivatives, and integrals; error analysis. Typically offered Spring.", isExpanded: false),
        Course(CS: 33400, description: "Fundamentals Of Computer Graphics\n\nCredit Hours: 3.00. Fundamental principles and techniques of computer graphics. The course covers the basics of going from a scene representation to a raster image using OpenGL. Specific topics include coordinate manipulations, perspective, basics of illumination and shading, color models, texture maps, clipping and basic raster algorithms, fundamentals of scene constructions. C S 314 is recommended. Typically offered Fall.", isExpanded: false),
        Course(CS: 34800, description: "Information Systems\n\nCredit Hours: 3.00. File organization and index structures; object-oriented database languages; the relational database model with introductions to SQL and DBMS; hierarchical models and network models with introductions to HDDL, HDML, and DBTG Codasyl; data mining; data warehousing; database connectivity; distributed databases; the client/server paradigm; middleware, including ODBC, JDBC, CORBA, and MOM. Typically offered Fall.", isExpanded: false),
        Course(CS: 35200, description: "Compilers: Principles And Practice\n\nCredit Hours: 3.00. Should not be taken concurrently with CS 354. The theory and practice of programming language translation, compilation, and run-time systems, organized around a significant programming project to build a compiler for a simple but nontrivial programming language. Modules, interfaces, tools. Data structures for tree languages. Lexical analysis, syntax analysis, abstract syntax. Symbol tables, semantic analysis. Translation, intermediate code, basic blocks, traces. Instruction selection, CISC and RISC machines. Liveness analysis, graph coloring register allocation. Supplemental material drawn from garbage collection, object-oriented languages, higher-order languages, dataflow analysis, optimization, polymorphism, scheduling and pipelining, memory hierarchies. Typically offered Fall Spring.", isExpanded: false),
        Course(CS: 35400, description: "Operating Systems\n\nCredit Hours: 3.00. Should not be taken concurrently with CS 35200. Introduction to operating systems. Computer system and operating system architectures, processes, inter-process communication, inter-process synchronization, mutual exclusion, deadlocks, memory hierarchy, virtual memory, CPU scheduling, file systems, I/O device management, security. Typically offered Fall Spring.", isExpanded: false),
        Course(CS: 35500, description: "Introduction To Cryptography\n\nCredit Hours: 3.00. An introduction to cryptography basics: Classic historical ciphers including Caesar, Vigenere and Vernam ciphers; modern ciphers including DES, AES, Pohlig-Hellman, and RSA; signatures and digests; key exchange; simple protocols; block and stream ciphers; network-centric protocols. Typically offered Fall Spring.", isExpanded: false),
        Course(CS: 37300, description: "Data Mining And Machine Learning\n\nCredit Hours: 3.00. This course will introduce students to the field of data mining and machine learning, which sits at the interface between statistics and computer science. Data mining and machine learning focuses on developing algorithms to automatically discover patterns and learn models of large datasets. This course introduces students to the process and main techniques in data mining and machine learning, including exploratory data analysis, predictive modeling, descriptive modeling, and evaluation. Typically offered Fall Spring.", isExpanded: false),
        Course(CS: 38003, description: "Python Programming\n\nCredit Hours: 1.00. This course teaches the Python programming language assuming that students have already taken a course in computer programming. This 5-week one-credit course teaches the Python language, the most common modules used in Python, as well as how to write Python web applications. Typically offered Fall Spring.", isExpanded: false),
        Course(CS: 38100, description: "Introduction To The Analysis Of Algorithms\n\nCredit Hours: 3.00. Techniques for analyzing the time and space requirements of algorithms. Application of these techniques to sorting, searching, pattern-matching, graph problems, and other selected problems. Brief introduction to the intractable (NP-hard) problems. Typically offered Fall Spring.", isExpanded: false),
        Course(CS: 39000, description: "Topics In Computer Sciences\n\nCredit Hours: 1.00 to 5.00. Topics vary. Permission of instructor required. Typically offered Fall Spring Summer.", isExpanded: false),
        Course(CS: 39000, description: "Topics In Computer Sciences\n\nCredit Hours: 1.00 to 5.00. Topics vary. Permission of instructor required. Typically offered Fall Spring Summer.", isExpanded: false),
        Course(CS: 39700, description: "Honors Seminar\n\nCredit Hours: 0.00. A seminar for all sophomores, juniors, and seniors in the Computer Sciences Honors Program. Meets eight times each semester under the supervision of the Honors coordinator. The meetings focus on honors research projects, helping students to identify appropriate projects and form groups, and providing a forum for juniors and seniors to report on their projects as required in the honors program. Typically offered Fall.", isExpanded: false),
        Course(CS: 40700, description: "Software Engineering Senior Project\n\nCredit Hours: 3.00. A capstone course combining all the concepts students have learned in the Software Engineering Track: software and software engineering, working as a team leader and as a team member, Agile Software Development, Scrum Software Development, Version Control, basing software development on reusable technology, developing requirements (User Stories and Use Cases), modelling with classes, design patterns, focusing on users, modelling interactions and behavior, architecting and designing software, testing and inspecting, managing the software development process. This is a project course. Students are organized into 4-6 student teams. Each team completes a full-semester software engineering project. Each team creates a Project Charter, Product Backlog, Design, and for 3 Sprints -- Planning Document, Demo, Retrospective Document. The final demo is a formal presentation. Typically offered Fall Spring Summer.", isExpanded: false),
        Course(CS: 40800, description: "Software Testing\n\nCredit Hours: 3.00. Preliminaries: errors and testing; software quality, requirements, behavior, and correctness; testing, debugging, verification; control flow graphs, dominators; types of testing; Test selection: from requirements, finite state models, and combinatorial designs; regression testing and test minimization; Test adequacy assessment: control and data flow; mutation based; testing tools. Typically offered Fall. ", isExpanded: false),
        Course(CS: 42200, description: "Computer Networks\n\nCredit Hours: 3.00. Undergraduate-level introduction to computer networks and data communication. Low-level details of media, signals, and bits: time division and frequency division multiplexing; encoding; modulation; bandwidth, throughput, and noise. Packet transmission: Local Area Network (Ethernet, FDDI) and Wide Area Network technologies (ATM); wireless networks; network interconnection with repeaters, bridges, and switches; DSU/CSU; xDSL and cable modems. Internetworking: router-based architecture; IP addressing; address binding with ARP; datagram encapsulation and fragmentation; UDP and TCP, retransmission; protocol ports; ICMP and error handling. Network applications: client/server concept; port demultiplexing; program interface to protocols (API); use by clients and servers; domain name system; TELNET; Web technologies including HTTP, CGI, Java; RPC and middleware; network management. Typically offered Fall Spring.", isExpanded: false),
        Course(CS: 42600, description: "Computer Security/n/nCredit Hours: 3.00. A survey of the fundamentals of information security. Risks and vulnerabilities, policy formation, controls and protection methods, database security, encryption, authentication technologies, host-based and network-based security issues, personnel and physical security issues, issues of law and privacy. Typically offered Fall Spring.", isExpanded: false),
        
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
            cell.courseLabel.text   = "CS \(courses[indexPath.section].number)"
            cell.selectionStyle     = .none
            
            cell.showStatistics = { [unowned self] in
                self.transitionToStatisticsVC(indexPath: indexPath)
            }
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: descriptionCellId, for: indexPath) as! DescriptionCell
            cell.descriptionLabel.text  = courses[indexPath.section].description
            cell.selectionStyle         = .none
            return cell
        }
    }
    
    func transitionToStatisticsVC(indexPath: IndexPath){
        let detailVC                        = DetailViewController()
        detailVC.hero.isEnabled             = true
        detailVC.hero.modalAnimationType    = .push(direction: .left)
        detailVC.view.backgroundColor       = .white
        GlobalData.course                   = self.courses[indexPath.section]
        self.present(detailVC, animated: true, completion: nil)
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


