SELECT owner,name,type,sharable_mem,loads,kept
FROM  v$db_object_cache
WHERE type IN ('PROCEDURE')
ORDER BY loads DESC;