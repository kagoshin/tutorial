create user practical_intro
identified by "practical_intro"
default tablespace users
temporary tablespace temp
/

grant dba to practical_intro;

grant unlimited tablespace to practical_intro;

/*
# dockerへ接続
- ホスト名:localhost
- ポート:49161
- SID:xe
*/
