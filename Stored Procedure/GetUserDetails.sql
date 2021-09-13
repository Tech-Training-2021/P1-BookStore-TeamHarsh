CREATE PROCEDURE GETUSERDETAILS @userid int as
begin 
select * from [Book_Store].[dbo].[User] where User_Id=@userid;
end

Exec GETUSERDETAILS @userid=12