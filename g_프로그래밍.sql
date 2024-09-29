### sql 프로그래밍 언어 ###

use market_db;

select * from member;
select * from buy;

select @myVar1 = 5;
select @myVar2 = 4.25;

select @myVar1;
select @myVar1 + @myVar2;

select 
	mem_name
from
	member
where
	height >@height

