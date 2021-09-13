CREATE PROCEDURE loginuser @email varchar(50),@password varchar(100) as
begin
SET NOCOUNT ON
DECLARE @Userid INT;


select @Userid=User_Id from [Book_Store].[dbo].[User] where Email=@email and Password=@password

if @Userid is not null
begin
select @Userid
end 
else 
begin
select -1
end
end

EXEC loginuser @email='harshc3294@gmail.com',@password='21Abc@2000'