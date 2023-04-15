 -- Afișează numele și codul matricol al studentilor din anul 2 care au cel puțin o notă mai mică decât 5
SELECT student.nr_matricol,persoana.nume 
FROM universitate.student,universitate.persoana
where student.cnp in(select cnp from persoana); 

select distinct persoana.nume,student.nr_matricol from universitate.student
join universitate.persoana
on student.cnp=persoana.cnp
join universitate.nota
on student.nr_matricol=nota.id_student
where an_curent=2021 and nota.nota>5;

describe student;

select * from student;


