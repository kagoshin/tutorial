select center
from materials2
group by center
having count(material || orgland) <> count(distinct material || orgland)
;
