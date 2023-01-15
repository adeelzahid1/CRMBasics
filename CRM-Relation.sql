create database CRMModel 
use CRMModel

create table CRMPerson(
	id int identity primary key,
	fname nvarchar(50),
	lname nvarchar(50),
	gender nvarchar(50),
	birth datetime,
	phone nvarchar(50),
	email nvarchar(150),
	[address] nvarchar(500),
	country nvarchar(50),
	province nvarchar(50),
	city nvarchar(50),
)

select * from CRMPerson
select * from CRMCompany

create table CRMCompany(
	c_id int identity primary key,
	name nvarchar(50),
	phone nvarchar(50),
	email nvarchar(50),
	registration datetime,
	companyType nvarchar(50),
	noEmp int,
	serviceOne nvarchar(50),
	serviceTwo nvarchar(50),
	serviceThree nvarchar(50),
	[address] nvarchar(500),
	country nvarchar(50),
	province nvarchar(50),
	city nvarchar(50)
)

create table Country(
id int identity primary key,
name nvarchar(50)
)


create table Province (
id int identity primary key,
p_name nvarchar(50),
C_id int foreign key references Country(id) 
)

create table City (
id int identity primary key,
c_name nvarchar(50),
p_id int foreign key references Province(id)
)

select * from Country
select * from Province
select * from City where p_id = 7

insert into Country values ('Pakistan')
insert into Country values ('India')
insert into Country values ('United Kingdom')
insert into Country values ('China')

insert into Province values ('Punjab',1)
insert into Province values ('Sindh',1)
insert into Province values ('Balochistan',1)
insert into Province values ('K-P-K',1)
insert into Province values ('Azad Kashmir',1)
insert into Province values ('Gilgit Baltistan',1)


insert into City values ('Lahore', 1)
insert into City values ('Faisalabad', 1)
insert into City values ('Rawalpindi', 1)
insert into City values ('Islamabad', 1)
insert into City values ('Multan', 1)

insert into City values ('Karachi', 2)
insert into City values ('Hyderabad', 2)
insert into City values ('Kotri', 2)
insert into City values ('Sakkhar', 2)
insert into City values ('Rohri', 2)

insert into City values ('Quetta',3)
insert into City values ('Gwadar',3)
insert into City values ('Pasheen',3)

insert into City values ('Peshawar',4)
insert into City values ('Attock',4)
insert into City values ('Naran',4)

insert into City values ('Muzafarabbad',5)
insert into City values ('Waddi e Neelam',5)

insert into City values ('Skardu', 6)
insert into City values ('Chilas', 6)
insert into City values ('Naltar Valley', 6)
insert into City values ('Pasu', 6)
insert into City values ('Asture', 6)

insert into Province values ('Scotland',3)
insert into Province values ('Northern Ireland',3)
insert into Province values ('Wales.',3)
insert into Province values ('West Midlands.',3)

insert into City values ('Glasgow',7)
insert into City values ('Paisley',7)
insert into City values ('Aberdeen',7)
insert into City values ('Livingston',7)

insert into City values ('Belfast',8)
insert into City values ('Derry',8)
insert into City values ('Greater Craigavon',8)
insert into City values ('Ballymena',8)


insert into City values ('Swansea',9)
insert into City values ('Cardiff',9)
insert into City values ('Newport',9)
insert into City values ('Wrexham',9)

insert into City values ('Dudley',10)
insert into City values ('Sandwell',10)
insert into City values ('Walsall',10)
insert into City values ('Solihull',10)

