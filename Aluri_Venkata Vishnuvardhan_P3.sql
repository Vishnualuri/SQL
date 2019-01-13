CREATE TABLE DEGREE 
(Deg_code VARCHAR(30) 		NOT NULL,
Deg_name VARCHAR(50) 		NOT NULL,
Description VARCHAR(200) 	NOT NULL,
PRIMARY KEY (Deg_code),
UNIQUE (Deg_name));


CREATE TABLE COURSE 
(Course_no	VARCHAR(30)		NOT NULL,
Course_name	VARCHAR(50)		NOT NULL,
Description	VARCHAR(200)	NOT NULL,
PRIMARY KEY(Course_no),
UNIQUE (Course_name));


CREATE TABLE CONCENTRATION 
(Conc_code	VARCHAR(30)		NOT NULL,
Conc_name	VARCHAR(100)		NOT NULL,
Description	VARCHAR(200)	NOT NULL,
Deg_code	VARCHAR(30)		NOT NULL,
PRIMARY KEY(Conc_code),
UNIQUE (Conc_name),
FOREIGN KEY (Deg_code) REFERENCES DEGREE(Deg_code) ON DELETE CASCADE);	


CREATE TABLE DEGREE_COURSE 
(Deg_code		VARCHAR(30) NOT NULL,
Course_no 		VARCHAR(30) NOT NULL,
TYPE			VARCHAR(30) DEFAULT'Elective',
PRIMARY KEY (Deg_code, Course_no),
FOREIGN KEY (Course_no) REFERENCES COURSE(Course_no) ON DELETE CASCADE,
FOREIGN KEY (Deg_code) REFERENCES DEGREE(Deg_code) ON DELETE CASCADE);


CREATE TABLE STUDENT 
(Student_ID	VARCHAR(30)	NOT NULL,
Fname		VARCHAR(30) NOT NULL,
Lname		VARCHAR(30) NOT NULL,
Deg_code	VARCHAR(30) NOT NULL,
PRIMARY KEY (Student_ID),
FOREIGN KEY (Deg_code) REFERENCES DEGREE(Deg_code) ON DELETE SET NULL);

CREATE TABLE TRANSCRIPT 
(Student_ID	VARCHAR(30) NOT NULL,
Course_no	VARCHAR(30)	NOT NULL,
Semester	VARCHAR(30)	NOT NULL,
Year		DECIMAL(4)	NOT NULL,
Grade		VARCHAR(5)	DEFAULT NULL,
PRIMARY KEY (Student_ID,Course_no,Semester,Year),
FOREIGN KEY (Student_ID) REFERENCES STUDENT (Student_ID) ON DELETE CASCADE,
FOREIGN KEY (Course_no) REFERENCES COURSE(Course_no) ON DELETE CASCADE);

CREATE TABLE STUDENT_CONCENTRATION 
(Student_ID	VARCHAR(30) NOT NULL,
Conc_code	VARCHAR(30)	NOT NULL,
PRIMARY KEY (Student_ID,Conc_code),
FOREIGN KEY (Student_ID) REFERENCES STUDENT (Student_ID) ON DELETE CASCADE,
FOREIGN KEY (Conc_code) REFERENCES CONCENTRATION(Conc_code) ON DELETE CASCADE);

CREATE TABLE PREREQUISITE 
(Course VARCHAR(10)	NOT NULL,
Prereq VARCHAR(10)	NOT NULL,
PRIMARY KEY(Course, Prereq),
FOREIGN KEY(Course) REFERENCES COURSE(Course_no) ON DELETE CASCADE,
FOREIGN KEY(Prereq) REFERENCES COURSE(Course_no) ON DELETE CASCADE);


CREATE TABLE CONCENTRATION_COURSE 
(Conc_code 			VARCHAR(30) NOT NULL,
Course_no 			VARCHAR(30) NOT NULL,
Type				VARCHAR(30)	DEFAULT'Elective',
PRIMARY KEY (Conc_code, Course_no),
FOREIGN KEY (Conc_code) REFERENCES CONCENTRATION(Conc_code) ON DELETE CASCADE,
FOREIGN KEY	(Course_no) REFERENCES COURSE(Course_no) ON DELETE CASCADE);

insert into degree values ('mscs', 'masters in computer science', ' A program for computer professionals and those who intend to move into the computer field from other areas of study');
insert into degree values ('mscis', 'masters in computer information systems', 'Designed to combine tech competence in information systems with knowledge of managerial issues.');
insert into degree values ('msba', 'masters in business analytics', 'abcdef');


