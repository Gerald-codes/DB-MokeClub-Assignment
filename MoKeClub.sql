USE master

IF EXISTS(select * from sys.databases where name='MokeClub')
DROP DATABASE MokeClub
GO

Create Database MokeClub
GO

use MokeClub
GO

/* Table: dbo.Customer */
if exists (select * from sysobjects 
  where id = object_id('dbo.Customer') and sysstat & 0xf = 3)
  drop table dbo.Customer
GO

/* Table: dbo.Applies_to */
if exists (select * from sysobjects 
  where id = object_id('dbo.Applies_to') and sysstat & 0xf = 3)
  drop table dbo.Applies_to
GO

/* Table: dbo.Booking */
if exists (select * from sysobjects 
  where id = object_id('dbo.Booking') and sysstat & 0xf = 3)
  drop table dbo.Booking
GO

/* Table: dbo.BookingRequirement */
if exists (select * from sysobjects 
  where id = object_id('dbo.BookingRequirement') and sysstat & 0xf = 3)
  drop table dbo.BookingRequirement
GO

/* Table: dbo.City */
if exists (select * from sysobjects 
  where id = object_id('dbo.City') and sysstat & 0xf = 3)
  drop table dbo.City
GO

/* Table: dbo.Country */
if exists (select * from sysobjects 
  where id = object_id('dbo.Country') and sysstat & 0xf = 3)
  drop table dbo.Country
GO

/* Table: dbo.Contacts */
if exists (select * from sysobjects 
  where id = object_id('dbo.Contacts') and sysstat & 0xf = 3)
  drop table dbo.Contacts
GO

/* Table: dbo.Enjoys */
if exists (select * from sysobjects 
  where id = object_id('dbo.Enjoys') and sysstat & 0xf = 3)
  drop table dbo.Enjoys
GO

/* Table: dbo.Flies_on */
if exists (select * from sysobjects 
  where id = object_id('dbo.Flies_on') and sysstat & 0xf = 3)
  drop table dbo.Flies_on
GO

/* Table: dbo.Flight */
if exists (select * from sysobjects 
  where id = object_id('dbo.Flights') and sysstat & 0xf = 3)
  drop table dbo.Flight
GO

/* Table: dbo.Hotel*/
if exists (select * from sysobjects 
  where id = object_id('dbo.Hotel') and sysstat & 0xf = 3)
  drop table dbo.Hotel
GO

/* Table: dbo.Itinerary */
if exists (select * from sysobjects 
  where id = object_id('dbo.Itinerary') and sysstat & 0xf = 3)
  drop table dbo.Itinerary
GO

/* Table: dbo.Passenger */
if exists (select * from sysobjects 
  where id = object_id('dbo.Passenger') and sysstat & 0xf = 3)
  drop table dbo.Passenger
GO

/* Table: dbo.Payment */
if exists (select * from sysobjects 
  where id = object_id('dbo.Payment') and sysstat & 0xf = 3)
  drop table dbo.Payment
GO


/* Table: dbo.Organiser */
if exists (select * from sysobjects 
  where id = object_id('dbo.Organiser') and sysstat & 0xf = 3)
  drop table dbo.Organiser
GO

/* Table: dbo.Promotion */
if exists (select * from sysobjects 
  where id = object_id('dbo.Promotion') and sysstat & 0xf = 3)
  drop table dbo.Promotion
GO

/* Table: dbo.RoomType */
if exists (select * from sysobjects 
  where id = object_id('dbo.RoomType') and sysstat & 0xf = 3)
  drop table dbo.RoomType
GO

/* Table: dbo.Sites */
if exists (select * from sysobjects 
  where id = object_id('dbo.Sites') and sysstat & 0xf = 3)
  drop table dbo.Sites
GO

/* Table: dbo.Staff */
if exists (select * from sysobjects 
  where id = object_id('dbo.Staff') and sysstat & 0xf = 3)
  drop table dbo.Staff
GO

/* Table: dbo.StayIn to */
if exists (select * from sysobjects 
  where id = object_id('dbo.StayIn') and sysstat & 0xf = 3)
  drop table dbo.StayIn
GO

/* Table: dbo.TourLeader */
if exists (select * from sysobjects 
  where id = object_id('dbo.TourLeader') and sysstat & 0xf = 3)
  drop table dbo.TourLeader
GO

/* Table: dbo.Travel_Advisor */
if exists (select * from sysobjects 
  where id = object_id('dbo.Travel_Advisor') and sysstat & 0xf = 3)
  drop table dbo.Travel_Advisor
GO

