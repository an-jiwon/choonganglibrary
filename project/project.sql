select * from tab;
Rename board To board2;
select * from member;
select * from board;
select * from reply;

select  a.*
		   from (select * from checkout where book_id=1 order by checkout_date desc) a where rownum=1;
		   

 alter index SCOTT.SYS_C007116 rebuild;
 
alter table book modify (book_index clob);
alter table member modify (addr1 varchar2(100));
ALTER TABLE reserve ADD (reserve_date date NOT NULL);

alter table board modify(title varchar2(200));
		   select * from checkout where id='k1';

		   select * from reserve;

create table admin (
	adminid varchar2(20) primary key,
	adminpass varchar2(20) not null
);

insert into admin values ('admin','0000');
select * from book;
select * from CHECKOUT;


create table member (
	id varchar2(20) primary key,
	pass varchar2(20) not null,
	name varchar2(20) not null,
	birth date,
	email varchar2(50),
	phone varchar2(50) not null,
	zipcode varchar2(10) not null,
	addr1 varchar2(50) not null,
	addr2 varchar2(50) not null,
	joindate date
);

drop table book;
Rename book to book2;

create table book (
	book_id number primary key,
	title varchar2(200) not null,
	category varchar2(20) not null,
	author varchar2(100) not null,
	company varchar2(100) not null,
	book_public date,
	area varchar2(50) not null,
	giho varchar2(50) not null,
	state varchar2(50),
	book_index clob not null,
	image varchar2(50)
);
select book.title, over.reserve_date,over.reserve_ok from book,(select a.*, rownum rn
		   from (select * from reserve order by reserve_date desc) a) over
		   where id ='k2' and rn between 1 and 10 and book.book_id = over.book_id;

		   select * from (select a.*, rownum rn
		   from (select * from board where writer='k2' order by board_date desc) a)
		   where rn between 1 and 5;
		   select * from board where writer='k2';
		   
select * from checkOut;
alter table reserve modify(reserve_ok varchar2(10));
alter table reserve add(reserve_date date);
select * from book order by book_id;
select * from CHECKOUT;
select * from reserve;

create table checkOut (
	book_id number,
	id varchar2(20),
	checkout_date date,
	checkin_date date,
	check_ok varchar2(10),
	constraint fk_checkOut1 foreign key(book_id) references book(book_id),
	constraint fk_checkOut2 foreign key(id) references member(id)
);

delete from reserve where id='k2';

create table reserve (
	book_id number,
	id varchar2(20),
	reserve_ok varchar2(10),
	reserve_date date,
	constraint fk_reserve1 foreign key(book_id) references book(book_id),
	constraint fk_reserve2 foreign key(id) references member(id)
);

drop table board;



create table board (
	num number primary key,
	category varchar2(50) not null,
	title varchar2(100) not null,
	writer varchar2(20) not null,
	board_main long not null,
	board_file varchar2(100),
	board_date date,
	board_view number
);


create table reply (
	num number primary key,
	reply_num number,
	main varchar2(1000) not null,
	reply_date date,
	reply_update date,
	hide varchar2(5),
	writer varchar2(20)
);


select * from reply;

create table NRBoard(
	num number primary key,
	category varchar2(50) not null,
	title varchar2(100) not null,
	writer varchar2(50) not null,
	main long not null,
	NRBoard_file varchar2(100),
	nr_date date,
	nr_view number
);
update seat set seatCheck='n' where seatnum=5;
select * from seat;


create table seat (
	seatnum number primary key,
	id varchar2(20),
	seatCheck varchar2(5),
	seatIn date,
	seatOut date
);


create table myseat (
	seatnum number,
	id varchar2(20),
	seatIn date,
	seatOut date,
	constraint fk_myseat1 foreign key(seatnum) references seat(seatnum),
	constraint fk_myseat2 foreign key(id) references member(id)
);

select * from book;
select * from seat;
insert into member values('aa','aa','name','2016-05-13','kk@kk','010-0101-0101','001-020','dg','dg',sysdate);

insert into member values ('bb','bb','cc','2016-05-13','asidj@asd','010-0110-0101','486-482','adhw','ahfu3hr',sysdate);
select * from seat; 
select * from myseat;



