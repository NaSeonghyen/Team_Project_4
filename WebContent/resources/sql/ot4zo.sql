-- 20211101 나성현,위재림,이상훈 SQL 작업
-- 20211105 나성현 사용하는 SQL문 정리 
-- 1. 모든 뷰 삭제(만약 잘못 생성했을 경우 사용)
drop view cart_view;
drop view order_view;

-- 2. 모든 시퀀스 삭제(만약 잘못 생성했을 경우 사용)
drop sequence cart_seq;
drop sequence noticeboard_seq;
drop sequence qnaboard_seq;
drop sequence order_detail_seq;
drop sequence orders_seq;
drop sequence product_seq;

-- 3. 모든 테이블 삭제(만약 잘못 생성했을 경우 사용)
drop table order_detail;
drop table orders;
drop table cart;
drop table noticeboard;
drop table qnaboard;
drop table product;
drop table member;

-- 4. 테이블 생성
-- 4-1) 회원 테이블
create table MEMBER( 
     MEMBER_ID varchar2(20) NOT NULL PRIMARY KEY, 
     MEMBER_PW  varchar2(20) NOT NULL, 
     MEMBER_NAME  varchar2(30) NOT NULL,
     MEMBER_EMAIL  varchar2(20) NOT NULL,
     MEMBER_BIRTH  varchar2(9) NOT NULL,
     MEMBER_PHONE  varchar2(12) NOT NULL,
     MEMBER_ADDR  varchar2(200) NOT NULL,
     MEMBER_ADDR2  varchar2(200) NOT NULL,
     MAIL_RECEPTION  varchar2(2),
     SMS_RECEPTION  varchar2(2),
     ADMIN_YN  varchar2(2),
     MEMBER_REGDATE  varchar2(8) NOT NULL,
     MEMBER_STATUS  varchar2(2) NOT NULL
); 
-- 4-2) 상품 테이블
create table PRODUCT( 
     PSEQ NUMBER(10) NOT NULL PRIMARY KEY, 
     PRODUCT_NAME  varchar2(100), 
     PRODUCT_KIND  varchar2(30),
     PRODUCT_COST  NUMBER(7),
     PRODUCT_PRICE  NUMBER(7),
     PRODUCT_REVENUE  NUMBER(7),
     PRODUCT_CONTENT  varchar2(1000),
     PRODUCT_IMAGE  varchar2(50),
     PRODUCT_URL  varchar2(1000),
     PRODUCT_DETAIL_IMAGE  varchar2(50),
     PRODUCT_DETAIL_URL  varchar2(1000),
     PRODUCT_USEYN  varchar2(1),
     PRODUCT_INDATE  varchar2(8)
);
-- 4-3) 장바구니 테이블
create table CART( 
    CSEQ NUMBER(10) NOT NULL PRIMARY KEY, 
    MEMBER_ID  varchar2(20),
    PSEQ NUMBER(10),
    CART_QUANTITY  NUMBER(5) DEFAULT 1,
    CART_SIZE  varchar2(1) DEFAULT 'M',
    CART_RESULT  varchar2(1) DEFAULT '1',
    CART_INDATE DATE DEFAULT SYSDATE,
    FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER (MEMBER_ID),
    FOREIGN KEY(PSEQ) REFERENCES PRODUCT(PSEQ)
); 
-- 4-4) 주문 테이블
create table orders(
  oseq        number(10)    primary key,           -- 주문번호  
  id          varchar(16)   references member(member_id), -- 주문자 아이디
  indate      date          default sysdate       -- 주문일
);
-- 4-5) 주문 상세내역 테이블
create table order_detail(
  odseq       number(10)   primary key,               -- 주문상세번호
  oseq        number(10)   references orders(oseq),   -- 주문번호  
  pseq        number(5)    references product(pseq),  -- 상품번호
  quantity    number(5)    default 1,                 -- 주문수량
  order_SIZE  varchar2(2)  DEFAULT 'M',               -- 주문 옵션 사이즈
  result      char(1)      default '1'                -- 1: 미처리 2: 처리     
);
-- 4-6) Q&A 테이블
create table QNABOARD(
   bid number(5) primary key,
   mid varchar2(20),
   bpass varchar2(20),
   bsubtitle varchar2(20),
   btitle varchar2(100),
   bcontent varchar2(300),
   pictureurl varchar2(50),
   bdate date default sysdate,
   bhit number(4) default 0,
   bgroup number(4),
   bstep number(4),
   bindent number(4),
   foreign key(mid) references member(MEMBER_ID)
);
-- 4-7) 공지사항 테이블
create table NOTICEBOARD(
   nid number(5) primary key,
   nAdminid varchar2(20),
   nPass varchar2(20),
   ntitle varchar2(100),
   ncontent varchar2(500),
   npictureurl varchar2(50),
   ndate date default sysdate,
   nhit number(4) default 0,
   nindent number(4)
);