/* Table: dbo.Trip*/
if exists (select * from sysobjects 
  where id = object_id('dbo.Trip') and sysstat & 0xf = 3)
  drop table dbo.Trip
GO

/* Table: dbo.Visits */
if exists (select * from sysobjects 
  where id = object_id('dbo.Visits') and sysstat & 0xf = 3)
  drop table dbo.Visits
GO

CREATE TABLE Staff
(
	StaffID Char(5) Not Null,
	StaffName varchar(30) Not Null,
	CONSTRAINT PK_Staff PRIMARY KEY (StaffID)
)


Create Table Customer
(
	CustID char(5) Not Null,
	CustName varchar(50) Not Null,
	Constraint PK_Customer Primary Key (CustID)
)


Create table Organiser
(
	CustID Char(5) NOT NULL,
	CustContact Char(12) NOT NULL,
	CustEmail Varchar(80) NULL,
	CONSTRAINT PK_Organiser Primary Key(CustID),
	CONSTRAINT FK_CustID Foreign Key(CustID) REFERENCES Customer(CustID)
)

Create Table Promotion 
(
	PromoCode varchar(10) Not Null,
	Discount char(3) Not Null,
	PromoDesc varchar(100) Null,
	Constraint PK_Pomotion Primary Key(PromoCode)
)

CREATE TABLE Country
(
	CountryCode char(10) Not Null,
	CountryDesc varchar(100) Null,
	CONSTRAINT PK_Country PRIMARY KEY (CountryCode)
)

CREATE TABLE Itinerary
(
	ItineraryNo char(10) Not Null,
	Duration int Not Null,
	ItineraryDesc varchar(100) Null,
	CONSTRAINT PK_Itinerary PRIMARY KEY (ItineraryNo)
)

Create Table Enjoys 
(
	CustID char(5) Not Null,
	PromoCode varchar(10)  Not Null,
	Constraint PK_Enjoys Primary Key(PromoCode, CustID),
	Constraint Fk_PromoCode_Enjoys Foreign Key(PromoCode) References Promotion(PromoCode),
	Constraint Fk_CustID_Enjoys Foreign Key(CustID) References Customer(CustID)
)

CREATE TABLE City
(
	CityCode char(3) Not Null,
	CityDesc char(200) Null,
	CountryCode char(10) Not Null,
	CONSTRAINT PK_City PRIMARY KEY (CityCode),
	CONSTRAINT FK_City  FOREIGN KEY (CountryCode) REFERENCES Country(CountryCode)
)

CREATE TABLE Sites
(
	SiteID char(3) Not Null,
	SiteDesc char(200) Not Null,
	CityCode char(3) Not Null,
	CONSTRAINT PK_Site PRIMARY KEY (SiteID),
	CONSTRAINT FK_Site  FOREIGN KEY (CityCode) REFERENCES City(CityCode)
)

Create table RoomType
(
	RmTypeID char(6) not null,
	RmDesc varchar(100) null,
	Constraint PK_RoomType Primary Key(RmtypeID)
)

CREATE TABLE Hotel
(
	HotelID char(5) PRIMARY KEY,
	HotelName varchar(30) NOT NULL,
	HotelCategory varchar(25) NOT NULL
)

CREATE TABLE Flight (
	FlightNo char(5) PRIMARY KEY,
	Airline varchar(20) NOT NULL,
	FlightTime smalldatetime NOT NULL,
	Origin varchar(20) NOT NULL,
	Destination varchar(30) NOT NULL
)

CREATE TABLE Contacts
(
	StaffID char(5) not null,
	StaffContact char(10) not null,
	CONSTRAINT PK_Contacts PRIMARY KEY(StaffID, StaffContact),
	CONSTRAINT FK_Contacts FOREIGN KEY(StaffID) REFERENCES Staff(StaffID)
)

Create Table Travel_Advisor 
(
	StaffID char(5) not null,
	Constraint pk_Travel_Advisor Primary Key (StaffID),
	Constraint fk_StaffID_Travel_Advisor Foreign Key (StaffID) references Staff(StaffID)
)

CREATE TABLE TourLeader
(
	StaffID char(5) Not Null,
	LicenceNo char(10) Null,
	LicenceExpiryDate smalldatetime Null,
	CONSTRAINT PK_TourLeader PRIMARY KEY(StaffID),
	CONSTRAINT FK_TourLeader FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
)

create table Trip
(
	DepartureDate smalldatetime not null,
	ItineraryNo char(10) not null,
	DepartureTime time(0) not null,
	AdultPrice money not null,
	ChildPrice Money not null,
	MaxNoOfParticipants int null,
	StaffID char(5) not null,
	constraint PK_Trip Primary key(ItineraryNo, DepartureDate),
	constraint FK_Trip foreign key(ItineraryNo) references Itinerary(ItineraryNo),
	constraint FK_Trip2 foreign key(StaffID) references Staff(StaffID)
)