Insert into  course values ('MET CS 579', 'Database Management', 'Management of DB');
Insert into  course values ('MET CS 566', 'Analysis of Algorithms', 'Algorithms will be analysed');
Insert into  course values ('MET CS 575', 'Operating Systems', 'OS');
Insert into  course values ('MET CS 662', 'Computer Language Theory', 'Theory about Computer Language');
Insert into  course values ('MET CS 673', 'Software Engineering', 'lifecycles');
Insert into  course values ('MET CS 532', 'Computer Graphics', 'qwerty');
Insert into  course values ('MET CS 664', 'Artificial Intelligence', 'qwerty');
Insert into  course values ('MET CS 665', 'Software Design and Patterns', 'qwerty');
Insert into  course values ('MET CS 683', 'Mobile Application Development', 'qwerty');
Insert into  course values ('MET CS 699', 'Data Mining and Business Intelligence', 'qwerty');
Insert into  course values ('MET CS 701', 'Rich Internet Application Development', 'qwerty');
Insert into  course values ('MET CS 767', 'Fuzzy, Expert, Genetic, and Neural Systems', 'qwerty');
Insert into  course values ('MET CS 773', 'Software Quality Management', 'qwerty');
Insert into  course values ('MET CS 690', 'Network Security', 'qwerty');
Insert into  course values ('MET CS 695', 'Enterprise Information Security', 'qwerty');
Insert into  course values ('MET CS 789', 'Cryptography', 'qwerty');
Insert into  course values ('MET CS 599', 'Biometrics', 'qwerty');
Insert into  course values ('MET CS 693', 'Digital Forensics and Investigations', 'qwerty');
Insert into  course values ('MET CS 703', 'Network Forensics', 'qwerty');
Insert into  course values ('MET CS 713', 'Advanced Digital Forensics', 'qwerty');
Insert into  course values ('MET CS 635', 'Network Design and Implementation', 'qwerty');
Insert into  course values ('MET CS 685', 'Network Design and Management', 'qwerty');
Insert into  course values ('MET CS 775', 'Advanced Networking', 'qwerty');
Insert into  course values ('MET CS 546', 'Quantitative Methods for Information Systems', 'qwerty');
Insert into  course values ('MET CS 625', 'Business Data Communication and Networks', 'qwerty');
Insert into  course values ('MET CS 669', 'Database Design and Implementation for Business', 'qwerty');
Insert into  course values ('MET CS 682', 'Information Systems Analysis and Design', 'qwerty');
Insert into  course values ('MET CS 782', 'IT Strategy and Management', 'qwerty');
Insert into  course values ('MET CS 779', 'Advanced Database Management', 'qwerty');
Insert into  course values ('MET CS 674', 'Database Security', 'qwerty');
Insert into  course values ('MET CS 689', 'Designing and Implementing a Data Warehouse', 'qwerty');
Insert into  course values ('MET CS 780', 'Database Administration', 'qwerty');
Insert into  course values ('MET CS 601', 'Web Application Development', 'qwerty');
Insert into  course values ('MET CS 633', 'Distributed Software Development and Management', 'qwerty');
Insert into  course values ('MET CS 535', 'Computer Networks', 'qwerty');
Insert into  course values ('MET CS 651', 'Web Development with .NET', 'qwerty');
Insert into  course values ('MET CS 667', 'Enterprise Java', 'qwerty');
Insert into  course values ('MET CS 783', 'Enterprise Architecture', 'qwerty');
Insert into  course values ('MET CS 520', 'Information Structures', 'qwerty');
	

insert into degree_course values ('mscs','MET CS 535','core');
insert into degree_course values ('mscs','MET CS 579','core');
insert into degree_course values ('mscs','MET CS 566','core');
insert into degree_course values ('mscs','MET CS 575','core');
insert into degree_course values ('mscs','MET CS 662','core');
insert into degree_course values ('mscs','MET CS 673','core');
insert into degree_course values ('mscs','MET CS 532','elective');
insert into degree_course values ('mscs','MET CS 664','elective'); 
insert into degree_course values ('mscs','MET CS 665','elective');
insert into degree_course values ('mscs','MET CS 683','elective');
insert into degree_course values ('mscs','MET CS 699','elective');
insert into degree_course values ('mscs','MET CS 701','elective');
insert into degree_course values ('mscs','MET CS 767','elective');
insert into degree_course values ('mscs','MET CS 773','elective');
insert into degree_course values ('mscs','MET CS 690','elective');
insert into degree_course values ('mscs','MET CS 695','elective');
insert into degree_course values ('mscs','MET CS 789','elective');
insert into degree_course values ('mscs','MET CS 599','elective');
insert into degree_course values ('mscs','MET CS 693','elective');
insert into degree_course values ('mscs','MET CS 703','elective');
insert into degree_course values ('mscs','MET CS 713','elective');
insert into degree_course values ('mscs','MET CS 635','elective');
insert into degree_course values ('mscs','MET CS 685','elective');
insert into degree_course values ('mscs','MET CS 775','elective');
			