-- 5. 시퀀스 생성
create sequence product_seq start with 1 increment by 1;
create sequence cart_seq start with 1 increment by 1;
create sequence orders_seq start with 1 increment by 1;
create sequence order_detail_seq start with 1 increment by 1;
create sequence qnaboard_seq start with 1 increment by 1;
create sequence noticeboard_seq start with 1 increment by 1;

-- 6. 뷰 생성
-- 6-1) 장바구니 뷰
create or replace view cart_view as
select  o.cseq, 
        o.member_id, 
        o.pseq, 
        m.member_name mname, 
        p.product_name pname, 
        o.cart_quantity,
        o.cart_size,
        o.cart_indate,
        p.product_price, 
        o.cart_result,
        p.product_image,
        p.product_url
from    cart o,
        member m, 
        product p 
where    o.member_id = m.member_id 
and    o.pseq = p.pseq 
and    cart_result='1';

-- 6-2) 주문 상세내역 뷰
create or replace view order_view as
select   d.odseq, 
      o.oseq, 
      o.id, 
      o.indate, 
      d.pseq,
      d.quantity,
      d.order_size, 
      m.MEMBER_NAME mname,
      m. MEMBER_ADDR, 
      m. MEMBER_ADDR2, 
      m.MEMBER_PHONE, 
      p.PRODUCT_NAME pname, 
      p.product_price, 
      d.result,
      p.product_image,
      p.product_url  
from    orders o, 
      order_detail d, 
      member m, 
      product p 
where    o.oseq=d.oseq 
and      o.id = m.member_id 
and    d.pseq = p.pseq;

-- 7. 기본 데이터 삭제
delete from order_detail;
delete from orders;
delete from cart;
delete from noticeboard;
delete from qnaboard;
delete from product;
delete from member;

-- 8. 기본 데이터 넣기
-- 8-1) 회원 테이블
insert into member 
values( 'ADMIN', '1234', '관리자', 'ADMIN@ot4zo.com','20211007','01011111111','경기 수원시','그린아파트 101동 1101호','Y','Y','N','20211105','N');
insert into member 
values( 'test', '123123123', '테스트', 'test@ot4zo.com','20211105','01025458650','경기 수원시','그린아파트 101동 1101호','Y','Y','N','20211105','N');
commit;
-- 8-2) 상품 테이블
-- 8-2-1) 신상품
insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '플라워 V넥 롱 원피스', 'NEW', 50000, 59900, 9900, '#신상#원피스#긴팔#가을코디', '', 'https://spao.com/web/product/small/202108/19a222a027e88949e8ca42981dda89c8.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021081629175056747.jpg', 'Y', '20211003');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '물결 긴팔 티셔츠', 'NEW', 15000, 19900, 4900, '#신상#긴팔 티셔츠#캐주얼#가을코디', '', 'https://spao.com/web/product/small/202108/405c60e8a32d240b01a77c2cec8452b7.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021081628825771292.jpg', 'Y', '20211010');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '소프트 하찌 오버핏 베스트', 'NEW', 30000, 35900, 5900, '#신상#오버핏#베스트#가을코디', '', 'https://spao.com/web/product/extra/small/202108/3dec3bb3c8de8040ba87e67d7acf48d1.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021081628483703905.jpg', 'Y', '20211005');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '캠퍼스 그래픽 스웨트셔츠', 'NEW', 25000, 29900, 4900, '#신상#스웨트 셔츠#오트밀#가을코디', '', 'https://spao.com/web/product/small/202109/c7e6e6fcb4a6836590b9efaee6f2352c.jpg', '', 'http://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021011611113574883.jpg', 'Y', '20211008');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '골지 루즈핏 가디건', 'NEW', 35000, 39900, 4900, '#신상#가디건#골지#가을코디', '', 'https://spao.com/web/product/extra/small/202108/8a304f6f6973da9169ebebe80a664cf3.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021081628648557465.jpg', 'Y', '20211002');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '핀 스트라이프 긴팔 티셔츠', 'NEW', 15000, 19900, 4900, '#신상#긴팔 티셔츠#스트라이프#가을코디', '', 'https://spao.com/web/product/extra/small/202108/a8fbdf9976f18be9c18e633bf1ea3dc0.jpg', '', 'http://spao.com/web/upload/NNEditor/20210803/EAB8B0EC88A0EC849C2842920EC82ACEBB3B8.jpg', 'Y', '20211028');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '코튼 베스트', 'NEW', 35000, 39900, 4900, '#신상#코튼#베스트#가을코디', '', 'https://spao.com/web/product/extra/small/202108/181627b698128482353508ac60d202da.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021081627942980652.jpg', 'Y', '20211020');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '유니 스트라이프 스웨터', 'NEW', 25000, 29900, 4900, '#신상#스웨터#스트라이프#가을코디', '', 'https://spao.com/web/product/small/202108/773cb58f13ecb5786b97312570f6d391.jpg', '', 'http://spao.com/web/upload/NNEditor/20210803/EAB8B0EC88A0EC849C2842920EC82ACEBB3B8.JPG', 'Y', '20211016');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '루즈핏 트러커 자켓', 'NEW', 45000, 49900, 4900, '#신상#자켓#루즈핏#가을코디', '', 'https://spao.com/web/product/small/202108/a84d7c3e6904a3106ceb0bfaa1b89e43.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021091631590373785.jpg', 'Y', '20211015');
commit;