CREATE TABLE Visits
(
	ItineraryNo char(10) Not Null,
	SiteID char(3) Not Null,
	CONSTRAINT PK_Visits PRIMARY KEY (ItineraryNo, SiteID),
	CONSTRAINT FK_Visits FOREIGN KEY (ItineraryNo) REFERENCES Itinerary(ItineraryNo),
	CONSTRAINT FK_Visits2 FOREIGN KEY (SiteID) REFERENCES Sites(SiteID)
)

Create table Booking
(
	BookingNo char(10) not null,
	ItineraryNo char(10) not null,
	DepartureDate smalldatetime not null,
	BookingDate smalldatetime not null,
	StaffID char(5) not null,
	CustID char(5) not null,
	Constraint Booking_PK primary key(BookingNo),
	Constraint Booking_FK foreign key(ItineraryNo, DepartureDate) references Trip(ItineraryNo, DepartureDate),
	Constraint Booking_FK2 foreign key(StaffID) references Staff(StaffID),
	constraint Booking_FK3 foreign key(CustID) references Customer(CustID)
)

CREATE TABLE Payment
(
	PmtNo char(10) Not Null,
	PmtType char(1) Not Null,
	PmtMethod char(1) Not Null,
	PmtAmt Money Not Null,
	PmtDate date Not Null,
	ChequeNo int NULL,
	CreditCardNo char(16) Null,
	BookingNo Char(10) Not Null,
	CONSTRAINT PK_Payment PRIMARY KEY (PmtNo),
	Constraint FK_Payment_BookingNo Foreign Key(BookingNo) references Booking(BookingNo),
	CONSTRAINT CK_Payment_PmtType CHECK(PmtType in('D','B')),
	CONSTRAINT CK_Payment_PmtMethod CHECK(PmtMethod in('C','M','X'))
)

Create Table Passenger 
(
	CustID char(5)Not Null,
	BookingNo char(10) Not Null,
	Age int Not Null,
	Nationality char(15) Not Null,
	PassportNo char(10) Not Null,
	PassportExpiru date Not Null,
	PricePaid money Not Null,
	Constraint PK_Passenger Primary Key(CustID , BookingNo),
	Constraint FK_CustID_Passenger Foreign Key(CustID) references Customer(CustID),
	Constraint FK_BookingNo_Passenger Foreign Key(BookingNo) references Booking(BookingNo)
)

Create table BookingRequirement
(
	BookingNo char(10) not null,
	RmTypeID char(6) not null,
	NoOfRooms int null,
	NoOfExtraRooms int null,
	constraint PK_BookingRequirement Primary key(BookingNo, RmTypeID),
	constraint FK_BookingRequirement foreign key(BookingNo) references Booking(BookingNo),
	constraint FK_BookingRequirement2 foreign key(RmTypeID) references RoomType(RmTypeID)
)

CREATE TABLE Applies_to (
	 DepartureDate smalldatetime NOT NULL,
	 ItineraryNo char(10) NOT NULL,
	 PromoCode varchar(10) NOT NULL,
	 CONSTRAINT PK_Applies_to PRIMARY KEY (DepartureDate, ItineraryNo, PromoCode),
	 CONSTRAINT FK_DepartureDate FOREIGN KEY (ItineraryNo, DepartureDate) REFERENCES Trip(ItineraryNo, DepartureDate),
	 CONSTRAINT FK_PromoCode FOREIGN KEY (PromoCode) REFERENCES Promotion(PromoCode)
)

CREATE TABLE StayIn (
	HotelID char(5) NOT NULL,
	DepartureDate smalldatetime NOT NULL,
	ItineraryNo char(10) NOT NULL,
	CheckInDate smalldatetime NOT NULL,
	CheckOutDate smalldatetime NOT NULL,
	CONSTRAINT PK_StayIn PRIMARY KEY (HotelID, ItineraryNo, DepartureDate),
	 CONSTRAINT FK_DepartureDate2 FOREIGN KEY (ItineraryNo, DepartureDate) REFERENCES Trip(ItineraryNo, DepartureDate),
	CONSTRAINT FK_HotelID FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID),
)

