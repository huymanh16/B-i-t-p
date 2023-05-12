CREATE DATABASE DBDESIGN_ONEMANY

USE DBDESIGN_ONEMANY
-- TABLE 1 TẠO TRƯỚC TABLE N TẠO SAU
Create table MajorsV1
(
MajorID char(2) Primary key,
MajorName nvarchar (40)Not null
)

Insert into MajorsV1 values('SE',  N'Kỹ thuật phần mềm')
Insert into MajorsV1 values('AI',  N'An toàn thông tin')
--Drop table MajorV1


Create table studentV1
(
StudentID  char(10)   NOT NULL , -- bắt buộc phải đưa data và không được trùng
FirstName  nvarchar(20) Not Null,  -- phải có data
LastName   nvarchar(20) Not Null,
DOB         datetime NULL	,
address nvarchar (50) NULL,

MID char(2) -- tên cột khóa ngoại /tham chiếu không cần trùng 1 -key
            -- Nhưng bắt buộc trùng 100% kiểu dữ liệu, cần tham chiếu

  CONSTRAINT PK_HOCSINH PRIMARY KEY (STUDENTID)
 )

 --Chèn data sinh viên
Insert into studentV1 values('SE1',  N'Nguyễn', N'Mạnh', Null , Null, 'SE')
Insert into studentV1 values('IA',  N'Lê', N'Hồng', Null, Null, 'AH')

Select *from studentV1
Select*from MajorsV1

-----------------------------------------------------

Create table MajorsV2
(
MajorID char(2) Primary key,
MajorName nvarchar (40)Not null
)
Insert into MajorsV2 values('SE',  N'Kỹ thuật phần mềm')
Insert into MajorsV2 values('AI',  N'An toàn thông tin')

Create table studentsV2
(
StudentID  char(10)   PRIMARY KEY , -- bắt buộc phải đưa data và không được trùng
FirstName  nvarchar(20) Not Null,  -- phải có data
LastName   nvarchar(20) Not Null,
DOB         datetime NULL	,
address nvarchar (50) NULL,
--MajorID char(2) REFERENCES MajorsV2(MajorID)
MajorID char(2) FOREIGN KEY  REFERENCES MajorsV2(MajorID)
 )

Insert into studentsV2 values('SE1',  N'Nguyễn', N'Mạnh', Null , Null, 'SE')
Insert into studentsV2 values('IA',  N'Lê', N'Hồng', Null, Null, 'AH')


Select *from studentsV2
Select*from MajorsV2


------------------------------------------
Create table MajorsV3
(
MajorID char(2) Primary key,
MajorName nvarchar (40)Not null
)

Create table studentsV3
(
StudentID  char(10)   PRIMARY KEY , -- bắt buộc phải đưa data và không được trùng
FirstName  nvarchar(20) Not Null,  -- phải có data
LastName   nvarchar(20) Not Null,
DOB         datetime NULL	,
address nvarchar (50) NULL,
--MajorID char(2) REFERENCES MajorsV2(MajorID)
MajorID char(2)
 CONSTRAINT FK_StudentV3_Major3 
           FOREIGN KEY(MajorID)  REFERENCES MajorsV3(MajorID)
 )

 -- TA CÓ QUYỀN GỠ MỘT RÀNG BUỘC ĐÃ THIẾT LẬP
 ALTER TABLE studentsV3 DROP CONSTRAINT FK_StudentV3_Major3
 -- ALTER TABLE StudentsV3 ADD CONSTRAINT PK_STUDENTSV3 PRIMARY KEY(STUDENTID)
 Alter table studentsV3 add constraint FK_studentV3_MajorV3
      FOREIGN KEY(MajorID) REFERENCES MajorsV3(MajorID)
	  --drop table studentsV3
Insert into studentsV3 values('IA',  N'Lê', N'Hồng', Null,NULL, 'SE')
Insert into studentsV3 values('HE',  N'Võ', N'Nguyễn', Null,NULL, Null)
Insert into studentsV3 values('BE',  N'Công', N'HE', Null,NULL, 'IA')

Insert into MajorsV3 values('SE',  N'Kỹ thuật phần mềm')
Insert into MajorsV3 values('IA',  N'Kỹ thuật phần mềm')
Insert into MajorsV3 values('BE',  N'Kỹ thuật phần mềm')



--Xóa một table 

delete from studentsV3 where StudentID='HE'
delete from MajorsV3 where MajorID ='HA'
delete from MajorsV3 where MajorID ='BE'



Update MajorsV3 SET MajorID ='AK' -- cẩn thận nếu k có WHERE, toàn bộ table sẽ bị ảnh hương
update MajorsV3 SET MajorID='AK' where MajorID='IA' 

delete from MajorsV3 where MajorID='BE' 
delete from MajorsV3 where MajorID='IA'

Select *from studentsV3
Select*from MajorsV3

ALTER table studentsV3 Drop constraint FK_studentV3_MajorV3

ALTER table studentsV3 add constraint FK_studentV3_MajorV3
           foreign key (majorID) references MajorsV3(majorID)
		   on delete cascade
		   on update cascade


update studentsV3 SET MajorID='SE' where StudentID='HE'
update studentsV3 SET MajorID='SE' where  MajorID is null 