-- 8-2-2) BEST 상품
insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '베이직 스웨트 팬츠', 'BEST', 20000, 29900, 9900, '#베스트#스웨트#캐주얼#라운드넥', '', 'https://spao.com/web/product/small/202108/6eb89f482b823561cc4ddfa30c036d10.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021101633497037768.jpg', 'Y', '20211002');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '크롭 후드집업', 'BEST', 25000, 29900, 4900, '#베스트#후드집업#캐주얼#크롭', '', 'https://spao.com/web/product/small/202108/dae579d8471516d129e75ee4149d0a33.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021061623980944583.jpg', 'Y', '20211014');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '심플 레터 스웨트 셔츠', 'BEST', 25000, 29900, 4900, '#베스트#스웨터#캐주얼#그레이', '', 'https://spao.com/web/product/small/202108/14af8622a7e25bebe638ed3f8821a7e8.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021101634013624371.jpg', 'Y', '20211025');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '베이직 스웨트셔츠', 'BEST', 15000, 19900, 4900, '#베스트#스웨터#캐주얼#라운드넥', '', 'https://spao.com/web/product/small/202108/97deec190d31506e432d8d3377dfb35f.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021101633497865436.jpg', 'Y', '20211028');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '[남녀공용][2PACK] 코튼 크루넥 반팔', 'BEST', 5000, 9900, 4900, '#베스트#반팔#베이직#라운드넥', '', 'https://spao.com/web/product/small/202103/79bf91edf75e9a44be892162cb0558a9.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021031615872284633.jpg', 'Y', '20211012');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '[남녀공용] 쿨 배색 윈드브레이커', 'BEST', 45000, 49900, 4900, '#베스트#자켓#캐주얼#바람막이', '', 'https://spao.com/web/product/small/202107/5634f786c61233e057e9cfa940322959.jpg', '', 'http://spao.com/web/upload/NNEditor/20210611/SPJJB37C9120EAB8B0EC88A0EC849C28429.jpg', 'Y', '20211008');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '(짱구) 잘자요 짱구 잠옷(MINT)', 'BEST', 35000, 39900, 4900, '#베스트#커플잠옷#짱구#잘자요', '', 'https://spao.com/web/product/extra/small/202108/4a9fddac68efd306756fd97d051d6c83.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021071627596730903.jpg', 'Y', '20211010');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '(해리포터) 머글은 모르는 잠옷(PINK)', 'BEST', 35000, 39900, 4900, '#베스트#커플잠옷#해리포터#호그와트', '', 'https://spao.com/web/product/extra/small/202108/ae6cf94a6c8eb9440c7f5106a318d06a.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021101633583086698.jpg', 'Y', '20211006');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '[허니푸퍼] 베이직 푸퍼', 'BEST', 45000, 48900, 3900, '#베스트#푸퍼#캐주얼#블랙', '', 'https://spao.com/web/product/small/202107/27f5898df0fc52baffeebffff74425c3.jpg', '', 'http://spao.com/web/upload/NNEditor/20210916/EAB8B0EC88A0EC849C2862920EC82ACEBB3B8202812920EC82ACEBB3B8.JPG', 'Y', '20211012');
commit;
-- 8-2-3) 가디건,자켓 상품
insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '크롭 트러커 자켓', '가디건/자켓', 30000, 39900, 9900,  '#자켓#가을#아우터#가을코디','', 'https://spao.com/web/product/small/202103/eb961da3e3188ea04090c1b779936aa3.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021021612757000058.jpg', 'Y', '20211002');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '스탠다드핏 더블 자켓', '가디건/자켓', 45000, 49900, 4900, '#자켓#가을#아우터#가을코디','', 'https://spao.com/web/product/small/202102/d8f28009119a288a6cf56b608c8d3f16.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021021613535121715.jpg', 'Y', '20211014');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '트위드 라운드넥 자켓', '가디건/자켓', 75000, 79900, 4900, '#자켓#가을#아우터#가을코디','', 'https://spao.com/web/product/extra/small/202108/34988e79d232dece7a5020754bd79347.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021071626924340376.jpg', 'Y', '20211025');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '골지 루즈핏 가디건', '가디건/자켓', 35000, 39900, 4900, '#가디건#가을#아우터#가을코디','', 'https://spao.com/web/product/small/202108/8398dbfa61de13427ef7ae3fceb11373.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021081628648557465.jpg', 'Y', '20211028');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '아가일 가디건', '가디건/자켓', 35000, 39900, 4900, '#가디건#가을#아우터#가을코디','', 'https://spao.com/web/product/small/202107/8c3318e6f04f1cc095b7d18548e5570d.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021071626671110856.jpg', 'Y', '20211012');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '루즈핏 트러커 자켓', '가디건/자켓', 45000, 49900, 4900,'#자켓#가을#아우터#가을코디','', 'https://spao.com/web/product/extra/small/202108/a804497673cc3b7ce2c575e52a841d2c.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021021612757218810.jpg', 'Y', '20211008');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '루즈핏 트러커 자켓', '가디건/자켓', 45000, 49900, 4900, '#자켓#가을#아우터#가을코디','', 'https://spao.com/web/product/extra/small/202108/e69673c9a262d73ad05ca75e5361d67c.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021091631590373785.jpg', 'Y', '20211010');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '후드형 숏야상', '가디건/자켓', 35000, 39900, 4900, '#후드야상#가을#아우터#가을코디','', 'https://spao.com/web/product/small/202103/b94d9c76ce4dbd374c79dead2a6fafc3.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021021614051727527.jpg', 'Y', '20211006');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '오버핏 체크 가디건', '가디건/자켓', 45000, 49900, 4900, '#가디건#가을#아우터#가을코디','', 'https://spao.com/web/product/extra/small/202108/812b59407ad08f20f272f421595b166b.jpg', '', 'http://spao.com/web/upload/NNEditor/20211026/copy-1635207967-EAB8B0EC88A0EC849C28129-EC82ACEBB3B8.jpg', 'Y', '20211012');