CREATE TABLE Flies_on (
	FlightNo char(5) NOT NULL,
	DepartureDate smalldatetime NOT NULL,
	ItineraryNo char(10) NOT NULL,
	FlightDate smalldatetime NOT NULL,
	CONSTRAINT PK_Flies_on PRIMARY KEY (FlightNo,ItineraryNo, DepartureDate),
	CONSTRAINT FK_DepartureDate3 FOREIGN KEY (ItineraryNo, DepartureDate) REFERENCES Trip(ItineraryNo, DepartureDate),
	CONSTRAINT FK_FlightNo FOREIGN KEY (FlightNo) REFERENCES Flight(FlightNo)
)


Insert into Staff Values (12345,'Sam Tan')
Insert into Staff Values (12121,'William Wong')
Insert into Staff Values (09890,'Daniel Smith')
Insert into Staff Values (99500,'Sam Ooi')
Insert into Staff Values (22222,'John Lim')
Insert into Staff Values (55555,'Ong Mei Mei')
Insert into Staff Values (33333,'Simon Says')
Insert into Staff Values (44444,'Nina Gan')
Insert into Staff Values (40799,'Lim Jun Jie')
Insert into Staff Values (12800,'Joshua Wee')
Insert into Staff Values (45645,'Muthu Sami')
Insert into Staff Values (88788,'Muhammad Faizal')

Insert into TourLeader values(22222, 0064410935,'2022-01-17 00:00:00')
Insert into TourLeader values(33333, NULL, NULL)
Insert into TourLeader values(12800, 0385503822,'2025-07-14 00:00:00')
Insert into TourLeader values(55555, 0003247103,'2019-05-28 00:00:00')
Insert into TourLeader values(99500, 0153579264,'2022-08-08 00:00:00')

Insert into Customer Values (10100,'John Tan')
Insert into Customer Values (10101,'Simon Teo')
Insert into Customer Values (10102,'Chi Dan Gao')
Insert into Customer Values (10103,'Michelle Lim')
Insert into Customer Values (10104,'Muhammad Ali')
Insert into Customer Values (10105,'Nicole Chia')
Insert into Customer Values (10106,'Shanley Goh')
Insert into Customer Values (10107,'Malachi Sanchez')
Insert into Customer Values (10108,'Jerry Stephens')
Insert into Customer Values (10109,'Muhammad Syafiqah')
Insert into Customer Values (10110,'John Neo')
Insert into Customer Values (10111,'Jack White')
Insert into Customer Values (10112,'Bryan Du')
Insert into Customer Values (10113,'Jaxster Ng')
Insert into Customer Values (10114,'Clarissa liu')
Insert into Customer Values (10115,'Daryl liu')
Insert into Customer Values (10116,'Mark Liu')
Insert into Customer Values (10117,'Keith Lim')
Insert into Customer Values (10118,'Kris Lim')
Insert into Customer Values (10119,'Valencia Lim')
Insert into Customer Values (10120,'Bradley Walker')
Insert into Customer Values (10121,'Kenny Wilson')
Insert into Customer Values (10122,'Un Jung-Hyun')
Insert into Customer Values (10123,'Kang Min-Seo')
Insert into Customer Values (10124,'Hyung Joo-Won')
Insert into Customer Values (10125,'Troy Wiza')
Insert into Customer Values (10126,'Alan Lim')
Insert into Customer Values (10127,'Lee Ah Zhong')
Insert into Customer Values (10128,'Jackie Chan')
Insert into Customer Values (10129,'Miller Chia')
Insert into Customer Values (10130,'Charlie Yonex')

Insert into Organiser Values ('10100','95459385','Sk@gmail.com')
Insert into Organiser Values ('10101','83859583','abc@yahoo.com')
Insert into Organiser Values ('10102','94858343','holin@gmail.com')
Insert into Organiser Values ('10130','98423848','kolin223@gmail.com')
Insert into Organiser Values ('10104','93484449','linone09@hotmail.com')
Insert into Organiser Values ('10115','82554857','python@connect.np.edu.sg')
Insert into Organiser Values ('10129','81234567','csharp@gmail.com')
Insert into Organiser Values ('10117','90309900','sql009@yahoo.com')

Insert into Promotion Values ('10OFFNOW','10%','10% of total cost')
Insert into Promotion Values ('50OFFNOW','$50','Minus 50 dollars from total cost')
Insert into Promotion Values ('20COUPLE','20%','20% discount for customers who book couple package')

Insert into Enjoys Values (10103,'10OFFNOW')
Insert into Enjoys Values (10104,'50OFFNOW')
Insert into Enjoys Values (10114,'50OFFNOW')
Insert into Enjoys Values (10118,'20COUPLE')
Insert into Enjoys Values (10119,'20COUPLE')
Insert into Enjoys Values (10100,'50OFFNOW')
Insert into Enjoys Values (10102,'20COUPLE')
Insert into Enjoys Values (10115,'10OFFNOW')
Insert into Enjoys Values (10116,'10OFFNOW')


