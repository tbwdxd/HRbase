# Updated on Mar. 23th, 2017
# Author： Haoran Ma
# Description： Created three tables, 'Talent'， 'Company'， 'Employment_History'

#1 
CREATE DATABASE HRbase;

#2 Select Database
USE HRbase;

#3 Create Table Talent, Company, Employment_History
#3.1 In table Talent, the primary Key is 'PersonID' and 'EMail' 
CREATE TABLE Talent (PersonID INT NOT NULL AUTO_INCREMENT, LastName VARCHAR(100) NOT NULL, FirstName VARCHAR(100) NOT NULL,
Age INT, LivingArea VARCHAR(100), CellPhone VARCHAR(25), EMail VARCHAR(100) NOT NULL, Major VARCHAR(100), Degree VARCHAR(100),
GraduteSchool VARCHAR(255), Citizen VARCHAR(25), SubmissionDate Date, Source VARCHAR(50), LinkedIn VARCHAR(255), ResumeLocation VARCHAR(255), 
Note VARCHAR(255), PRIMARY KEY(PersonID,EMail));

#3.2 In table Company, the primary key is 'CompanyID'
CREATE TABLE Company (CompanyID INT NOT NULL, CompanyName VARCHAR(255), CompanyInf VARCHAR(255), PRIMARY KEY(CompanyID));

#3.3 In table Employment_History, the primary key is 'EmploymentID', and two foreign key, 'PersonId' and 'CompanyID'
CREATE TABLE Employment_History (EmploymentID INT NOT NULL, PersonID INT NOT NULL, CompanyID INT NOT NULL, JobField VARCHAR(100),
Position VARCHAR(100), StartDate Date, EndDate Date, JobExp VARCHAR(255), PRIMARY KEY(EmploymentID), 
FOREIGN KEY(PersonID) REFERENCES Talent(PersonID), FOREIGN KEY(CompanyID) REFERENCES Company(CompanyID));

#If you want to drop the Table, please follow the order:
DROP Table Employment_History;
DROP TABLE Company;
DROP TABLE Talent;