CREATE PROCEDURE AddUser @fname varchar(100),@lname varchar(100),@mobileNo varchar(13),@email varchar(50),@password varchar(100),@role_id int as
Insert into  [Book_Store].[dbo].[User](FirstName,LastName,MobileNumber,Email,Password,Role_Id) Values (@fname,@lname,@mobileNo,@email,@password,@role_id);

EXEC AddUser @fname='Harsh',@lname='Chheda',@mobileNo='+919326203404',@email='harshc3294@gmail.com',@password='21Abc@2000',@role_id=1

Select * from  [Book_Store].[dbo].[User];