-- 8-2-4) 코트 상품
insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '롱 트렌치코트', '코트', 90000, 99900, 9900, '#트렌치코트#가을#아우터#가을코디','', 'https://spao.com/web/product/small/202108/d888f159b104a810df7d78ec0198e5e7.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021071627543693757.jpg', 'Y', '20211002');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '와이드카라 베이직 트렌치코트', '코트', 45000, 49900, 4900, '#트렌치코트#가을#아우터#가을코디','', 'https://spao.com/web/product/small/202102/a29bb342fa6263d1a6fab73900a3bffa.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021021612138677334.jpg', 'Y', '20211014');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '트위드 라운드넥 자켓', '코트', 35000, 39900, 4900, '#모직코트#가을#아우터#가을코디','', 'https://spao.com/web/product/small/202009/76555f38a360fdfc9bd74cd6296b8ce5.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021071626924340376.jpg', 'Y', '20211025');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '야상 트렌치 코트', '코트', 45000, 49900, 4900,  '#트렌치코트#가을#아우터#가을코디','',  'https://spao.com/web/product/small/202102/5a25cd638b0717cbaf5ca3597009335e.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021021613535164373.jpg', 'Y', '20211028');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '오버핏 트렌치코트', '코트', 95000, 99900, 4900,  '#트렌치코트#가을#아우터#가을코디','',  'https://spao.com/web/product/extra/small/202101/ca37797ea610467ed7778c52db64f6d1.jpg', '', 'http://www.elandmall.com/upload/fckeditor/tempgoodsdesc/2021011611210575136.jpg', 'Y', '20211012');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '울라이크 트렌치코트', '코트', 125000, 129900, 4900,  '#트렌치코트#가을#아우터#가을코디','',  'https://spao.com/web/product/extra/small/202108/3fdbc8f153244c8cb72948c65b87430a.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021071626655825323.jpg', 'Y', '20211008');

-- 8-2-5) ACC
insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '레터 캡모자', 'ACC', 5000, 7900, 2900, '#ACC#볼캡#레터링#브라운', '', 'https://spao.com/web/product/extra/small/202007/7c3742b0ddc34f4def5145dc7d360bf4.jpg', '', 'http://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2020051589760402512.jpg', 'Y', '20211002');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '베이직 캡모자', 'ACC', 5000, 7900, 2900, '#ACC#볼캡#베이직#퍼플', '', 'https://spao.com/web/product/extra/small/202007/94ff604ebf09efdecec82e2393108992.jpg', '', 'http://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2020051589760402512.jpg', 'Y', '20211014');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '남성 스퀘어 솔리드 벨트', 'ACC', 10000, 12900, 2900, '#ACC#벨트', '', 'https://spao.com/web/product/small/202101/2752cb5d2b494337ce44b067b9e740aa.jpg', '', 'http://www.elandmall.com/upload/fckeditor/tempgoodsdesc/2021011611645061973.jpg', 'Y', '20211025');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '여성 라운드 베이직 벨트', 'ACC', 35000, 39900, 4900, '#ACC#벨트', '', 'https://spao.com/web/product/small/202101/e17a0441fe5936267503f9a1b59c3ad5.jpg', '', 'http://www.elandmall.com/upload/fckeditor/tempgoodsdesc/2021011611645113935.jpg', 'Y', '20211028');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '여성 D링 베이직 벨트', 'ACC', 35000, 39900, 4900, '#ACC#벨트', '', 'https://spao.com/web/product/small/202101/cffc876f051d2a75b4810dae64fc5582.jpg', '', 'http://www.elandmall.com/upload/fckeditor/tempgoodsdesc/2021011611298106352.jpg', 'Y', '20211012');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '4팩 스니커즈삭스 (쿠션양말)', 'ACC', 45000, 49900, 4900, '#ACC#양말', '', 'https://spao.com/web/product/small/202008/f4f313ed85ff27dbf820599cc6d8c8d7.jpg', '', 'http://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2020011579668337739.jpg', 'Y', '20211008');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '프레쉬 컬러 레귤러 삭스(골지)', 'ACC', 45000, 49900, 4900, '#ACC#양말', '', 'https://spao.com/web/product/small/202106/b8709da8c04079aa21f9a5e84b5914bc.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021061623803707080.jpg', 'Y', '20211010');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '컬러 레귤러삭스 (골지양말)', 'ACC', 35000, 39900, 4900, '#ACC#양말', '', 'https://spao.com/web/product/small/202104/c83a1a3152b4ed28e021820a6085aec0.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021041618358262154.jpg', 'Y', '20211006');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '[맥포스] 슈퍼 팔콘', 'ACC', 45000, 49900, 4900, '#ACC#백팩', '', 'https://spao.com/web/product/small/202011/d5bd6553610f19abf95eb38348ad27f9.jpg', '', 'http://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2020111604883346101.jpg', 'Y', '20211012');

