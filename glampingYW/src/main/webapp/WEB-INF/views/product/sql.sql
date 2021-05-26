select * from tab;
select * from seq;

select * from room;
select * from seller;
select * from product;
select * from pphoto;
select * from member;
select * from notice;

insert into seller values('para','1111','최용욱','chyw','naver.com','010','1111','2222',
'094432','인천시 어쩌구 저쩌동',sysdate,sysdate,'102586','212155',0,'ho');

insert into seller values('pama','1111','최용욱','chyw','naver.com','010','1111','2222',
'094432','인천시 어쩌구 저쩌동',sysdate,sysdate,'102586','212155',0,'ho');

delete from product where sel_id = 'para';

select * from PRODUCT where pro_no = (select max(pro_no) from PRODUCT where sel_id = 'pama');