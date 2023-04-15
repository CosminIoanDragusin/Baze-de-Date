SELECT student.nr_matricol,persoana.nume,persoana.prenume,specializare.denumire FROM universitate.student
join persoana
on student.cnp=persoana.cnp
join specializare
on student.id_specializare=specializare.id_specializare