commit;
-- 8-2-6) 니트/스웨터
insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '레터 후드 풀오버', '니트/스웨터', 35000, 39900, 4900, '#후드#오버핏#캐주얼#레터링', 'product_main_1.jpg', '', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021071627371263899.jpg', 'Y', '20211002');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '캠퍼스 그래픽 후드 풀오버', '니트/스웨터', 35000, 39900, 4900, '#후드#오버핏#캐주얼#그래픽', 'product_main_2.jpg', '', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021091632718815246.jpg', 'Y', '20211014');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '그래픽 후드 집업', '니트/스웨터', 20000, 25900, 5900, '#후드집업#오버핏#캐주얼#그래픽', 'product_main_3.jpg', '', '', 'http://spao.com/web/upload/NNEditor/20210406/SPMZB24C90-EAB8B0EC88A0EC849C.jpg', 'Y', '20211025');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '루즈핏 데님 후드 집업', '니트/스웨터', 55000, 59900, 4900, '#후드#데님#캐주얼#오버핏', 'product_main_4.jpg', '', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021011611730909805.jpg', 'Y', '20211028');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '루즈핏 라이트 후드 집업', '니트/스웨터', 21000, 25900, 4900, '#후드#루즈핏#캐주얼#라이트', 'product_main_5.jpg', '', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021071625530315267.jpg', 'Y', '20211012');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '플라워 그래픽 후드 풀오버', '니트/스웨터', 21000, 25900, 4900, '#후드#오버핏#캐주얼#그래픽', 'product_main_6.jpg', '', '', 'http://spao.com/web/upload/NNEditor/20210309/EAB8B0EC88A0EC849C28329.jpg', 'Y', '20211008');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '일러스트 후드 풀오버', '니트/스웨터', 35000, 39900, 4900, '#후드#오버핏#캐주얼#일러스트', 'product_main_7.jpg', '', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021081629858245540.jpg', 'Y', '20211010');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '베이직 후드 집업', '니트/스웨터', 20000, 25900, 5900, '#후드#베이직#캐주얼#라이트', 'product_main_8.jpg', '', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021071627002154931.jpg', 'Y', '20211006');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '반팔 집업 점퍼', '니트/스웨터', 35000, 39900, 4900, '#반팔#베이직#캐주얼#그레이', 'product_main_14.jpg', '', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021041617557632484.jpg', 'Y', '20211012');
commit;


-- 8-2-7) 셔츠/블라우스
insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '오픈카라 뒷밴딩 블라우스', '셔츠/블라우스', 35000, 39900, 4900, '#블라우스#오픈카라#뒷밴딩#긴팔', '', 'https://spao.com/web/product/extra/small/202108/b24f705bdd6e3fad52a77a495aaeb4a7.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021081629683043374.jpg', 'Y', '20211002');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '베이직 R넥 블라우스', '셔츠/블라우스', 25000, 29900, 4900, '#블라우스#R넥#베이직#긴팔', '', 'https://spao.com/web/product/small/202106/505f7c74df19b689fef46a517d4ddba7.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021061623712494400.jpg', 'Y', '20211014');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '스티치 포인트 블라우스', '셔츠/블라우스', 25000, 29900, 5900, '#블라우스#스티치#포인트#반팔', '', 'https://spao.com/web/product/small/202105/4dc3454957bb020a39dd07d58b89d585.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021041619570650787.jpg', 'Y', '20211025');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '러플 랩형 블라우스', '셔츠/블라우스', 25000, 29900, 4900, '#블라우스#러플#무지#긴팔', '', 'https://spao.com/web/product/small/202102/299298b63fb3e436f673f1085dd30d42.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021021613368624663.jpg', 'Y', '20211028');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '울피치 오픈카라 블라우스', '셔츠/블라우스', 25000, 29900, 4900, '#블라우스#오픈카라#울피치#긴팔', '', 'https://spao.com/web/product/small/202108/42c9db137f193ec6de36f6e79cdcffae.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021081628821496627.jpg', 'Y', '20211012');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '세미오버핏 반팔셔츠', '셔츠/블라우스', 21000, 25900, 4900, '#셔츠#세미오버핏#댄디#반팔', '', 'https://spao.com/web/product/small/202108/7704e0ae5215afc73a485a84c795bf97.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021081629857747092.jpg', 'Y', '20211008');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '워셔블 버드아이 스웨터', '셔츠/블라우스', 25000, 29900, 4900, '#셔츠#스웨터#댄디#긴팔', '', 'https://spao.com/web/product/small/202108/5eddf1acce3a5b43f4ba796b8881b4d1.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021081629956218704.jpg', 'Y', '20211010');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '그래픽 반집업 스웨트셔츠', '셔츠/블라우스', 34000, 39900, 5900, '#셔츠#반집업#캐주얼#그래픽', '', 'https://spao.com/web/product/small/202108/7527684a0b356ea0e2da12b3c7a0c724.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021081629432220185.jpg', 'Y', '20211006');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '우디 자수 옥스포드 셔츠', '셔츠/블라우스', 35000, 39900, 4900, '#셔츠#토이스토리#우디#옥스포드', '', 'https://spao.com/web/product/small/202108/8d5b47c4315f6a9dad9411cf8c9c970e.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021081629345338134.jpg', 'Y', '20211012');

