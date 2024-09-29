### 스토어드 프로시저 예제 ###

# 1. case문 활용 

# 총 구매액
# 1500 이상 - 최우수 고객 
# 1000 이상 - 우수고객
# 1 ~ 999 - 일반 고객 
# 0 이하 (구매이력 없음) - 일반회원 

use market_db;
select * from buy;

select M.mem_id, M.mem_name, sum(price * amount) "총 구매액",
	case 
		when " 총 구매액 >= 1500 then '최우수 고객'
		when " 총 구매액 >= 1000 then '우수 고객'
		when " 총 구매액 >= 1 then '일반 고객'
        else 
			'일반 회원'
		end '회원 등급' 
        
	from member M
		left join buy B
        on B.mem_id = M.mem_id
	group by M.mem_id
    order by '총 구매액' desc;