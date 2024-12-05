-- question1: viết lệnh để lấy ra các danh sách nhân viên và thông thin phòng ban của họ
SELECT *
FROM account a 
join department d on a.department_id = d.department_id 
;
-- question2: viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT * 
FROM account a 
WHERE create_date < 2010-12-20
;
-- viết lệnh để lấy ra tất cả các developer
SELECT *
FROM account a 
join `position` p  on a.position_id = p.position_id 
WHERE p.position_name = "Dev";

-- question 4 : viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên

select *
from account a
where a.department_id in (select a.department_id
                          from account a
                          GROUP BY a.department_id
                          HAVING COUNT(a.department_id) >= 3
)
-- b1: lấy department_id trong bảng acccount khi gộp theo deprtment và đếm các bảng ghi departmen_id >=3
-- b2: lấy thông tin account theo department_id lấy được ở b1 

-- question5:viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT *
FROM question q 
WHERE q.type_id 

-- question7 thống kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT *
FROM question q 
right join question q2 on 
;
-- question 8: lấy ra Question có nhiều câu trả lời nhất
SELECT 
;
-- question9:thống kê lượng account trong mỗi group
SELECT *
FROM group_account ga 
join `group` g on ga.group_id =g.group_id 
group BY g.group_id 
ORDER BY g.group_id ASC 
;
-- question11: thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master,pm
SELECT *
FROM account a 
join department d on a.department_id = d.department_id 
GROUP BY d.department_id 
;
-- question12:12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của
-- question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...
SELECT *
FROM question q 
join category_question cq on q.question_id =cq.category_id 
JOIN type_question tq on q.type_id =tq.type_id 
JOIN account a on a.account_id =q.creator_id 
JOIN answer a2 on q.question_id = 

WHERE 
;
-- question 13:lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT * 
FROM question q 
WHERE q.type_id  in (select q.type_id 
                     from question q2
                      group by q.type_id
                   HAVING  COUNT(q.type_id)
)
;
-- question 14: lấy ra group không có account nào
SELECT *
FROM `group` g 
left join group_account ga on g.group_id = ga.group_id 
WHERE ga.group_id IS NULL 
;
-- question 15: giống 14
-- question 16: lấy ra question không có answer nào
SELECT *
FROM question q 
left join answer a on q.question_id = q.question_id 
WHERE q.question_id is null
;
-- question 17:a) Lấy các account thuộc nhóm thứ 1
-- b) Lấy các account thuộc nhóm thứ 2
-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT *
FROM group_account ga 
join group_account ga2 on account_id = ga2.account_id 
where ga2.group_id = 1
UNION 
SELECT *
FROM group_account ga 
join group_account ga2 on account_id = ga2.account_id 
where ga2.group_id = 2;

-- question 18:-- a lấy các group lơn hơn 5 thành viên
-- b lấy các grop có nhỏ hơn 7 thành viên
SELECT *
FROM group_account ga 
join `group` g on ga.group_id =g.group_id 
GROUP BY g.group_id 
HAVING COUNT(ga.group_id)>=5 
UNION 
SELECT *
FROM group_account ga 
join `group` g on ga.group_id =g.group_id 
GROUP BY g.group_id 
HAVING COUNT(ga.group_id)<=7

SELECT *
FROM account
