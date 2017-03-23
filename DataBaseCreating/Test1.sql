USE HRbase;

# Insert Value in 'Talent' table
INSERT INTO Talent 
(LastName, FirstName, Age, LivingArea, CellPhone, EMail, Major, Degree, GraduteSchool, 
Citizen, Source, LinkedIn, ResumeLocation) 
VALUES 
("Ma", "Haoran", 25, "California", "626-478-5299","haoranma0101@gmail.com", "Electrical Engineering", "PhD", "Standford", "Yes", "", "",""),
("Tian", "Bowen", 27, "California", "","tianbowen@gmail.com", "Computer Science","PhD", "Harvard", "Yes", "", "",""),
("Zhang", "Tong", 25, "California", "","zhangtong@gmail.com", "Electrical Engineering","PhD", "MIT", "Yes", "", "",""),
("Cheng", "Songda", 24, "California", "","chengsongda@gmail.com", "Chemistry","PhD", "UCB", "Yes", "", "","");
# In table 'talent', there is one problem need to be concerned. We cannot distinguish duplicate since no unique information.
# I try to use EMail as UniquKey but system treat null information as duplicate. Therefore, we need to control duplication
# somewhere in the system later.

# Insert Value in 'Company' table
INSERT INTO Company (CompanyID, CompanyName, CompanyInf) 
VALUES 
(1, "COMAC America Corporation", "OMG"),
(2, "Apple", "GG"),
(3, "FAA", "Secret"),
(4, "Google", "MM");

# Insert Value in 'Employment_History' table
INSERT INTO Employment_History (EmploymentID, PersonID, CompanyID, JobField, Position, StartDate, EndDate, JobExp)
VALUES 
(1,1,1,"EE","Intern","2016-5-19","2017-5-19","No"),
(2,2,2,"CS","Intern","2016-5-19","2017-5-19","No"),
(3,3,3,"CE","Intern","2016-5-19","2017-5-19","No"),
(4,4,4,"EE","Intern","2016-5-19","2017-5-19","No");

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