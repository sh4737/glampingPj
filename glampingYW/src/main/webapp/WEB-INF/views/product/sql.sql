select * from tab;
select * from seq;

select * from room;
select * from seller;
select * from product;

insert into seller values('para','1111','최용욱','chyw','naver.com','010','1111','2222',
'094432','인천시 어쩌구 저쩌동',sysdate,sysdate,'102586','212155',0,'ho');

delete from product where sel_id = 'para';