Insert into Itinerary Values ('C12345689D',10,'Visit to Moscow')
Insert into Itinerary Values ('A12345689B',9,'Iraq culture tour')
Insert into Itinerary Values ('A02345689B',7,'Fun Exploration in Norway')
Insert into Itinerary Values ('D12345689E',5,'Oman goodness')
Insert into Itinerary Values ('D12343689E',6,'Taiwan Adventure of Taipei 101')
Insert into Itinerary Values ('T12345689F',8,'Beijing China Feel the capital of china')
Insert into Itinerary Values ('T14345689F',9,'Fun in Australia')
Insert into Itinerary Values ('A14345689B',5,'Vegas Baby!')
Insert into Itinerary Values ('H14345669V',8,'Train to Busan')
Insert into Itinerary Values ('T12345349F',6,'Mumbai India')
Insert into Itinerary Values ('O14345689V',9,'North Korea')
Insert into Itinerary Values ('P14345689V',7,'Japan!')
Insert into Itinerary Values ('H14345467K',10,NULL)
Insert into Itinerary Values ('P14455467K',5,NULL)
Insert into Itinerary Values ('Y12321329P',8,NULL)

Insert into Trip Values ('2020-01-29','C12345689D','09:10:00',250.00,200.00,5,12345)
Insert into Trip Values ('2020-03-20','A12345689B','03:00:00',200.00,150.00,15,12121)
Insert into Trip Values ('2019-04-20','A02345689B','09:30:00',250.00,200.00,15,09890)
Insert into Trip Values ('2019-06-12','D12345689E','10:45:00',250.00,200.00,20,09890)
Insert into Trip Values ('2019-12-31','D12343689E','11:00:00',200.00,100.00,30,22222)
Insert into Trip Values ('2019-08-17','D12343689E','15:00:00',230.00,130.00,22,22222)
Insert into Trip Values ('2019-11-10','T12345689F','12:35:00',350.00,200.00,30,55555)
Insert into Trip Values ('2019-11-17','T14345689F','13:00:00',250.00,200.00,25,33333)
Insert into Trip Values ('2020-02-02','A14345689B','13:45:00',400.00,300.00,25,44444)
Insert into Trip Values ('2019-08-07','H14345669V','12:25:00',350.00,200.00,10,12345)
Insert into Trip Values ('2019-03-03','T12345349F','15:15:00',350.00,200.00,20,40799)
Insert into Trip Values ('2020-01-03','T12345349F','15:15:00',350.00,200.00,20,40799)
Insert into Trip Values ('2020-04-01','O14345689V','16:30:00',350.00,200.00,20,12800)
Insert into Trip Values ('2020-03-29','P14345689V','18:15:00',400.00,300.00,20,45645)
Insert into Trip Values ('2019-02-03','H14345467K','19:15:00',350.00,200.00,20,88788)
Insert into Trip Values ('2020-06-06','P14455467K','20:25:00',400.00,300.00,20,12121)
Insert into Trip Values ('2020-04-24','Y12321329P','20:50:00',500.00,400.00,15,22222)


Insert into Booking Values('T0123456CT','P14455467K','2020-06-06','2020-01-20',12345,10100)
Insert into Booking Values('T0123457FK','C12345689D','2020-01-29','2018-12-12',12121,10101)
Insert into Booking Values('T0123458XM','A12345689B','2020-03-20','2019-10-02',44444,10102)
Insert into Booking Values('T0123459GG','A02345689B','2019-04-20','2019-04-23',44444,10130)
Insert into Booking Values('T0123410WP','D12345689E','2019-06-12','2017-09-30',40799,10104)
Insert into Booking Values('T0123411BT','D12343689E','2019-08-17','2020-01-08',12345,10115)
Insert into Booking Values('T1234567OL','T12345689F','2019-11-10','2019-08-08',88788,10129)
Insert into Booking Values('T9876543BT','T14345689F','2019-11-17','2018-01-31',12345,10117)
Insert into Booking Values('T1201201WK','A14345689B','2020-02-02','2019-04-12',12121,10100)
Insert into Booking Values('T1000001WP','O14345689V','2020-04-01','2020-01-01',12121,10101)
Insert into Booking Values('T1202020FP','P14345689V','2020-03-29','2019-12-21',45645,10102)
Insert into Booking Values('T1004441WP','Y12321329P','2020-04-24','2019-07-08',12345,10102)

