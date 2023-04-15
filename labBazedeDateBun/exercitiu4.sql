SELECT nota,count(id_student) as numar_elevi FROM universitate.nota group by id_student;
select nota ,count(*) as nr_studenti from nota where nota='5'
union
select nota ,count(*) from nota where nota='7'
union
select nota ,count(*) as nr_studenti from nota where nota='8'
union
select nota ,count(*) from nota where nota='9'
union
select nota ,count(*) as nr_studenti from nota where nota='10'
union
select nota ,count(*) from nota where nota='6';

select nota,count(*) as nr_studenti from nota
group by nota;