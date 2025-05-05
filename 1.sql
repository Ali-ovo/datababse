create table category (id int, name VARCHAR(20)) default charset = utf8;

create table goods (
    id int,
    name VARCHAR(100),
    price DECIMAL(11, 2),
    shop VARCHAR(20)
) default charset = utf8;

DESC goods;

rename table goods to product;

create table students (
    id int unsigned auto_increment primary key,
    name VARCHAR(20),
    age TINYINT,
    mobile char(11)
) default charset = utf8;

alter table students add address VARCHAR(255);

desc students;

alter table students add addtime date after mobile;

alter table product change name title VARCHAR(100);

alter table product change title title VARCHAR(200);

alter table product drop shop;

drop table category;

drop table categories;

CREATE TABLE category (
    cid int auto_increment primary key,
    cname VARCHAR(29),
    description VARCHAR(255)
) default charset = utf8;

insert into
    category
values (null, '服饰', '秋冬5折')
insert into
    category (cid, cname)
VALUES (null, '电器')
insert into
    category
values (null, '玩具', '奥迪双转'),
    (null, '蔬菜', '新鲜蔬菜')
insert into
    category (cid, cname)
values (null, '化妆品'),
    (null, '书籍'),
    (null, '运动')

update category set cname = '家庭' where cid = '1';

create table goods (
    id int auto_increment primary key,
    name varchar(80),
    price DECIMAL(11, 2),
    score FLOAT(5, 2),
    is_self enum('自营', '非自营'),
    category_id int
) DEFAULT CHARSET = utf8;

insert into goods values ( null, '华为Mate', 5490.00, 9.70, '自营', 1 );

insert into goods values ( null, '小米9', 2999.00, 9.70, '自营', 1 );

insert into goods values ( null, '荣耀80', 2999.00, 9.50, '自营', 1 );

insert into goods values ( null, '荣耀80', 2199.00, 9.30, '非自营', 1 );

insert into
    goods
values (
        null,
        '小米Note 11',
        999.00,
        9.00,
        '自营',
        1
    );

insert into goods values ( null, '联想小新', 5599.00, 9.80, '非自营', 2 );

insert into goods values ( null, '苹果Air15', 6699.00, 9.90, '自营', 2 );

insert into
    goods
values (
        null,
        '华为MateBook',
        5490.00,
        9.20,
        '自营',
        2
    );

insert into goods values ( null, '小米笔记本', 2999.00, 9.70, '自营', 2 );

insert into
    goods
values (
        null,
        'ThinkPad',
        2999.00,
        9.50,
        '自营',
        2
    );

insert into goods values ( null, '雅诗兰黛', 999.00, 9.10, '非自营', 3 );

insert into goods values ( null, '兰蔻', 350.00, 9.50, '自营', 3 );

insert into goods values ( null, 'SK-II', 1999.00, 9.50, '自营', 3 );

select * from goods;

select g.id, g.name, g.price from goods g;

select g.id g_id, g.name g_name, g.price g_price from goods g;

select * from goods where id = 1;

SELECT * from goods where is_self = '自营';

SELECT * from goods WHERE category_id = 2 AND price > 5000;

select * from goods WHERE category_id = 1 or category_id = 2;

select * from goods WHERE not(category_id = 1);

select * from goods WHERE name like '华为%';

select * from goods WHERE name like '%粉底液';

select * from goods WHERE name like '%小%';

select * from goods WHERE name like '____';

select * from goods where score BETWEEN 9.50 and 9.70;

select *
from goods
where
    score in (9.50, 9.70)
select *
from goods
where
    score = 9.5
    or score = 9.7;

select * from goods where score is not NULL;

select * from goods where score is NULL;

select count(id) from goods;

select max(score) from goods;

select min(score) from goods;

select AVG(price) from goods;

select category_id from goods group by category_id;

select is_self from goods GROUP BY is_self;

select category_id, count(*) from goods group by category_id;

select category_id, is_self, COUNT(*)
from goods
GROUP BY
    category_id,
    is_self;

SELECT * FROM goods where price > 5000;

SELECT * FROM goods HAVING price > 5000;

select category_id, AVG(price) as avg_p
from goods
group by
    category_id
HAVING
    avg_p < 2000;

SELECT * from goods order by score desc;

SELECT * from goods order by price;

SELECT * from goods order by score desc, price asc;

SELECT DISTINCT name from goods

SELECT DISTINCT name, price from goods

select * from goods limit 0, 4

select * from goods ORDER BY price desc LIMIT 1;

drop table category;

drop table product;

create table category (
    id int auto_increment,
    name VARCHAR(20),
    PRIMARY key (id)
) DEFAULT CHARSET = utf8;

CREATE TABLE products (
    id int auto_increment,
    title VARCHAR(255),
    price DECIMAL(11, 2),
    category_id int COMMENT '所属分类id',
    PRIMARY KEY (id),
    CONSTRAINT fk_products_category FOREIGN key (category_id) REFERENCES category (id)
) DEFAULT CHARSET = utf8;

