#Updated on March 23th, 2017
#Author: Haoran Ma
#Description: Input some values for test + Test Case 

USE HRbase;

# Insert Value in 'User' table
# Permission number: 0->Admin, 1->Employee, 2->User
INSERT INTO User 
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
(1, "A", "Apple", 25, "California", "626-478-5299","","Electrical Engineering", "PhD", "Standford", "Yes", 
	"2016-6-1", "Internal","","","Electrical, Engineering, System Engineering"),
(2, "B", "Jack", 27, "California", "","","Computer Science", "PhD", "Standford", "Yes", 
	"2016-6-1", "Internal","","","Computer Science, Java, Python"),
(3, "C", "Tom", 24, "California", "","","Chemistry", "PhD", "Standford", "Yes", 
	"2016-6-1", "Internal","","","Chemistry, Requirement Analysis"),
(4, "D", "Kay", 25, "California", "","","Electrical Engineering", "PhD", "Standford", "Yes", 
	"2016-6-1", "Internal","","","Electrical Engineering, Machine Learning");

# Insert Value in 'Employee' table
INSERT INTO Employee 
(PersonID, Department, WorkPhone, Position)
VALUES
(1, 'Engineering&Project Management','949-255-4190','Director'),
(2, 'Engineering&Project Management','949-255-2262','Director'),
(3, 'Engineering&Project Management','949-255-4197','Director'),
(4, 'Engineering&Project Management','949-255-4159','Director');

# Insert Value in 'Comments' table
INSERT INTO Comments 
(PersonID, Comments)
VALUES
(5, 'Good'),
(6, 'Not Good'),
(7, 'Not Good Enough'),
(8, 'Good Enough');

# Insert Value in 'Company' table
INSERT INTO Company (CompanyID, CompanyName, CompanyInf) 
VALUES 
(1, "COMAC America Corporation", "OMG"),
(2, "Apple", "GG"),
(3, "FAA", "Secret"),
(4, "Google", "MM");

# Insert Value in 'Employment_History' table
INSERT INTO Employment_History (EmploymentID, PersonID, CompanyID, WorkingField, Position, StartDate, EndDate, JobExp)
VALUES 
(1,5,1,"EE","Director","2016-5-19","2017-5-19","No"),
(2,6,2,"CS","Director","2016-5-19","2017-5-19","No"),
(3,7,3,"CE","Director","2016-5-19","2017-5-19","No"),
(4,8,4,"EE","Director","2016-5-19","2017-5-19","No");

#Test Case:
#1. Query Haoran's personal information
Select LastName, FirstName, Age, CellPhone, EMail, Major, Degree 
from Talent where FirstName = 'Haoran';

#2. Query Haoran's Employment History (Include Person ID, Job Field, Position, Start Day and End Day)
Select Talent.LastName, Talent.FirstName, Employment_History.PersonID, Employment_History.JobField, Employment_History.Position,
Employment_History.StartDate, Employment_History.EndDate
 from Talent inner join Employment_History on Talent.PersonID = Employment_History.PersonID where Talent.FirstName = 'Haoran';

#3. Query Haoran's Detail (Include Person ID, Job Field, Position, Start Day, End Day, Company Name and Comapny information)
Select Talent.LastName, Talent.FirstName, Employment_History.PersonID, Employment_History.JobField, Employment_History.Position,
Employment_History.StartDate, Employment_History.EndDate, Company.CompanyName, Company.CompanyInf
from Employment_History 
inner join Talent on Talent.PersonID = Employment_History.PersonID
inner join Company on Company.CompanyID = Employment_History.CompanyID
where Talent.FirstName = 'Haoran';


# SD require to test:
# Informaiton shows In this order: major, highest degree, latest graduated from.
Select FirstName, LastName, Major, Degree, GraduteSchool from Talent;

# Information shows current job title
Select Talent.FirstName, Talent.LastName, Employment_History.Position, Employment_History.JobField, Employment_History.StartDate,
Employment_History.EndDate from Employment_History inner join Talent on Employment_History.PersonID = Talent.PersonID;