SELECT nota.nota,concat(persoana.nume," ",persoana.prenume) as numele_student,materie.denumire FROM universitate.nota
join student
on nota.id_student=student.nr_matricol
join persoana
on student.cnp=persoana.cnp
join materie
on nota.id_curs=materie.id_materie