Insert into Country Values (368,'Iraq')
Insert into Country Values (578,'Norway')
Insert into Country Values (512,'Oman')
Insert into Country Values (356,'India')
Insert into Country Values (408,'North Korea')
Insert into Country Values (410,'South Korea')
Insert into Country Values (392,'Japan')
Insert into Country Values (036,'Australia')
Insert into Country Values (840,'United States of America')
Insert into Country Values (158,'Taiwan')
Insert into Country Values (643,'Russia')
Insert into Country Values (86,'China')

Insert into City Values (060,'Mosul, Iraq',368)
Insert into City Values (047,'Bergen, Norway',578)
Insert into City Values (012,'Muscat, Oman',512)
Insert into City Values (022,'Mumbai, India',356)
Insert into City Values (010,'Pyong Yang, North Korea',408)
Insert into City Values (029,'Busan, South Korea',410)
Insert into City Values (011,'Osaka, Japan',392)
Insert into City Values (001,'Melbourne, Australia',036)
Insert into City Values (004,'Las Vegas ,United States of America',840)
Insert into City Values (071,'Taipei, Taiwan',158)
Insert into City Values (098,'Moscow, Russia',643)
Insert into City Values (014,'Beijing, China', 86)
Insert into City Values (027,'Wuhan, China', 86)
Insert into City Values (072,'Taichung, China', 86)



Insert into Sites Values (125,'Mosul Grand Mosque',060)
Insert into Sites Values (433,'Modalen fjord cruise',047)
Insert into Sites Values (032,'Royal Opera House Muscat',012)
Insert into Sites Values (246,'Elephanta caves',022)
Insert into Sites Values (547,'Kim-ll Sung Square',010)
Insert into Sites Values (029,'Jagalchi Market',029)
Insert into Sites Values (789,'Universal Studio, Japan',011)
Insert into Sites Values (353,'Queen Victoria market',001)
Insert into Sites Values (771,'Las Vegas Strip',004)
Insert into Sites Values (654,'Taipei 101',071)
Insert into Sites Values (759,'Red Square',098)
Insert into Sites Values (465,'Forbidden City',014)

Insert into Visits Values ('A12345689B',125)
Insert into Visits Values ('A02345689B',433)
Insert into Visits Values('D12345689E',032)
Insert into Visits Values('T12345349F',246)
Insert into Visits Values('O14345689V',547)
Insert into Visits Values('H14345669V',029)
Insert into Visits Values('P14345689V',789)
Insert into Visits Values('T14345689F',353)
Insert into Visits Values('A14345689B',771)
Insert into Visits Values('D12343689E',654)
Insert into Visits Values('C12345689D',759)
Insert into Visits Values('T12345689F',465)


Insert into Travel_Advisor Values (12345)
Insert into Travel_Advisor Values (12121)
Insert into Travel_Advisor Values (09890)
Insert into Travel_Advisor Values (44444)
Insert into Travel_Advisor Values (40799)
Insert into Travel_Advisor Values (45645)
Insert into Travel_Advisor Values (88788)


Insert into Payment Values (1000000000,'D','C',1500.00,'15-Jan-2020',NULL,'1111111111111111','T0123456CT')
Insert into Payment Values (1000000001,'D','C',1900.00,'13-Jan-2020',NULL,1111111111111112,'T0123457FK')
Insert into Payment Values (1000000002,'B','M',2345.00,'01-Jul-2019',950020,NULL,'T0123458XM')
Insert into Payment Values (1000000003,'D','X',4000.00,'07-Jan-2020',NULL,NULL,'T0123459GG')
Insert into Payment Values (1000000004,'B','M',1400.00,'07-Dec-2019',566620,NULL,'T0123410WP')
Insert into Payment Values (1000000005,'B','X',2000.00,'07-Jan-2020',NULL,NULL,'T0123411BT')
Insert into Payment Values (1000000006,'B','C',4300.00,'17-Oct-2019',NULL,1111111111111113,'T1234567OL')
Insert into Payment Values (1000000007,'D','X',750.00,'07-Feb-2018',NULL,NULL,'T9876543BT')
Insert into Payment Values (1000000008,'D','C',500.00,'12-Aug-2019',NULL,1111111111111114,'T1201201WK')
Insert into Payment Values (1000000011,'B','C',1660.00,'03-Jan-2020',NULL,1111111111111117,'T1000001WP')
Insert into Payment Values (1000000012,'D','X',890.00,'27-Jan-2020',NULL,NULL,'T1202020FP')
Insert into Payment Values (1000000013,'D','C',1005.00,'11-Jan-2020',NULL,1111111111111118,'T1004441WP')

