select distinct(id_student) as cod_matric ,an_curent
from nota 
join student
on nota.id_student=student.nr_matricol
where nota<7 and an_curent=2
;