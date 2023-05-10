Create table student
(
StudentID  char(10),
FirstName  nvarchar(20),
LastName   nvarchar(20),
DOB         datetime,
address nvarchar (50)
)
Insert Into student(FirstName , LastName,StudentID) values(N'Quỳnh',N'Lê','PH99999')
Insert Into student(StudentID , LastName,FirstName) values('PH99999',N'Lê',N'Quỳnh')
Insert Into student values('PH18974', N'Võ',N'Minh','2023-5-9',null )
Insert Into student values('PH18974', N'Đỗ',N'An','2023-5-9',Null )
Insert Into student values('PH18974', N'Nguyễn',N'Hưng','2023-4-9',N'TP. Hà Nội' )
Insert Into student values('PH18974', N'Nguyễn',N'Mạnh','2023-5-9',N'TP. Hà Nội' )
Insert Into student values('PH18974', N'Nguyển',N'Dân','2023-6-9',N'TP. Hà Nội' )
Insert Into student(FirstName , LastName,StudentID) values(Null , Null ,Null)
Insert Into student(FirstName , LastName,StudentID) values(N'Vũ',N'Giang','PH99999')

select *from student

select *from student where StudentID='PH99999'


Drop table student

Create table studentV1
(
StudentID  char(10) Primary key,  -- bắt buộc phải đưa data và không được trùng
FirstName  nvarchar(20) Not Null,  -- phải có data
LastName   nvarchar(20) Not Null,
DOB         datetime,
address nvarchar (50)
)
INSERT Into studentV1 values('PH18974', N'Nguyễn',N'Mạnh','2023-5-9',N'TP. Hà Nội' )
--không chạy được vì chưa có dữ liệu
Insert Into studentV1(FirstName , LastName,StudentID) values(Null , Null ,Null)
--Đã chạy ok
Insert Into studentV1 (FirstName , LastName,StudentID) values('PH12345' , N'Công' ,N'Tuyết')
-- coi có được trùng tên hay không
INSERT Into studentV1 values('PH18974', N'Nguyễn',N'Mạnh','2023-5-9',N'TP. Hà Nội' )

select *from studentV1
