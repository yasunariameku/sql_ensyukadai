-- 1. CREATE  "sales_old"という名前の下記のテーブルを作成してください。
create table sales_old(
sales_id int primary key 
,order_data date
,customer_id int not null references customer(customer_id)
,amount decimal);

-- 2. INSERT  sales_oldテーブルへ下記データを登録してください。
insert into sales_old
values
(6,'2018-09-02', 2, 20000)
,(7, '2018-09-02', 1, 5000)
,(8, '2018-09-02', 3, 6000)
,(9, '2018-09-05', 1, 3000);


-- 3. INSERT、SELECT   sales_oldテーブルのデータをsalesテーブルへ追加してください。
insert into sales
select * from sales_old;


-- 4. DROP   sales_oldテーブルを削除してください。
drop table sales_old;

-- 5. CASE WHEN、別名  salesテーブルに対して、order_dateが'2018/10/01'より前のデータが分かる印をつけたカラム(カラム名はis_old)を取得してください。
SELECT sales_id, order_data, 
  (CASE WHEN order_data < '2018-10-01' THEN '〇'  
        ELSE '' END) AS is_old 
FROM sales
order by order_data asc;


-- 6. 文字列結合、別名 
SELECT customer_id || ':' || customer_name AS customer_id_name 
FROM customer 
order by customer_id asc;


-- 7. LIMIT
select *
from sales
order by customer_id 
limit 2;



-- 8. GROUP BY、MIN、SUM、サブクエリ、別名
select min(order_data), sum(amount) as sum_amount
from sales
where order_data = (select min(order_data)
                    from sales);


-- 9. GROUP BY、JOIN、AVG、TRUNC、別名
select s.customer_id, customer_name, trunc(avg(amount)) as avg_amount
from sales as s
join customer as c 
on s.customer_id = c.customer_id
group by s.customer_id, customer_name
order by s.customer_id asc;


-- 10. BETWEEN、LIMIT、サブクエリ
select *
from sales
where sales_id = (select sales_id
                  from sales
                  where order_data between '2018-09-01'and '2018-09-30'
                  order by amount desc
                  limit 1);