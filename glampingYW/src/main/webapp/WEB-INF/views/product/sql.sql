select * from tab;
select * from seq;

select * from seller;
select * from product;
select * from pphoto;
select * from room;
select * from rphoto;
select * from reservation;
select * from review;
select * from member;


insert into seller values('para','1111','최용욱','chyw','naver.com','010','1111','2222',
'094432','인천시 어쩌구 저쩌동',sysdate,sysdate,'102586','212155',0,'ho');

insert into seller values('pama','1111','최용욱','chyw','naver.com','010','1111','2222',
'094432','인천시 어쩌구 저쩌동',sysdate,sysdate,'102586','212155',0,'ho');

delete from product;
delete from product where sel_id = 'pama';
delete from product where pro_ceo = '오사장';
delete from product;
delete from pphoto;
delete from pphoto where pro_no = 106;
delete from room;
delete from rphoto;
delete from reservation;
delete from review;


select * from PRODUCT where pro_no = (select max(pro_no) from PRODUCT where sel_id = 'pama');



select * from room where rm_no = (select max(rm_no) from (select * from room where pro_no = 97) where rm_price = (select min(rm_price) from room where pro_no = 97));


select nvl(avg(rev_star),0) from review where pro_no = 108;
select count(rev_no) from review where pro_no = 108;