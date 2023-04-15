select student.nr_matricol,  persoana.prenume,persoana.nume,specializare.denumire 
from student ,persoana,specializare
where persoana.cnp in(select cnp from student where id_specializare in(select id_specializare from specializare) ) 
;
select nr_matricol,
(select nume from persoana where persoana.cnp=student.cnp) as nume,
(select prenume from persoana where persoana.cnp=student.cnp)  as prenume,
(select denumire from specializare where specializare.id_specializare = student.id_specializare) as denummire
from student
where student.cnp in (select cnp from persoana);