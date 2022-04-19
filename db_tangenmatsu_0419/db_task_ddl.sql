--演習課題 DDL
--単元末課題 DDL
create database db0419;


create table レシート(
伝票番号 int not null primary key
,店名_id int references 店名(id)
,日付 date
,レジ int
,責任者_No int
,支払方法_id int references 支払方法(id)
);


create table 会社(
id int primary key 
,会社名 varchar(20)
);


create table 店名(
id int primary key 
,会社_id int references 会社(id)
,店名 varchar(20)
,住所 varchar(20)
,電話番号 varchar(20)
);


create table 商品(
id int primary key 
,商品名 varchar(30)
,値段 int
,税率 decimal
);


create table 購入品(
id int primary key
,商品_id int references 商品(id)
,個数 int
,伝票 int references レシート(伝票番号)
);

create table 支払方法(
id int primary key
,支払方法 varchar(10)
);