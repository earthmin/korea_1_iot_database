### 조인 (join) ###

## 외부조인 
# : 두 개 이상의 테이블을 연결할 때, 조인 조건에 맞지 않는 행도 포함하여 결과를 반환 
# > 한 쪽 테이블의 데이터가 없으면 null값이 반환 

# 외부 조인 
# left (outer) join, right (outer) join, full (outer) join

# 1. left join 
# : 왼쪽 테이블의 모든 행을 포함 
# : 오른쪽 테이블에서 일치하는 값이 없을 경우 null로 채움 

# 2. right join 
# : 오른쪽 테이블의 모든 행을 포함 
# : 왼쪽  테이블에서 일치하는 값이 없을 경우 null로 채움 

use `join`;

create table customer (
	customer_id int auto_increment primary key,
    name varchar(50)
);

create table orders (
	order_id int primary key,
    customer_id int,
    order_date date,
    foreign key (customer_id) references customer(customer_id)
);

insert into customer (name)
values
	('정재원'),
    ('황교동'),
    ('지마루');

insert into orders
values
	(101, 1, '2024-09-20'),
    (102, 2, '2024-09-26');

select 
	C.name, O.order_id, O.order_date
from 
	customer c 
    left outer join orders O
    on C.customer_id = O.customer_id;
    -- on 조건과 일치하는 데이터가 있으면 데이터 반환 
    -- , 없을 경우 null로 반환 
    
select 
	C.name, O.order_id, O.order_date
from 
	customer C
		right outer join orders O -- 오른쪽의 결합테이블의 모든 테이블을 반환 
        on C.customer_id = O.customer_id;
        
select 
	C.name 
    , count(O.order_id) as total_orders
    , max(O.order_date) as last_order_date
from 
	customer C
	left join orders O
    on C.customer_id = O.customer_id
group by C.name;