select owner, name, type, sharable_mem, loads, kept
from v$db_object_cache
where type in ('procedure')
order by loads desc;
