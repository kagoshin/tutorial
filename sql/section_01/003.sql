--1.現在の給料が30万以上の社員は、10％の減給とする
--2.現在の給料が25万以上28万未満の社員は、20％の昇給とする

update Personnel
  set salary = case when salary >= 300000 then salary * 0.9
                    when salary >= 250000 and salary < 280000 then salary * 1.2
                    else salary end;