commit;
-- 8-2-8) 팬츠
insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '포인트 라벨 하프팬츠', '팬츠', 15000, 19900, 4900, '#팬츠#하프#캐주얼#라벨', '', 'https://spao.com/web/product/small/202104/8056721a2e37e3b25afc7e0014f992bf.jpg', '', 'http://spao.com/web/upload/NNEditor/20210413/SPMTB24C92_EAB8B0EC88A0EC849C.jpg', 'Y', '20211002');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '베이직 하프 팬츠', '팬츠', 5000, 7900, 2900, '#팬츠#하프#캐주얼#베이직', '', 'https://spao.com/web/product/small/202104/6902337980218237749b2324daca253d.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021041617557904368.jpg', 'Y', '20211014');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '아웃포켓형 하프팬츠', '팬츠', 15000, 19900, 4900, '#팬츠#하프#캐주얼#포켓', '', 'https://spao.com/web/product/small/202104/05e18cab32b235484a1422d4a753f81f.jpg', '', 'http://spao.com/web/upload/NNEditor/20210416/copy-1618559756-SPMTB24C27-EAB8B0EC88A0EC849C.jpg', 'Y', '20211025');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '하프 팬츠', '팬츠', 5000, 9900, 4900, '#팬츠#하프#캐주얼#베이직', '', 'https://spao.com/web/product/small/202103/2ab85a8908f59f2bc37a7099b4d90f50.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021031615434565154.jpg', 'Y', '20211028');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '라이트코튼 조거 팬츠', '팬츠', 25000, 29900, 4900, '#팬츠#조거#캐주얼#트레이닝', '', 'https://spao.com/web/product/small/202103/036086af8ce9efd75a5928bf0a8ac8be.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021061623028163716.jpg', 'Y', '20211012');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '롱와이드 팬츠', '팬츠', 15000, 19900, 4900, '#팬츠#롱와이드#캐주얼#쿨링', '', 'https://spao.com/web/product/small/202105/2a774c4efe730d660a26560aa76cbe09.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021051620778216767.jpg', 'Y', '20211008');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '라이트 하프팬츠', '팬츠', 11000, 15900, 4900, '#팬츠#하프#캐주얼#베이직', '', 'https://spao.com/web/product/small/202106/f35a3a93bfa29ab6c47a04cad2c0efcc.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021051620602663584.jpg', 'Y', '20211010');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '원마일 체크 이지팬츠', '팬츠', 24000, 29900, 5900, '#팬츠#체크#캐주얼#와이드', '', 'https://spao.com/web/product/extra/small/202105/7295d9bbca0cf5c1d40bc704e95b1b42.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021051620344525277.jpg', 'Y', '20211006');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '베이직 세미와이드 팬츠', '팬츠', 25000, 29900, 4900, '#팬츠#그레이#캐주얼#세미와이드', '', 'https://spao.com/web/product/extra/small/202107/30a4851b9e921a3f2ead210802c66c0b.jpg', '', 'http://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021011611729443488.jpg', 'Y', '20211012');

