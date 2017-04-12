#Updated on March 23th, 2017
#Author: Haoran Ma
#Description: Input some values for test + Test Case 

USE HRbase;

# Insert Values in 'User' table
# Permission number: 0->Admin, 1->Employee, 2->User
INSERT INTO Users 
(EMail, Password, Permission)
VALUES
('haoranma@gmail.com','12345','1'),
('bowentian@gmail.com','12345','0'),
('songdacheng@gmail.com','12345','1'),
('tongzhang@gmail.com','12345','1'),
('apple@gmail.com','12345','2'),
('jack@gmail.com','12345','2'),
('tom@gmail.com','12345','2'),
('kay@gmail.com','12345','2');


# Insert Value in 'Talent' table
INSERT INTO Talent 
(PersonID, LastName, FirstName, Age, LivingArea, CellPhone, DirectPhone, Major, HighestDegree, GraduteSchool, 
	Citizen, SubmissionDate, Source, LinkedIn, ResumeLocation,  KeyWord)
VALUES 
(5, 'A', 'Apple', 25, 'California', '626-478-5299','','Electrical Engineering', 'PhD', 'Standford', 'Yes', 
	'2016-6-1', 'Internal','','','Electrical, Engineering, System Engineering'),
(6, 'B', 'Jack', 27, 'California', '','','Computer Science', 'PhD', 'Standford', 'Yes', 
	'2016-6-1', 'Internal','','','Computer Science, Java, Python'),
(7, 'C', 'Tom', 24, 'California', '','','Chemistry', 'PhD', 'Standford', 'Yes', 
	'2016-6-1', 'Internal','','','Chemistry, Requirement Analysis'),
(8, 'D', 'Kay', 25, 'California', '','','Electrical Engineering', 'PhD', 'Standford', 'Yes', 
	'2016-6-1', 'Internal','','','Electrical Engineering, Machine Learning');

# Insert Value in 'Employee' table
INSERT INTO Employee 
(PersonID, LastName, FirstName, Department, WorkPhone, Position)
VALUES
(1, 'Ma', 'Haoran', 'Engineering&Project Management','949-255-4190','Director'),
(2, 'Zhang', 'Tong','Engineering&Project Management','949-255-2262','Director'),
(3, 'Tian', 'Bowen','Engineering&Project Management','949-255-4197','Director'),
(4, 'Cheng', 'Songda','Engineering&Project Management','949-255-4159','Director');

# Insert Value in 'Comments' table
INSERT INTO Comments 
(PersonID, EmployeeID, Comments)
VALUES
(5, 1, 'Good'),
(6, 2, 'Not Good'),
(7, 3, 'Not Good Enough'),
(8, 4, 'Good Enough');

# Insert Value in 'Company' table
INSERT INTO Company (CompanyID, CompanyName, CompanyInf) 
VALUES 
(1, 'COMAC America Corporation', 'OMG'),
(2, 'Apple', 'GG'),
(3, 'FAA', 'Secret'),
(4, 'Google', 'MM');

# Insert Value in 'Employment_History' table
INSERT INTO Employment_History (EmploymentID, PersonID, CompanyID, WorkingField, Position, StartDate, EndDate, JobExp)
VALUES 
(1,5,1,'EE','Director','2016-5-19','2017-5-19','No'),
(2,6,2,'CS','Director','2016-5-19','2017-5-19','No'),
(3,7,3,'CE','Director','2016-5-19','2017-5-19','No'),
(4,8,4,'EE','Director','2016-5-19','2017-5-19','No');

#Test Case:
#1. Verify Haoran Login and password
Select EMail, Password, Permission from Users where EMail = 'haoranma@gmail.com';

#2. Query Tom's personal information
Select LastName, FirstName, Age, Major, HighestDegree, GraduteSchool 
from Talent where FirstName = 'Tom';

#2. Query Tom's Employment History (Include Working Field, Position, Start Day and End Day)
Select Talent.LastName, Talent.FirstName, Employment_History.WorkingField, Employment_History.Position,
Employment_History.StartDate, Employment_History.EndDate
 from Talent inner join Employment_History on Talent.PersonID = Employment_History.PersonID where Talent.FirstName = 'Tom';

#3. Query Tom's Detail (Include Person ID, Working Field, Position, Start Day, End Day, Company Name and Comapny information)
Select Talent.LastName, Talent.FirstName, Employment_History.WorkingField, Employment_History.Position,
Employment_History.StartDate, Employment_History.EndDate, Company.CompanyName, Company.CompanyInf
from Employment_History 
inner join Talent on Talent.PersonID = Employment_History.PersonID
inner join Company on Company.CompanyID = Employment_History.CompanyID
where Talent.FirstName = 'Tom';

#4 Query Tom's Comments
Select Talent.FirstName, Talent.LastName, Comments.Comments, Comments.EmployeeID from Comments 
inner join Talent on Talent.PersonID = Comments.PersonID
inner join Employee on Employee.EmployeeID = Comments.EmployeeID
where Talent.FirstName = 'Tom';


# SD require to test:
Select * from Employment_History inner join Talent on Employment_History.PersonID = Talent.PersonID
inner join Company on Employment_History.CompanyID = Company.CompanyID
where FirstName = 'Tom' ;