-- 1. AND条件、並べ替え
select *
from student
where grade=1 and hometown='東京'
order by student_id asc;

-- 2. OR条件、LIKE指定、並べ替え
select *
from student
where grade=1 or student_name like '%本'
order by student_id desc;


-- 3. GROUP_BY、MAX
select major_id, max(grade)
from student
group by major_id
order by major_id asc;


-- 4. GROUP_BY、COUNT、HAVING
select hometown, count(hometown)
from student
group by hometown
having count(hometown) >=2
order by hometown asc


-- 5. JOIN、並べ替え
select s.student_name, m.major_name
from student as s
join major as m
on s.major_id = m.major_id
order by m.major_name asc, s.student_name asc;


-- 6. JOIN、条件指定、並べ替え
select s.student_id, s.student_name, s.hometown, m.major_name
from student as s
join major as m
on s.major_id = m.major_id
where hometown  <> '東京'
order by m.major_name asc, s.student_id asc;


-- 7. サブクエリ-その1
select student_id, student_name,grade
from student
where major_id = (select major_id
                  from major
                  where major_name = '英文学' );



-- 8. サブクエリ-その2 IN
select student_id, student_name, major_id
from student
where major_id in ( select major_id
                    from student 
                    group by major_id
                    having count(major_id) >=3 )
order by major_id asc, student_id asc;