Insert into Contacts Values(12345,'9765 4321')
Insert into Contacts Values(22222,'9555 5089')
Insert into Contacts Values(33333,'9765 4322')
Insert into Contacts Values(12121,'6778 5689')
Insert into Contacts Values(44444,'9789 4569')
Insert into Contacts Values(09890,'8888 8888')
Insert into Contacts Values(99500,'8338 4561')
Insert into Contacts Values(40799,'9988 8899')
Insert into Contacts Values(12800,'8756 2233')
Insert into Contacts Values(45645,'8667 8598')
Insert into Contacts Values(88788,'8768 9076')
Insert into Contacts Values(55555,'9732 2373')
Insert into Contacts Values(09890,'6561 4108')
Insert into Contacts Values(44444,'9739 5555')
Insert into Contacts Values(33333,'9730 9325')
Insert into Contacts Values(12345,'6432 4921')

Insert into Hotel Values ('CN111','Pacific Hotel','Budget Hotel')
Insert into Hotel Values ('LV222','Golden Sea Resort','Luxury Hotel')
Insert into Hotel Values ('CN333','Great Chance Hotel','Budget Hotel')
Insert into Hotel Values ('TH101','Beauty Hotel','Family Hotel')
Insert into Hotel Values ('TK110','Chicken Hotel','Budget Hotel')
Insert into Hotel Values ('KR132','Tomorrow Hotel','Family Hotel')
Insert into Hotel Values ('JP123','Today Resort','Family Hotel')
Insert into Hotel Values ('JP101','Beachside Resort','Vacation resort')
Insert into Hotel Values ('CN444','Number 1 Hotel','Luxury Hotel')
Insert into Hotel Values ('KR111','Real Hotel','Budget Hotel')

Insert into StayIn Values ('CN111','2019-03-03','T12345349F','2019-03-04 12:00:00','2019-03-05 10:00:00')
Insert into StayIn Values ('LV222','2020-04-01','O14345689V','2020-04-03 10:45:00','2020-04-05 09:30:00')
Insert into StayIn Values ('TH101','2020-06-06','P14455467K','2020-06-09 20:00:00','2020-06-10 10:00:00')
Insert into StayIn Values ('TK110','2020-02-02','A14345689B','2020-02-04 23:00:00','2020-02-06 08:00:00')
Insert into StayIn Values ('KR132','2019-12-31','D12343689E','2020-02-20 23:30:00','2020-02-23 23:30:00')
Insert into StayIn Values ('JP123','2019-11-10','T12345689F','2020-03-21 10:00:00','2020-03-26 10:00:00')
Insert into StayIn Values ('JP101','2019-11-17','T14345689F','2020-02-04 13:00:00','2020-02-08 13:00:00')
Insert into StayIn Values ('JP123','2019-08-07','H14345669V','2020-02-16 16:00:00','2020-02-26 16:00:00')
Insert into StayIn Values ('JP101','2020-01-03','T12345349F','2020-03-14 18:00:00','2020-03-16 18:00:00')
Insert into StayIn Values ('CN444','2020-04-01','O14345689V','2020-04-01 00:00:00','2020-04-04 00:00:00')
Insert into StayIn Values ('KR111','2020-03-29','P14345689V','2020-03-12 01:00:00','2020-03-18 01:00:00')



Insert into Flight Values ('SQ123','Singapore','Singapore','2020-04-01 14:50:00','China')
Insert into Flight Values ('AK147','Air Asia','Singapore','2020-03-29 00:25:00','Thailand')
Insert into Flight Values ('MH370','Malaysia','Singapore','2020-01-29 17:45:00','China')
Insert into Flight Values ('TK111','Turkish','Singapore','2020-02-04 13:30:00','Turkey')
Insert into Flight Values ('JL101','Japan','Singapore','2020-05-16 21:45:00','Japan')
Insert into Flight Values ('CH190','China','Singapore','2020-03-20 04:45:00','China')
Insert into Flight Values ('CH132','China','Singapore','2020-04-01 18:50:00','Korea')
Insert into Flight Values ('SQ242','Singapore','Singapore','2020-04-07 22:40:00','India')
Insert into Flight Values ('SC532','Scoot','Singapore','2020-05-12 00:20:00','Australia')
Insert into Flight Values ('SQ980','Singapore','Singapore','2020-04-21 18:00:00','Taiwan')
Insert into Flight Values ('JS234','Jetstar','Singapore','2020-04-11 13:50:00','Iraq')
Insert into Flight Values ('CN182','China','Beijing, China','2020-03-12 19:00:00','Wuhan, China')
Insert into Flight Values ('SA800','Singapore','Singapore','2020-02-28 01:00:00','Las Vegas, USA')
Insert into Flight Values ('KA101','Korea','Singapore','2020-05-12 04:20:00','Pyong Yang, North Korea')
Insert into Flight Values ('JS555','Jetstar','Singapore','2020-04-18 06:10:00','Russia')

