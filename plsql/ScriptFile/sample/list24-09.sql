SELECT schedule_name,
       schedule_type,
       repeat_interval,
       to_char(start_date,'YYYY/MM/DD (DAY)')
FROM user_scheduler_schedules
WHERE schedule_name = 'MON_SCHEDULE';