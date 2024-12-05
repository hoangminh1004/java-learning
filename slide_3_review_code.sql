-- question2: lấy ra tất cả các phòng ban
SELECT *
FROM department d 
;
-- question3:lấy ra id của phòng ban "Sale"
SELECT department_id 
FROM department d 
WHERE department_name ="Sales"
;
-- quesstion4:lấy ra thông tin account có full nam dài nhất
SELECT *
FROM account a 
WHERE LENGTH (full_name) = (SELECT MAX(LENGTH(full_name)) FROM account)
;
-- question5:lấy ra thông tin account có full name dài nhất thuộc phòng ban
-- ó id=3
SELECT *
FROM account a2 
WHERE LENGTH (full_name ) = (SELECT MAX(LENGTH(full_name)) FROM account) and department_id =3
;
-- question6: lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT group_name 
FROM `group` g 
WHERE g.create_date < '2019-12-20'
;
-- question7:lấy ra ID của question có >=4 câu trả lời
-- SELECT * 
-- FROM question q 
-- WHERE
-- 
-- ; ctrl + /
-- question8:lấy ra các  mã đề thi có thời gian thi >=60 phút được ta trước ngày 20/12/2019
SELECT *
FROM exam e 
WHERE duration >=60 AND 
create_date < '2019-12-20'
;
-- question9: lấy ra 5 group được tạo gần đây nhất
SELECT *
FROM `group` g 
order by create_date  DESC 
limit 5
;
-- question10:đếm số nhân viên thuộc deparrtment có id=2
-- SELECT * 
-- count(department_id)=2
-- FROM account a 

SELECT COUNT(*) 
FROM account a 
WHERE a.department_id = 2

;
-- question11:lấy ra nhân viên có tên bắt đầu bằng chữ"D" và kết thúc bằng chữ "o"
SELECT *
FROM account a 
WHERE full_name LIKE "D%o"
;
-- question12:xóa tất cả các exam được tạo trước ngày 20/12/2019
SELECT * FROM exam e ;
DELETE FROM exam 
WHERE create_date <  '2019-12-20'
;
-- question13:xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
DELETE FROM question
WHERE content  LIKE "câu hỏi%"

-- question14:update thông tin của account có id=5 thành tên "Nguyễn Bá Lộc"và email thành loc.nguyenba@vti.com.vn
update account 
SET full_name = 'Nguyễn Bá Lộc', email = 'loc.nguyenba@vti.com.vn'
WHERE account_id =5

SELECT * FROM account a 
;
-- question 15: update account có id=5 sẽ thuộc group có id=4
update account 
SET 



