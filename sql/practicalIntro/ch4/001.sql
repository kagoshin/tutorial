--「図4.1::非集約テーブルのサンプル」を作成
CREATE TABLE NonAggTbl
(id VARCHAR(32) NOT NULL,
 data_type CHAR(1) NOT NULL,
 data_1 INTEGER,
 data_2 INTEGER,
 data_3 INTEGER,
 data_4 INTEGER,
 data_5 INTEGER,
 data_6 INTEGER);

DELETE FROM NonAggTbl;
INSERT INTO NonAggTbl VALUES('Jim',    'A',  100,  10,     34,  346,   54,  NULL);
INSERT INTO NonAggTbl VALUES('Jim',    'B',  45,    2,    167,   77,   90,   157);
INSERT INTO NonAggTbl VALUES('Jim',    'C',  NULL,  3,    687, 1355,  324,   457);
INSERT INTO NonAggTbl VALUES('Ken',    'A',  78,    5,    724,  457, NULL,     1);
INSERT INTO NonAggTbl VALUES('Ken',    'B',  123,  12,    178,  346,   85,   235);
INSERT INTO NonAggTbl VALUES('Ken',    'C',  45, NULL,     23,   46,  687,    33);
INSERT INTO NonAggTbl VALUES('Beth',   'A',  75,    0,    190,   25,  356,  NULL);
INSERT INTO NonAggTbl VALUES('Beth',   'B',  435,   0,    183, NULL,    4,   325);
INSERT INTO NonAggTbl VALUES('Beth',   'C',  96,  128,   NULL,    0,    0,    12);

select id
      , max(case when data_type = 'A'
                 then data_1
                 else null end) as data_1
      , max(case when data_type = 'A'
                 then data_2
                 else null end) as data_2
      , max(case when data_type = 'B'
                 then data_3
                 else null end) as data_3
      , max(case when data_type = 'B'
                 then data_4
                 else null end) as data_4
      , max(case when data_type = 'C'
                 then data_5
                 else null end) as data_5
      , max(case when data_type = 'C'
                 then data_6
                 else null end) as data_6
from NonAggTbl
group by id
;
