select std_id,
       MAX(club_id) as main_club
from StudentClub
group by std_id
having count(*) = 1;

select std_id,
       club_id as main_club
from StudentClub
where main_club_flg = 'Y';

select std_id,
       case
        when count(*) = 1
          then max(club_id)
          else max( case
                      when main_club_flg = 'Y'
                        then club_id
                        else null
                        end
                  )
          end as main_club
from StudentClub
group by std_id
order by std_id;
