select specializare.denumire,count(materie.id_materie) as nr from materie
Join specializare
on materie.id_specializare=specializare.id_specializare
 group by materie.id_specializare
 order by nr desc limit 1
;