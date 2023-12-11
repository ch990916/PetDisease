create table petdisease_member(
	pm_id varchar2(10 char) primary key,
	pm_pw varchar2(10 char) not null,
	pm_nickname varchar2(10 char) not null,
	pm_address varchar2(300 char) not null,
	pm_birthday date not null,
	pm_photo varchar2(300 char) not null,
	pm_mail varchar2(300 char) not null,
	pm_admin number(2) not null
);

create table petdisease_notice(
	pn_no number(8) primary key,
	pn_title varchar(100 char) not null,
	pn_writer varchar2(10 char) not null,
	pn_content varchar2(500 char) not null,
	pn_date date not null,
	constraint notice_writer
		foreign key(pn_writer) references petdisease_member(pm_id)
);

create table homepetcare_post_reply(
	hpr_no number(10) primary key,
	hpr_hp_no number(8) not null,
	hpr_writer varchar2(10 char) not null,
	hpr_content varchar(200 char) not null,
	hpr_date date not null,
	constraint post_reply_writer
		foreign key(hpr_writer) references homepetcare_member(hm_id),
	constraint post_reply
		foreign key(hpr_hp_no) references homepetcare_post(hp_no)
		on delete cascade	
);

create table homepetcare_dataroom(
	hd_title varchar2(30 char) primary key,
	hd_uploader varchar2(10 char) not null,
	hd_file varchar2(100char) not null,
	hd_date date not null
);

create sequence petdisease_notice_seq;
create sequence homepetcare_post_reply_seq;


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


select * from petdisease_notice, (select pm_nickname from petdisease_member
where pm_id = (select pn_writer from petdisease_notice
where pn_no=1))
where pn_no=1






