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


SELECT * FROM answer a 





select * FROM `group` g 


      

        
       