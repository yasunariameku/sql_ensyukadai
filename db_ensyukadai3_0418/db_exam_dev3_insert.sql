-- データベース作成
create database ensyu0418;

-- companyテーブルの作成
create table company(
company_id int primary key 
,company_name varchar(30));

-- authorテーブルの作成
create table author(
author_id int primary key
,author_name varchar(30));

-- bookテーブルの作成
create table book(
book_id int primary key
,book_name varchar(30)
,price int
,publish_date date
,company_id int references company(company_id)
,author_id int references author(author_id));