commit;
-- 8-2-9) 슬랙스
insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '[데일리지] 세미 부츠컷', '슬랙스', 35000, 39900, 4900, '#슬랙스#블랙#세미부츠컷#오피스룩', '', 'https://spao.com/web/product/small/202108/e806a4d6ba96c25307093467cd2f8218.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021071627616644845.jpg', 'Y', '20211002');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '[데일리지] 롱 핀턱 와이드', '슬랙스', 35000, 39900, 4900, '#슬랙스#그레이#핀턱와이드#오피스룩', '', 'https://spao.com/web/product/small/202108/29edf906760c5650340094cf188a3a0f.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021071627445118599.jpg', 'Y', '20211014');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '화섬 와이드 스트링 팬츠', '슬랙스', 24000, 29900, 5900, '#스트링#캐주얼#와이드#턱디테일', '', 'https://spao.com/web/product/small/202107/addc8de73408e0329435e272ac60e30b.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021071625531076489.jpg', 'Y', '20211025');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '9부 코튼 핀턱 와이드', '슬랙스', 25000, 29900, 4900, '#슬랙스#9부#와이드#턱디테일', '', 'https://spao.com/web/product/small/202105/1d076910e7ef2937ef6b96cae7832c93.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021051620345645755.jpg', 'Y', '20211028');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '[데일리지] 테이퍼드', '슬랙스', 25000, 29900, 4900, '#슬랙스#테이퍼드#베이지#오피스룩', '', 'https://spao.com/web/product/small/202102/86a350af14043e3880a8db50c0b9cef9.jpg', '', 'http://spao.com/web/upload/NNEditor/20210712/EAB8B0EC88A0EC849C2852920EC82ACEBB3B8.jpg', 'Y', '20211012');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '[포맨] 쿨 앵클 히든밴딩 테이퍼드', '슬랙스', 25000, 29900, 4900, '#슬랙스#밴딩#댄디#쿨링', '', 'https://spao.com/web/product/extra/small/202104/6d09aa604fcb7cf0b1b70bd33a60aae2.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021031617083996327.jpg', 'Y', '20211008');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '[데일리지] 앵클 테이퍼드', '슬랙스', 35000, 39900, 4900, '#슬랙스#앵클#테이퍼드#베이지', '', 'https://spao.com/web/product/small/202007/2bd309aa95942096b38c1fb3256b86bd.jpg', '', 'http://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2020071595475852912.jpg', 'Y', '20211010');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '[데일리지] 앵클 슬림', '슬랙스', 25000, 29900, 5900, '#슬랙스#앵클#슬림핏#베이지', '', 'https://spao.com/web/product/small/202008/cdb1155aa515ff36707d5e80462f6a19.jpg', '', 'http://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2020071595217901375.jpg', 'Y', '20211006');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '베이직 레귤러 셋업 팬츠', '슬랙스', 35000, 39900, 4900, '#슬랙스#체크#레귤러#베이직', '', 'https://spao.com/web/product/small/202008/bdc0d8baaaf6000a7dae78cde669f64f.jpg', '', 'http://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2020081596688883908.jpg', 'Y', '20211012');

commit;
-- 8-2-10) 레깅스
insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '여성 레깅스', '레깅스', 11000, 15900, 4900, '#레깅스#캐주얼#스키니#스판', '', 'https://spao.com/web/product/small/202107/4b801685b79792ee013003dc497af54b.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021071627006473679.jpg', 'Y', '20211002');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '남성 아웃밴드 레깅스', '레깅스', 11000, 15900, 4900, '#레깅스#캐주얼#스키니#스판', '', 'https://spao.com/web/product/small/202108/d3c142e9d7d5ef5d21fa0be8a07986ca.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021081629957759262.jpg', 'Y', '20211014');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '3부레깅스', '레깅스', 2000, 3900, 1900, '#레깅스#캐주얼#스키니#스판', '', 'https://spao.com/web/product/extra/small/202008/6a0d1ca22465febb6cf92dc00c47b4c5.jpg', '', 'http://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2020051589173127758.jpg', 'Y', '20211025');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '3부레깅스', '레깅스', 2000, 3900, 1900, '#레깅스#캐주얼#스키니#스판', '', 'https://spao.com/web/product/small/202008/7037cb7d3498651928bd2b81bbeb2cfd.jpg', '', 'http://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2020051589173127758.jpg', 'Y', '20211028');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '수피마 9부 레깅스', '레깅스', 4000, 6400, 2400, '#레깅스#캐주얼#스키니#스판', '', 'https://spao.com/web/product/small/202101/85f814ce329f34f9eb2773fff2c3374f.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021081629957759262.jpg', 'Y', '20211012');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '수피마 7부 레깅스', '레깅스', 4000, 6400, 2400, '#레깅스#캐주얼#스키니#스판', '', 'https://spao.com/web/product/small/202101/ec8d9952b3a82050354a5eda9b561c36.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021071627006473679.jpg', 'Y', '20211008');

