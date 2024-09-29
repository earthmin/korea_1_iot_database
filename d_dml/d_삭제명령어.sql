### d_삭제명령어 ###

# delete vs drop vs truncate # 

-- 공통점 
-- : 삭제를 담당하는 키워드 

-- 차이점
# 1) delete (DML)
# : 테이블의 틀은 남기면서 데이터를 삭제 - 적은 용량의 데이터 | 조건이 필요한 데이터

# 2) drop (DDL)
# : 테이블 자체를 삭제

# 3) truncate (DDL)
# : 테이블의 틀은 남기면서 데이터를 삭제 - 대용량의 삭제 student

create table big1(select * from `world`.`city`, `sakila`.`country`);
create table big2(select * from `world`.`city`, `sakila`.`country`);
create table big3(select * from `world`.`city`, `sakila`.`country`);

delete from big1;

select * from big1;

drop table big2;

-- select * from big2; >> 테이블 자체가 삭제가 되어서 실행이 안됨 

truncate table big3;
select * from big3; -- 테이블 형식은 남아있음 
