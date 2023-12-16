create table petdisease_member(
	pm_id varchar2(20 char) primary key,
	pm_pw varchar2(20 char) not null,
	pm_nickname varchar2(20 char) not null,
	pm_address varchar2(300 char) not null,
	pm_birthday date not null,
	pm_photo varchar2(300 char) not null,
	pm_mail varchar2(300 char) not null,
	pm_admin number(2) not null
);

create table petdisease_post(
	pp_no number(8) primary key,
	pp_content varchar(200 char),
	pp_writer varchar2(10 char) not null,
	pp_picture varchar2(500 char) not null,
	pp_date date not null,
	constraint writer
		foreign key(pp_writer) references petdisease_member(pm_id)
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

create sequence petdisease_post_seq;
create sequence petdisease_reply_seq;


drop table homepetcare_member;

select * from homepetcare_post;
select * from homepetcare_post_reply;

select * from homepetcare_dataroom;

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



select * from petdisease_notice;
select * from petdisease_post;
select * from petdisease_reply;

create table petdisease_post
