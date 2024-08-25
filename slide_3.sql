INSERT INTO account (accountEmail, accountUsername, accountFullname , 
departmentId , positionId , createDate)
values ("haipq3", "haipq3","haipq3",1, 1,1 ),
 ("hmm", "hmm","hmm",1, 1,1 ),
 ("abc", "abc3","abc",1, 1,1 ),
 ("ab3", "ab3","ab3",1, 1,1 ),
 ("vu", "vu","vu",1, 1,1 ),
 ("hoang", "hoang","hoang",1, 1,1 ),
 ("huy", "huy","huy",1, 1,1 ),
 ("linh", "linh","linh",1, 1,1 ),
 ("mai", "mai","mai",1, 1,1 ),
 ("alo", "alo","alo",1, 1,1 );

SELECT accountFullname
from account a 
order by LENGTH (accountUsername) DESC 
limit 1;

;

SELECT * from account a 
where a.accountFullname in 
(SELECT MAX(a.accountFullname) from account a 
group by a.accountFullname)


SELECT accountFullname
from account a 
WHERE accountId = 3;


INSERT INTO answer (content,questionId,iscorrect)
values ('hieu', 1, 1),
('hoang', 1, 1),
('lan', 1, 1);


INSERT INTO exam (code,title,duration,createDate)
values (1,"van",1,1),
(1,"van",1,1),
(1,"hung",1,1),
(1,"thhinh",1,1),
(1,"hien",1,1),
(1,"luong",1,1),
  (1,"long",1,1),    
(1,"tuan",1,1),
  (1,"xuan",1,1),      
   (1,"thu",1,1);  
   
INSERT INTO department (departmentName)
values ("sdad"),
("gfgfd"),
("jfgvb"),
("cvbcvb"),
("trỷt"),
("bvcbvc"),
("bvnbvn"),
("rtuert"),
("uvvcb"),
("ytrtry");




INSERT INTO categoryquestion (categoryName)
values ("ghhhg"),
("cvxbcvb"),
("fdscx"),
("cvbcv"),
("vcbbv"),
("aaa"),
("ggg"),
("jjjb"),
("llllb"),
("cvvvvb");

INSERT INTO question (content,createDate,typeId,categoryId,creatorId)
values ("tttt",2,2,2,2),
("vvv",2,2,2,2),
("nnt",2,2,2,2),
("it",2,2,2,2),
("hgcv",2,2,2,2),
("cxvcx",2,2,2,2),
("rellt",2,2,2,2),
("bull",2,2,2,2),
("golt",2,2,2,2),
("dog",2,2,2,2);

INSERT INTO `group` (groupName,creatorId,createDate)
values ("rewr",1,1),
("fdsfds",1,1),
("sdadsar",1,1),
("rdsar",1,1),
("rewr",1,1),
("refdf",1,1),
("rdcvcvr",1,1),
("recvbfghgr",1,1),
("rsdwer",1,1),
("opgnbr",1,1);
 
-- question6 : lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT *FROM  `group` g 
WHERE groupName >2019-12-20

-- question7: lấy ra ID của question có >=4 câu trả lời
SELECT * FROM question q 
WHERE questionId >=4

-- question 8: lấy ra các mã đè thi có thời gian thi >=60 phút dc tạo trước ngày 20/12/2019
SELECT * FROM 

-- question 9: lấy ra 5 group được tạo gần đây nhất 
SELECT *FROM `group` g 

-- question10: điểm số nhân viên thuộc department có id=2
SELECT *FROM department d 
WHERE departmentId =2

-- question 11:lấy ranhân viên có tên bắt đầu bằng chữ "D" & KẾT thúc bằng chữ "o"
SELECT * FROM account a 
WHERE accountFullname LIKE 'D%o';

-- question 12: xóa tất cả các exam được tạo trước ngày 20/12/2019

delete FROM exam 
WHERE createDate <'2019-12-20';

-- question13: xóa tất cả các question có nội dung bắt đầu bằng từ " câu hỏi"
DELETE FROM question 
WHERE content LIKE 'cauhoi%';


-- question 14:update thông tin của account có id=5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyen@vti.com.vn
update account 
SET accountUsername = "Nguyen Ba Loc",
accountEmail = "loc.nguyen@vti.com.vn"
WHERE accountId = 5;

-- question 15: update account có id=5 sẽ thuộc group có id =4
update account 
SET accountId =5
WHERE accountId =4;

SELECT *FROM account a 


