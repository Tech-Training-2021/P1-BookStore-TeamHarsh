CREATE PROCEDURE UPDATEUSERDETAILS @userid int,@fname varchar(100),@lname varchar(100),@mobileNo varchar(13),@email varchar(50) as
begin
Update  [Book_Store].[dbo].[User] set FirstName=@fname,LastName=@lname,MobileNumber=@mobileNo,Email=@email where User_Id=@userid;
end