Insert into RoomType Values ('family','30 Sqft Room with 2 king-size beds that can accommodate up to 4 people.')
Insert into RoomType Values ('couple','18 Sqft Room with a king-size bed that can accommodate up to 2 people. Suitable for couples.')
Insert into RoomType Values ('single','12 Sqft room with a single bed that accommodates 1 person.')
Insert into RoomType Values ('dousin','18 Sqft Room with 2 single beds that accommodate 2 people.')
Insert into RoomType Values ('trios','22 Sqft room with a king-size bed and single bed that can accommodate up to 3 people.')

Insert into Applies_to Values ('A02345689B','2019-04-20','10OFFNOW')
Insert into Applies_to Values ('D12345689E','2019-06-12','50OFFNOW')
Insert into Applies_to Values ('A12345689B','2020-03-20','20COUPLE')
Insert into Applies_to Values ('T12345689F','2019-11-10','10OFFNOW')
Insert into Applies_to Values ('T14345689F','2019-11-17','50OFFNOW')
Insert into Applies_to Values ('P14455467K','2020-06-06','50OFFNOW')
Insert into Applies_to Values ('D12343689E','2019-08-17','10OFFNOW')
Insert into Applies_to Values ('A14345689B','2020-02-02','20COUPLE')
Insert into Applies_to Values ('H14345669V','2019-08-07','20COUPLE')
	
Insert into BookingRequirement Values ('T0123456CT','single',2,NULL)
Insert into BookingRequirement Values ('T0123457FK','dousin',1,NULL)
Insert into BookingRequirement Values ('T0123458XM','family',1,NULL)
Insert into BookingRequirement Values ('T0123459GG','single',2,1)
Insert into BookingRequirement Values ('T0123459GG','dousin',1,NULL)
Insert into BookingRequirement Values ('T0123410WP','trios',2,NULL)
Insert into BookingRequirement Values ('T0123411BT','dousin',2,NULL)
Insert into BookingRequirement Values ('T0123411BT','family',1,NULL)
Insert into BookingRequirement Values ('T1234567OL','couple',1,NULL)
Insert into BookingRequirement Values ('T9876543BT','couple',2,1)
Insert into BookingRequirement Values ('T9876543BT','single',4,2)
Insert into BookingRequirement Values ('T1201201WK','family',1,NULL)


Insert into Passenger values(10100,'T0123456CT',25,'China','E15158900K','2027-06-30',240.00)
Insert into Passenger values(10101,'T0123457FK',40,'French','E40799006F','2024-11-14',512.50)
Insert into Passenger values(10102,'T0123458XM',21,'German','G10249503B','2029-05-04',188.00)
Insert into Passenger values(10130,'T0123459GG',38,'Singaporean','S32053302A','2022-02-28',260.00)
Insert into Passenger values(10104,'T0123411BT',37,'Singaporean','S43593459L','2019-05-30',420.20)
Insert into Passenger values(10115,'T1234567OL',22,'Singaporean','S20349234F','2018-04-12',200.10)
Insert into Passenger values(10129,'T9876543BT',26,'Malaysian','P23402323K','2020-01-05',280.00)
Insert into Passenger values(10117,'T1201201WK',19,'Singaporean','S2046940K','2023-04-22',402.00)
Insert into Passenger values(10104,'T0123410WP',55,'Malaysian','P10307651A','2023-01-22',358.00)

Insert into Flies_on Values ('SQ123','2019-11-10','T12345689F','2020-04-01 14:50:00')
Insert into Flies_on Values ('CH190','2019-11-10','T12345689F','2020-03-20 04:45:00')
Insert into Flies_on Values ('CH132','2019-08-07','H14345669V','2020-06-01 08:35:00')
Insert into Flies_on Values ('SC532','2020-03-29','P14345689V','2020-05-12 00:20:00')
Insert into Flies_on Values ('SQ980','2019-02-03','H14345467K','2020-04-21 18:00:00')
Insert into Flies_on Values ('CN182','2020-01-29','C12345689D','2020-03-12 19:00:00')
Insert into Flies_on Values ('SA800','2020-02-02','A14345689B','2020-02-27 01:00:00')
Insert into Flies_on Values ('KA101','2020-04-01','O14345689V','2020-05-12 04:20:00')
Insert into Flies_on Values ('JS234','2020-03-20','A12345689B','2020-04-11 13:50:00')