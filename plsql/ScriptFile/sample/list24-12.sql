CREATE OR REPLACE TRIGGER dept_check
AFTER DELETE ON dept
DECLARE
  mes VARCHAR2(100);
BEGIN
  mes := CONVERT('DEPT�\���폜����܂���','ISO2022-JP');
  UTL_MAIL.SEND(sender     => 'educ@ashisuto.co.jp',
                recipients => 'educ@ashisuto.co.jp',
                subject    => 'WARNING',
                message    => mes,
                mime_type  => 'text/plain; charset=ISO-2022-JP');
END;
/