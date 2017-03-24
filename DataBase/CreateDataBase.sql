# Updated on Mar. 23th, 2017
# Author： Haoran Ma
# Description： Created three tables, 'Talent'， 'Company'， 'Employment_History'

#1 
CREATE DATABASE HRbase;

#2 Select Database
USE HRbase;

#3 Create Table 'User', 'Talent', 'Employee Information', 'Comments', 'Company', 'Employment_History'

#3.1 In table User, the primary key is 'PersonID' and 'EMail'
CREATE TABLE User (PersonID INT NOT NULL AUTO_INCREMENT, EMail VARCHAR(30) NOT NULL, Password VARCHAR(30) NOT NULL, 
	Permission INT NOT NULL, PRIMARY KEY(PersonID, EMail));

#3.2 In table Talent, the primary key is 'TalentID', foreign key is 'PersonID'
CREATE TABLE Talent (TalentID INT NOT NULL AUTO_INCREMENT, PersonID INT NOT NULL, LastName VARCHAR(50) NOT NULL, 
	FirstName VARCHAR(50) NOT NULL, Age INT, LivingArea VARCHAR(50), CellPhone VARCHAR(25), DirectPhone VARCHAR(25), 
	Major VARCHAR(50), HighestDegree VARCHAR(50), GraduteSchool VARCHAR(100), Citizen VARCHAR(5), SubmissionDate Date, 
	Source VARCHAR(50) NOT NULL, LinkedIn VARCHAR(255), ResumeLocation VARCHAR(255),  KeyWord VARCHAR(255), 
	PRIMARY KEY(TalentID), FOREIGN KEY(PersonID) REFERENCES User(PersonID));

#3.3 In the table Employee Information, the primary key is 'EmployeeID', foreign key is 'PersonID'
CREATE TABLE Employee (EmployeeID INT NOT NULL AUTO_INCREMENT, PersonID INT NOT NULL, Department VARCHAR(50) NOT NULL, 
	WorkPhone VARCHAR(25) NOT NULL, Position VARCHAR(50),
	PRIMARY KEY(EmployeeID), FOREIGN KEY(PersonID) REFERENCES User(PersonID));

#3.4 In the table Comments, the primary key is 'CommentID', foreign key is 'PersonID'
CREATE TABLE Comments (CommentID INT NOT NULL AUTO_INCREMENT, PersonID INT, Comments VARCHAR(255), 
	PRIMARY KEY(CommentID), FOREIGN KEY(PersonID) REFERENCES User(PersonID));

#3.5 In table Company, the primary key is 'CompanyID'
CREATE TABLE Company (CompanyID INT NOT NULL, CompanyName VARCHAR(255), CompanyInf VARCHAR(255), 
	PRIMARY KEY(CompanyID));

#3.6 In table Employment_History, the primary key is 'EmploymentID', and two foreign key, 'PersonId' and 'CompanyID'
CREATE TABLE Employment_History (EmploymentID INT NOT NULL, PersonID INT NOT NULL, CompanyID INT NOT NULL, 
	WorkingField VARCHAR(100),Position VARCHAR(100), StartDate Date, EndDate Date, JobExp VARCHAR(255), 
	PRIMARY KEY(EmploymentID), FOREIGN KEY(PersonID) REFERENCES User(PersonID), 
	FOREIGN KEY(CompanyID) REFERENCES Company(CompanyID));

#If you want to drop the Table, please follow the order:
DROP Table Employment_History;
DROP TABLE Company;
DROP TABLE Comments;
DROP TABLE Employee;
DROP TABLE Talent;
DROP TABLE User;