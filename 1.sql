create table category(
	id int,
	name VARCHAR(20)
) default charset=utf8;


create table goods(
	id int,
	name VARCHAR(100),
	price  DECIMAL(11,2),
	shop VARCHAR(20)
) default charset=utf8;

DESC goods;

rename table goods to product;

create table students(
	id int unsigned auto_increment primary key,
	name VARCHAR(20),
	age TINYINT,
	mobile char(11)
) default charset=utf8;

alter table students add address VARCHAR(255);

desc students;

alter table students add addtime date after mobile;

alter table product change name title VARCHAR(100);
alter table product change title title VARCHAR(200);


alter table product drop shop;


drop table category;
drop table categories;

CREATE TABLE category(
cid int auto_increment primary key,
cname VARCHAR(29),
description VARCHAR(255)
)default charset=utf8;

insert into category values(null, '服饰', '秋冬5折')
insert into category(cid, cname) VALUES(null, '电器')
insert into category values (null, '玩具', '奥迪双转'), (null, '蔬菜', '新鲜蔬菜')
insert into category(cid, cname) values(null, '化妆品'),(null, '书籍'),(null, '运动')

update category set cname='家庭' where cid='1';



create table goods(
	id int auto_increment primary key,
	name varchar(80),
	price DECIMAL(11,2),
	score FLOAT(5,2),
	is_self enum('自营','非自营'),
	category_id int
) DEFAULT CHARSET=utf8;
 

insert into goods values(null, '华为Mate', 5490.00,9.70,'自营',1);
insert into goods values(null, '小米9', 2999.00,9.70,'自营',1);
insert into goods values(null, '荣耀80', 2999.00,9.50,'自营',1);
insert into goods values(null, '荣耀80', 2199.00,9.30,'非自营',1);
insert into goods values(null, '小米Note 11', 999.00,9.00,'自营',1);
insert into goods values(null, '联想小新', 5599.00,9.80,'非自营',2);
insert into goods values(null, '苹果Air15', 6699.00,9.90,'自营',2);
insert into goods values(null, '华为MateBook', 5490.00,9.20,'自营',2);
insert into goods values(null, '小米笔记本', 2999.00,9.70,'自营',2);
insert into goods values(null, 'ThinkPad', 2999.00,9.50,'自营',2);
insert into goods values(null, '雅诗兰黛', 999.00,9.10,'非自营',3);
insert into goods values(null, '兰蔻', 350.00,9.50,'自营',3);
insert into goods values(null, 'SK-II', 1999.00,9.50,'自营',3);


select * from goods;

select g.id, g.name, g.price from goods g;

select g.id g_id, g.name g_name, g.price g_price from goods g;

select * from goods where id=1;

SELECT * from goods where is_self='自营';

SELECT * from goods WHERE category_id=2 AND price>5000;

select * from goods WHERE category_id = 1 or category_id = 2;

select * from goods WHERE not(category_id=1);

select * from goods WHERE name like '华为%';

select * from goods WHERE name like '%粉底液';

select * from goods WHERE name like '%小%';

select * from goods WHERE name like '____';

select * from goods where score BETWEEN 9.50 and 9.70;

select * from goods where score in(9.50,9.70)
select * from goods where score=9.5 or score=9.7;

select * from goods where score is not NULL;
select * from goods where score is NULL;

select count(id) from goods;

select max(score) from goods;
select min(score) from goods;

select AVG(price) from goods;

select category_id from goods group by category_id;
select is_self from goods GROUP BY is_self;

select category_id, count(*) from goods group by category_id;

select category_id, is_self, COUNT(*) from goods GROUP BY category_id, is_self;
