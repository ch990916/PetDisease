create table petdisease_member(
<<<<<<< HEAD
	pm_id varchar2(10 char) primary key,
	pm_pw varchar2(10 char) not null,
	pm_nickname varchar2(10 char) not null,
=======
	pm_id varchar2(20 char) primary key,
	pm_pw varchar2(20 char) not null,
	pm_nickname varchar2(20 char) not null,
>>>>>>> origin/branch_JinMyeong
	pm_address varchar2(300 char) not null,
	pm_birthday date not null,
	pm_photo varchar2(300 char) not null,
	pm_mail varchar2(300 char) not null,
	pm_admin number(2) not null
);

<<<<<<< HEAD
create table petdisease_notice(
	pn_no number(8) primary key,
	pn_title varchar(100 char) not null,
	pn_writer varchar2(10 char) not null,
	pn_content varchar2(500 char) not null,
	pn_date date not null,
	constraint notice_writer
		foreign key(pn_writer) references petdisease_member(pm_id)
=======
create table petdisease_post(
	pp_no number(8) primary key,
	pp_content varchar(200 char),
	pp_writer varchar2(10 char) not null,
	pp_picture varchar2(500 char) not null,
	pp_date date not null,
	constraint writer
		foreign key(pp_writer) references petdisease_member(pm_id)
>>>>>>> origin/branch_JinMyeong
);

create table petdisease_reply(
	pr_no number(10) primary key,
	pr_pp_no number(8) not null,
	pr_writer varchar2(10 char) not null,
	pr_content varchar(200 char) not null,
	pr_date date not null,
	constraint reply_writer
		foreign key(pr_writer) references petdisease_member(pm_id),
	constraint reply
		foreign key(pr_pp_no) references petdisease_post(pp_no)
		on delete cascade	
);

<<<<<<< HEAD
create table homepetcare_dataroom(
	hd_title varchar2(30 char) primary key,
	hd_uploader varchar2(10 char) not null,
	hd_file varchar2(100char) not null,
	hd_date date not null
);

create sequence petdisease_notice_seq;
create sequence homepetcare_post_reply_seq;
=======
create sequence petdisease_post_seq;
create sequence petdisease_reply_seq;
>>>>>>> origin/branch_JinMyeong


drop table homepetcare_member;

select * from petdisease_member;

select *
from (
	select *
	from (
		select rownum as rn, hp_no, hp_title, hp_content, hp_date, hp_writer
		from (
			select *
			from homepetcare_post
			where hp_title like '%%' or hp_writer like '%%'
			order by hp_date desc
		)
	)
	where rn>=1 and rn<=10
), (
	select hm_id, hm_photo
	from homepetcare_member
	where hm_id in (
		select hp_writer
		from (
			select rownum as rn, hp_writer
			from(
				select hp_writer
				from homepetcare_post
				where hp_title like '%%' or hp_writer like '%%'
				order by hp_date desc
			)
		)
		where rn >= 1 and rn <= 10
	)
)
where hm_id=hp_writer;

select * from petdisease_member;

update petdisease_member set pm_admin=0 where pm_id='asdf1234';

select * from petdisease_notice, (select pm_nickname from petdisease_member
where pm_id = (select pn_writer from petdisease_notice
where pn_no=1))
where pn_no=1







select * from petdisease_notice;
select * from petdisease_post;
select * from petdisease_reply;

create table petdisease_post
