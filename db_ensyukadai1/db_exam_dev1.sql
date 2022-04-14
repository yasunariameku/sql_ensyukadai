発展課題１

1. データベース作成
create database axiz_exam_dev;

2. テーブル作成-その1
create table customer(
customer_id int primary key
,customer_name varchar(50));

3. テーブル作成-その2
create table sales (
sales_id int primary key
,order_data date
,customer_id int not null references customer(customer_id)
,amount decimal);

4. "customer"テーブルへデータ登録
insert into customer
values
(1, '田中'),
(2, '鈴木'),
(3, '田中'),
(4, '田島');

5. "sales"テーブルへデータ登録
insert into sales
values
(1, '2018-11-01', 1, 3000),
(2, '2018-10-01', 3, 5000),
(3, '2018-10-01', 4, 6000),
(4, '2018-11-02', 2, 2000),
(5, '2018-11-15', 2, 3000);

6. salesテーブル検索-その1 salesテーブルに対して、amountが5000よりも小さいレコードを取得してください。
select * 
from sales
where amount < 5000;

7. salesテーブル検索-その2 salesテーブルに対して、amountが5000以上のレコードを取得してください。
select * 
from sales
where amount > 5000;

8. salesテーブル検索-その3 salesテーブルに対して、全てのカラムと、amountに「1.1」を掛けたカラムを取得してください。
select *, amount*1.1 
from sales;

9. salesテーブル検索-その4 salesテーブルに対して、amountが「NULL」でないレコードを取得してください。
select *  
from sales
where amount is not null;

10. customerテーブル検索-その1
select *
from customer
where customer_name <>'田中';

11. salesテーブルのレコード更新 salesテーブルに対して、sales_idが4のレコードの、order_dateを'2018/11/05'へ、customer_idを4へ更新してください。
update sales
set customer_id = 4, order_data='2018-11-05'
where sales_id = 4 ;

12. salesテーブルのレコード削除 salesテーブルに対して、amountが「NULL」のレコードを削除してください。
delete from sales
where amount = null;