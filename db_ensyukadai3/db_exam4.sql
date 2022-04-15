-- 1. インデックスの作成
create index major_name on major(major_name);
create index student_name on student(student_name);
create index grade_name on student(student_name, grade);


-- 2. ビューの作成
create view v_student as
select s.student_id, s.student_name, s.hometown, m.major_name
from student as s
join major as m
on s.major_id = m.major_id
where s.hometown != '東京'
order by m.major_name;

-- 3. マテリアルズド・ビュー
create materialized view v_materialized_student as
select s.student_id, s.student_name, s.hometown, m.major_name
from student as s
join major as m
on s.major_id = m.major_id
where s.hometown != '東京'
order by m.major_name;

-- 4. ファンクション function作成時は区切り文字の切り替えに気を付ける。
CREATE OR REPLACE FUNCTION tax_include(amount decimal) returns integer 
 LANGUAGE plpgsql
AS $function$
declare
begin
    return trunc(amount * 1.1, 0);
end
$function$;

select *, tax_include(amount)
from sales;

-- 5. シーケンス
ALTER SEQUENCE users_id_seq RESTART  WITH 101; 