insert into degree_course values ('mscis','MET CS 520','core');
insert into degree_course values ('mscis','MET CS 546','core');
insert into degree_course values ('mscis','MET CS 625','core');
insert into degree_course values ('mscis','MET CS 669','core');
insert into degree_course values ('mscis','MET CS 682','core');
insert into degree_course values ('mscis','MET CS 782','core');
insert into degree_course values ('mscis','MET CS 635','elective');
insert into degree_course values ('mscis','MET CS 690','elective');
insert into degree_course values ('mscis','MET CS 695','elective');
insert into degree_course values ('mscis','MET CS 775','elective');
insert into degree_course values ('mscis','MET CS 699','elective');
insert into degree_course values ('mscis','MET CS 779','elective');
insert into degree_course values ('mscis','MET CS 674','elective');
insert into degree_course values ('mscis','MET CS 689','elective');
insert into degree_course values ('mscis','MET CS 780','elective');
insert into degree_course values ('mscis','MET CS 601','elective');
insert into degree_course values ('mscis','MET CS 701','elective');
insert into degree_course values ('mscis','MET CS 633','elective');
insert into degree_course values ('mscis','MET CS 651','elective');
insert into degree_course values ('mscis','MET CS 667','elective');
insert into degree_course values ('mscis','MET CS 783','elective');

insert into concentration values ('123', 'Security', 'Security concentration', 'mscs');
insert into concentration values ('456', 'Computer networks','Computer networks for mscs', 'mscs');
insert into concentration values ('789', 'Computer Networks for mscis','Comp networks for mscis', 'mscis');
insert into concentration values ('1011', 'Database Management Business Intelligence Concentration','Database Management Business Intelligence', 'mscis');
insert into concentration values ('1213', 'Web Application Development Concentration','Web Application Development', 'mscis');


insert into concentration_course values('123','MET CS 690','core');
insert into concentration_course values('123','MET CS 695','core');
insert into concentration_course values('123','MET CS 789','core');
insert into concentration_course values('123','MET CS 599','elective');
insert into concentration_course values('123','MET CS 693','elective');
insert into concentration_course values('123','MET CS 703','elective');
insert into concentration_course values('123','MET CS 713','elective');
insert into concentration_course values('456','MET CS 635','core');
insert into concentration_course values('456','MET CS 685','core');
insert into concentration_course values('456','MET CS 690','core');
insert into concentration_course values('456','MET CS 775','core');
insert into concentration_course values('789','MET CS 635','core');
insert into concentration_course values('789','MET CS 695','core');
insert into concentration_course values('789','MET CS 690','core');
insert into concentration_course values('789','MET CS 775','core');
insert into concentration_course values('1011','MET CS 699','core');
insert into concentration_course values('1011','MET CS 779','core');
insert into concentration_course values('1011','MET CS 674','elective');
insert into concentration_course values('1011','MET CS 689','elective');
insert into concentration_course values('1011','MET CS 780','elective');
insert into concentration_course values('1213','MET CS 601','core');
insert into concentration_course values('1213','MET CS 701','core');
insert into concentration_course values('1213','MET CS 633','elective');
insert into concentration_course values('1213','MET CS 651','elective');
insert into concentration_course values('1213','MET CS 667','elective');
insert into concentration_course values('1213','MET CS 783','elective');

insert into student values ('1001','john','smith','mscs');
insert into student values ('1002','virat','kohli','mscs');
insert into student values ('1003','steven','gerrard','mscs');
insert into student values ('1004','fernando','torres','mscs');
insert into student values ('1005','tom','brady','mscs');
insert into student values ('1006','vishnu','aluri','mscs');

insert into transcript values ('1001','MET CS 579','spring','2014','A+');
insert into transcript values ('1001','MET CS 566','spring','2014','B+');
insert into transcript values ('1001','MET CS 662','summer','2014','A+');
insert into transcript values ('1001','MET CS 673','summer','2014','A+');
insert into transcript values ('1004','MET CS 579','fall','2016','A-');
insert into transcript values ('1004','MET CS 566','spring','2014','A-');
insert into transcript values ('1005','MET CS 579','fall','2016','C+');
insert into transcript values ('1006','MET CS 579','fall','2016','B+');
insert into transcript values ('1004','MET CS 662','fall','2016','A-');

insert into student_concentration values('1001','123');
insert into student_concentration values('1002','123');
insert into student_concentration values('1003','456');
insert into student_concentration values('1004','123');
insert into student_concentration values('1005','789');
insert into student_concentration values('1006','789');

insert into prerequisite values('MET CS 775','MET CS 535');
insert into prerequisite values('MET CS 713','MET CS 546');
insert into prerequisite values('MET CS 695','MET CS 546');


select c.course_no, c.course_name, t.grade
from course c, transcript t, student s
where c.course_no = t.course_no and s.student_id = t.student_id and s.fname = 'john' and s.lname = 'smith' and t.semester = 'spring' and t.year = '2014';

select c.conc_name
from concentration c, degree d
where c.deg_code = d.deg_code and d.deg_code = 'mscs';

select c.course_no, c.course_name
from course c, prerequisite p
where c.course_no = p.course and p.prereq = 'MET CS 546';

select c.conc_name, a.type, d.course_no, d.course_name
from concentration c,concentration_course a, course d
where a.conc_code = c.conc_code and d.course_no = a.course_no and c.conc_name ='Web Application Development Concentration';
