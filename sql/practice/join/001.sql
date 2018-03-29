select nt.id
       , at.id
       , nt.name
       , at.age
from nameTable nt
inner join ageTable at
on nt.id = at.id
;

select nt.id
      , at.id
      , nt.name
      , at.age
from nameTable nt
left outer join ageTable at
on nt.id = at.id
;

select nt.id
      , at.id
      , nt.name
      , at.age
from nameTable nt
right outer join ageTable at
on nt.id = at.id
;

select nt.id
      , at.id
      , nt.name
      , at.age
from nameTable nt
full outer join ageTable at
on nt.id = at.id
;
