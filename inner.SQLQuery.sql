Create Table VNDict

(
 Nmbr int,
 VNdect  Nvarchar(30)

)

Insert Into VNDict	Values (1, N'Một')
Insert Into VNDict  Values (2, N'Hai')
Insert Into VNDict  Values (3, N'Ba')
Insert Into VNDict  Values (4, N'Bốn')

--Drop table VNDict

select * from VNDict

Create Table EnDict

(
 Nmbr int,
 Endect  Nvarchar(30)

)

Insert Into EnDict values (1 , 'One')
Insert Into EnDict values (2, 'two')
Insert into EnDict values (3, 'three')
Insert into EnDict values (5, 'five')

select * from EnDict e
--  Drop table EnDict
select * from EnDict e , VNDict

select * from EnDict e , VNDict v where e.Nmbr  = v.Nmbr


Select * from EnDict e inner join VNDict v on e.Nmbr = v.Nmbr
select * from EnDict e , VNDict v where e.Nmbr  > v.Nmbr

select * from EnDict e inner join VNDict v on e.Nmbr = v.Nmbr

select * from EnDict e , VNDict v where e.Nmbr  != v.Nmbr

select * from EnDict e inner join VNDict v on e.Nmbr != v.Nmbr


use Query

select * from VNDict v, EnDict e where v.Nmbr = e.Nmbr

select * from VNDict v inner join EnDict e on v.Nmbr = e.Nmbr
            
select * from VNDict v join EnDict e on v.Nmbr = e.Nmbr

-- 3 câu tương đương kết quả với nhau

select * from VNDict , Endict

select * from VNDict 

select * from Endict

-- tui muốn lấy tiếng anh làm chuẩn , tìm các nghĩa tiêng việt tương đương
-- nếu không có tương đương cũng phải hiện ra

select * from  ENdict e left join VNdict v on e.Nmbr = v.Nmbr

select * from  ENdict e left outer join VNdict v on e.Nmbr = v.Nmbr

--Tui muốn lấy tiếng việt làm đầu

Select * from Vndict v left join ENdict e on v.Nmbr = e.Nmbr  

Select * from Vndict v Full join ENdict e on v.Nmbr = e.Nmbr
--thứ tự table không quan trọng

-- in ra bộ từ điển tiếng anh của những con số từ 3 trở lên

Select *from Vndict v full join ENdict e on v.Nmbr = e.Nmbr 
                            Where e.Nmbr  >= 3

							
Select *from Vndict v full join ENdict e on v.Nmbr = e.Nmbr 
                            Where e.Nmbr  >= 3