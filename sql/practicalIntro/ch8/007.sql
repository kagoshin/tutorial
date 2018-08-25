--リスト8.21 シーケンスオブジェクトの定義の例
create sequence testseq
start with 1
increment by 1
maxvalue 100000
minvalue 1
cycle;

--drop sequence testseq;