INSERT into category VALUES (null, '手机');

INSERT into category VALUES (null, '电脑');

INSERT into products VALUES (null, '小米Note 8', 2499.00, 1);

INSERT into products VALUES (null, '华为Mate 60', 6999.00, 1);

INSERT into products VALUES (null, '联想小新', 4999.00, 2);

INSERT into products VALUES (null, '迪奥999', 799.00, 3);

CREATE table dage (
    id int auto_increment,
    name VARCHAR(20),
    PRIMARY key (id)
) DEFAULT CHARSET = utf8;

CREATE table xiaodi (
    id int auto_increment,
    name VARCHAR(20),
    dage_id int,
    PRIMARY key (id),
    CONSTRAINT fk_xiaodi_dage FOREIGN key (dage_id) REFERENCES dage (id) on delete CASCADE
) DEFAULT CHARSET = utf8;

INSERT INTO dage VALUES (null, '陈浩南');

INSERT INTO dage VALUES (null, '司徒南');

INSERT INTO xiaodi VALUES (null, '山鸡', 1);

INSERT INTO xiaodi VALUES (null, '天儿', 1);

INSERT INTO xiaodi VALUES (null, '司徒1', 2);

DELETE from dage where name = '司徒南';

INSERT INTO category VALUES (null, '化妆品');

SELECT * FROM category cross JOIN goods;

SELECT * FROM category, goods;

SELECT *
FROM category
    inner join goods on category.id = goods.category_id;

SELECT *
FROM goods
    inner join category on goods.category_id = category.id;

SELECT * from category, goods where category.id = goods.category_id;

SELECT * FROM category c join goods g on c.id = g.category_id;

SELECT * FROM category c LEFT JOIN goods g on c.id = g.category_id;

SELECT * from students UNION ALL SELECT * from students

create table areas (
    id char(6) PRIMARY key,
    title VARCHAR(20),
    pid char(6)
) DEFAULT charset = utf8;

select * from areas limit 10;

select
    p.id as province_id,
    p.title as province_name,
    c.id as city_id,
    c.title as city_name
from areas p
    join areas c on p.id = c.pid
WHERE
    p.title = '江苏省';

SELECT
    p.id as pid,
    p.title as province,
    c.id as cid,
    c.title as city,
    a.id as aid,
    a.title as area
from areas p
    join areas c on p.id = c.pid
    join areas a on c.id = a.pid
WHERE
    p.title = '重庆市';

create table `sales` (
    `month` int(11) not null,
    `revenue` decimal(10, 2) default null
) engine = innodb default charset = utf8;

insert into
    `sales`
values (1, 1000.00),
    (2, 800.00),
    (3, 1200.00),
    (4, 2000.00),
    (5, 1800.00),
    (6, 5000.00),
    (7, 3000.00),
    (8, 2500.00),
    (9, 1600.00),
    (10, 2200.00),
    (11, 900.00),
    (12, 4600.00);

select
    t1.`month` as current_month,
    t1.revenue as current_revenue,
    t2.`month` as prev_month,
    t2.revenue as prev_revenue,
    t1.revenue - t2.revenue as dirrerences
from sales t1
    join sales t2 on t1.month = t2.month + 1;

select a.month, SUM(b.revenue) as amount
from sales a
    join sales b on a.month >= b.month
GROUP BY
    a.month;

SELECT AVG(price) from goods;

SELECT * from goods where price > ( SELECT AVG(price) from goods );

SELECT * from goods where price = ( select MAX(price) from goods );

SELECT t2.id, t2.name, t1.`avg`
from (
        select category_id, AVG(price) as `avg`
        from goods
        GROUP BY
            category_id
    ) t1
    join category t2 on t1.category_id = t2.id;

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */

SET character_set_client = utf8mb4;

CREATE TABLE `students` (
    `ID` int(11) NOT NULL AUTO_INCREMENT,
    `Name` varchar(24) NOT NULL,
    `Gender` varchar(8) NOT NULL,
    `Score` decimal(5, 2) NOT NULL,
    PRIMARY KEY (`ID`)
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8;

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */

INSERT INTO
    `students`
VALUES (1, 'smart', 'Male', 90.00),
    (2, 'linda', 'Female', 81.00),
    (3, 'lucy', 'Female', 83.00),
    (4, 'david', 'Male', 94.00),
    (5, 'Tom', 'Male', 92.00),
    (6, 'Jack', 'Male', 88.00);
/*!40000 ALTER TABLE `students` ENABLE KEYS */

UNLOCK TABLES;

select AVG(score) from students;

select
    id,
    name,
    gender,
    score,
    (
        select AVG(score)
        from students
    ) as avg_score,
    score - (
        select AVG(score)
        from students
    ) as difference
from students;

select
    id,
    name,
    gender,
    score,
    avg(score) over () as `avg`,
    score - avg(score) over () as difference
from students;

select
    id,
    name,
    gender,
    score,
    sum(score) over () as `sum`,
    score / sum(score) over () as radio
from students;