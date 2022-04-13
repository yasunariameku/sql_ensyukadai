1. データベース作成
postgres=> CREATE DATABASE db_exam;

2. テーブル作成-その1
create table major (
major_id int primary key
,major_name varchar(50))

3. テーブル作成-その2
create table student (
student_id int primary key
,student_name varchar(50)
,grade int
,hometown varchar(50)
,major_id int NOT NULL REFERENCES major(major_id)
);

4. "major"テーブルへデータ登録
insert into  major
db_exam-> values
db_exam-> (1, '英文学')
db_exam-> ,(2, '応用科学')
db_exam-> ,(3, '情報科学')
db_exam-> ,(4, '経済学')
db_exam-> ,(5, '国際文化');

5. "student"テーブルへデータ登録
insert into student
values
(1,'山田', 1, '宮城', 1)
,(2,'田中', 1, '東京', 2)
,(3,'佐藤', 1, '東京', 3)
,(4, '鈴木', 2, '鹿児島', 1)
,(5,'高橋', 2, '北海道', 2)
,(6, '吉田', 2, '東京', 1)
,(7,'伊藤', 3, '鹿児島', 2)
,(8,'山本', 3, '神奈川', 3)
,(9,'森本', 4, '沖縄', 4)
,(10,'吉岡', 4, '鹿児島', 5);

6. studentテーブル検索-その1 studentテーブルに対して、gradeが1のレコードを取得してください
select student_id, student_name,grade,hometown,major_id
from student
where grade = 1;

7. studentテーブル検索-その2 studentテーブルに対して、hometownが"東京"のレコードを取得してください
select * 
from student
where hometown = '東京';

8. majorテーブル検索 majorテーブル全レコードのmajor_nameのみを取得してください
select major_name
from major;

9. studentテーブルのレコード更新 studentテーブルに対して、student_idが10のレコードのgradeを3へ更新してください
update student
set grade =3
where student_id =10;

10. studentテーブルのレコード削除 studentテーブルに対して、student_idが10のレコードを削除してください
delete from student
where student_id = 10;


発展課題１

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