-- 8-2-11) 스커트
insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '사이드 슬릿 롱 스커트', '스커트', 35000, 39900, 4900, '#스커트#캐주얼#슬릿#사이드', '', 'https://spao.com/web/product/small/202108/638339d35d6764d6f082ae9f322de707.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021081629857498546.jpg', 'Y', '20211002');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '베이직 H라인 스웨터 스커트', '스커트', 25000, 29900, 4900, '#스커트#H라인#스웨터#베이직', '', 'https://spao.com/web/product/small/202108/1cdb4069dc7c459bf60be29837106e1e.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021081628485812037.jpg', 'Y', '20211014');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '골지 H라인 스웨터 스커트', '스커트', 24000, 29900, 5900, '#스커트#H라인#골지#베이지', '', 'https://spao.com/web/product/small/202108/c3924605203ecd89d254a86e4674c10b.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021081628485496851.jpg', 'Y', '20211025');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '코튼 롱 스커트', '스커트', 15000, 19900, 4900, '#스커트#캐주얼#코튼#롱', '', 'https://spao.com/web/product/small/202008/804ee7cd700e42652e85407c59c59361.jpg', '', 'http://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2020071593655425018.jpg', 'Y', '20211028');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '플라워 미니 스커트', '스커트', 35000, 39900, 4900, '#스커트#플라워#캐주얼#미니', '', 'https://spao.com/web/product/small/202102/1b813f650113ad8489c88279c772e0fb.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021021613624311184.jpg', 'Y', '20211012');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '세미머메이드 스커트', '스커트', 25000, 29900, 4900, '#스커트#호피#캐주얼#롱', '', 'https://spao.com/web/product/extra/small/202009/82b607136a123ab44fb2c57ff26bb51b.jpg', '', 'http://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2020081598491311130.jpg', 'Y', '20211008');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '사틴 롱 스커트', '스커트', 25000, 29900, 4900, '#스커트#사틴#롱#베이직', '', 'https://spao.com/web/product/small/202101/a5252c0f695633a01895ce5930a51977.jpg', '', 'http://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021011611026225255.jpg', 'Y', '20211010');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '체크 미니 스커트', '스커트', 14000, 19900, 5900, '#스커트#체크#캐주얼#미니', '', 'https://spao.com/web/product/small/202012/553056094b67249afaa62d96e1734391.jpg', '', 'https://www.elandrs.com/upload/fckeditor/tempgoodsdesc/2021091630992377047.jpg', 'Y', '20211006');

insert into PRODUCT (PSEQ, PRODUCT_NAME, PRODUCT_KIND, PRODUCT_COST,PRODUCT_PRICE,PRODUCT_REVENUE,PRODUCT_CONTENT,PRODUCT_IMAGE,PRODUCT_URL, PRODUCT_DETAIL_IMAGE, PRODUCT_DETAIL_URL ,PRODUCT_USEYN,PRODUCT_INDATE)
values(PRODUCT_SEQ.nextval, '쉬폰 플리츠 변형 스커트', '스커트', 15000, 19900, 4900, '#스커트#쉬폰#롱#플리츠', '', 'https://spao.com/web/product/small/202102/53ee18322c18d10b6ea8b6c3075eac6d.jpg', '', 'http://spao.com/web/upload/NNEditor/20210225/EAB8B0EC88A0EC849C28229.jpg', 'Y', '20211012');
commit;
--8-3) Q&A 테이블
insert into QNABOARD(bid,mid,bpass,bsubtitle,btitle,bcontent,bhit,bgroup,bstep,bindent)
values(qnaboard_seq.nextval,'test','1234','전체문의','슬랙스 문의드립니다.','is content',0,qnaboard_seq.currval,0,0);

insert into QNABOARD(bid,mid,bpass,bsubtitle,btitle,bcontent,bhit,bgroup,bstep,bindent)
values(qnaboard_seq.nextval,'test','1234','전체문의','배송 문의드립니다.','배송 기간이 어떻게 되나요?',0,qnaboard_seq.currval,0,0);

insert into QNABOARD(bid,mid,bpass,bsubtitle,btitle,bcontent,bhit,bgroup,bstep,bindent)
values(qnaboard_seq.nextval,'test','1234','전체문의','환불 문의드립니다.','환불부탁드립니다.',0,qnaboard_seq.currval,0,0);

insert into QNABOARD(bid,mid,bpass,bsubtitle,btitle,bcontent,bhit,bgroup,bstep,bindent)
values(qnaboard_seq.nextval,'test','1234','전체문의','입금 문의드립니다.','입금을 잘못하였는데 확인부탁드립니다.',0,qnaboard_seq.currval,0,0);

commit;
--8-4) 공지사항 테이블
insert into noticeboard(nid,nAdminid,nPass,ntitle,ncontent,nhit,nindent)
values(noticeboard_seq.nextval,'ADMIN','1234','2021 겨울 서프라이즈 세일','전상품 최대 70% 세일 앵콜 세일이 시작되었습니다.',0,0);

insert into noticeboard(nid,nAdminid,nPass,ntitle,ncontent,nhit,nindent)
values(noticeboard_seq.nextval,'ADMIN','1234','2021 가을 서프라이즈 세일','전상품 최대 50% 세일 앵콜 세일이 시작되었습니다.',0,0);

insert into noticeboard(nid,nAdminid,nPass,ntitle,ncontent,nhit,nindent)
values(noticeboard_seq.nextval,'ADMIN','1234','2021 여름 서프라이즈 세일','전상품 최대 40% 세일 앵콜 세일이 시작되었습니다.',0,0);

insert into noticeboard(nid,nAdminid,nPass,ntitle,ncontent,nhit,nindent)
values(noticeboard_seq.nextval,'ADMIN','1234','2021 봄 서프라이즈 세일','전상품 최대 30% 세일 앵콜 세일이 시작되었습니다.',0,0);
commit;

--9 조회 쿼리
select * from member;
select * from product;
select * from cart;
select * from orders;
select * from order_detail;
select * from qnaboard;
select * from noticeboard;
select * from cart_view;
select * from order_view;