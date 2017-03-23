# Date: 2017年3月22日
# Author： 马浩然
# Description： 创建三个表，分别是Talent， Company， Employment_History

CREATE DATABASE HRbase;

USE HRbase;

CREATE TABLE Talent (PersonID INT NOT NULL AUTO_INCREMENT, LastName VARCHAR(100) NOT NULL, FirstName VARCHAR(100) NOT NULL,
Age INT, LivingArea VARCHAR(100), CellPhone VARCHAR(25), EMail VARCHAR(100) NOT NULL, Major VARCHAR(100), Degree VARCHAR(100),
GraduteSchool VARCHAR(255), Citizen VARCHAR(25), Source VARCHAR(50), LinkedIn VARCHAR(255), ResumeLocation VARCHAR(255),
PRIMARY KEY(PersonID));

CREATE TABLE Company (CompanyID INT NOT NULL, CompanyName VARCHAR(255), CompanyInf VARCHAR(255), PRIMARY KEY(CompanyID));

CREATE TABLE Employment_History (EmploymentID INT NOT NULL, PersonID INT NOT NULL, CompanyID INT NOT NULL, JobField VARCHAR(100),
Position VARCHAR(100), StartDate Date, EndDate Date, JobExp VARCHAR(255), PRIMARY KEY(EmploymentID), 
FOREIGN KEY(PersonID) REFERENCES Talent(PersonID), FOREIGN KEY(CompanyID) REFERENCES Company(CompanyID));
