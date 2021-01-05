create table book_tbl(
	bcode number(5) primary key not null,
	btitle varchar2(30),
	bwriter varchar2(30),
	bpub number(4),
	bprice number(10) not null,
	bdate date
);

drop table book_tbl;

insert into BOOK_TBL values (10100, '자바킹', '강길동', 1001, 12000, '20201102');
insert into BOOK_TBL values (10101, '알고리즘', '남길동', 1002, 18000, '20200505');
insert into BOOK_TBL values (10102, '스프링두', '서길동', 1003, 23000, '20190803');
insert into BOOK_TBL values (10103, '파이썬', '홍길동', 1004, 9000, '20191011');

select * from BOOK_TBL order by bcode asc;

select max(bcode) from BOOK_TBL;

delete from BOOK_TBL where bcode = 12345;

update BOOK_TBL set bcode =  where bcode = ; 


