-- insereaza valori exemplu
INSERT INTO universitate.persoana (cnp, seria, nr,prenume,nume,adresa,nationalitate) 
VALUES ('1002', '3', '13','Albu','Carla','aleea parc','roman');
-- 3.	Afișează denumirea și id_facultate pentru facultățile care au id_facultate impar.
select denumire,id_facultate from facultate where id_facultate %2=1;
-- 4.	Afișează naționalitatea și numele persoanelor care au in componenta numelui litera “a”.
select nationalitate from persoana where nationalitate like '%a%' or 'a%' or '%a';
-- 5.	Afișează grupa studenților care au bursa și sunt în semestrul 2.
select grupa from student where bursa=100 and semestru = 2;
-- 6.	Afișează lista tuturor numelor persoanelor, ordonate în ordine alfabetică.
select concat(nume,' ',prenume) as numele from persoana order by nume;
-- 7.	Afișează lista cu numele primelor 10 persoane, ordonate în ordine alfabetică
select nume from persoana  order by nume limit 0,10;
-- 8.	Afișează numele decanilor care conduc facultăți fondate între anii 1900,1995. Rezolvă exercițiul prin 3 metode.
select decan from facultate where an_fondare >1900 and an_fondare<1995;-- 1
select decan from facultate order by an_fondare limit 0,10  ;-- 2
select decan from facultate where an_fondare between 1905 and 1995;-- 3
-- 9.	Adaugă în tabela materie o înregistrare cu materia: Etica.
insert into materie () values();
-- 10.	Șterge toate materiile care contin string-ul “tica”.
SELECT * FROM universitate.materie;
delete from universitate.materie
where denumire like '%tica';
-- 1.	Afișează media notelor tuturor studentilor
select avg(nota) from nota;
-- 2.	Afișați pentru fiecare notă din tabelul nota timpul trecut de la acordarea notei până în prezent.
select data_examen,curdate(),DATEDIFF(CURDATE(),data_examen) from nota;
-- 3.	Afișați din tabelul persoană numele complet 
-- al studentului într-o singură coloană, și seria cu numărul de buletin în altă coloană. ( rezolvati prin doua moduri)
SELECT concat(nume," ",prenume) as nume,cnp FROM universitate.persoana;
SELECT 
    CONCAT_WS(' ', seria, nr) AS serie_noua,
    CONCAT_WS(' ', nume, prenume) AS nume_nou
FROM
    persoana;
    -- 4.	Afișați din tabelul student numărul de studenți înmatriculați și numărul total de persoane înmatriculate.
    -- Acest exercițiu reflectă posibilitatea unei persoane de a fi student la mai multe facultăți simultan.
   SELECT count(nr_matricol) as nr_studenti, count(cnp) as nr_persoane FROM universitate.student ;
    -- 5.	Afișează numele decanilor de facultate cu caractere mari : Ex: POPESCU. (Fără să modifici în baza de date)
    SELECT upper(decan) FROM universitate.facultate;
    -- 6.	Afișează CNP-ul, numele persoanei, luna nașterii (numeric, ex: 08), luna nașterii( text, ex: August)
    -- pentru toate persoanele. (Extrage luna nasterii din CNP.
   SELECT cnp,concat(nume," ",prenume) as nume,
concat('1978',
'-',
substr(cnp,4,1),
'-',
substr(cnp,3,1)) as data,
substr(cnp,4,1) as luna FROM universitate.persoana;
    -- 1.Experimentați folosirea operatorului EXPLAIN în câteva (min 4) din exercițiile rezolvate la temele anterioare.
    explain facultate;
    -- 2.Enumerați toate facultățile și specializările în același set de rezultate. Afișați denumirea lor și valoarea cheii principale. 
    -- Ordonați rezultatul într-o manieră alfabetică inversată în funcție de denumirea specializarii.
    SELECT id_facultate,denumire FROM universitate.facultate
union all
select id_specializare,denumire from specializare order by denumire desc ;-- iese cu duplicat nu e bun

SELECT specializare.denumire  as Specializare,
       facultate.denumire as facultate
       from specializare
       join facultate
       on facultate.id_facultate=specializare.id_facultate
-- 3.	Afișați toate notele distincte din baza de date și numărul de studenți care au luat notele respective.
-- ( Ex: 5 (nota), 200 (studenți) ). Formatați rezultatu    
select nota,count(id_student) as nr_student from nota
group by id_student;
-- 4.Identificați persoanele care fac parte din aceeași familie (au același nume și locuiesc la aceeași adresa. 
-- Grupați înregistrările din tabela persoane după nume și adresă. Afișați doar persoanele care locuiesc în București.
-- Inserati în tabela persoana înregistrări relevante pentru exemplificarea corectă a scenariului. Formatați rezultatul astfel:
select nume as nume_de_familie,adresa,count(nume) as membri from persoana
 group by nume and adresa
  having nume="Stefanescu" and adresa=" Strada Sibiului nr. 38"; -- and adresa;
 
 -- 1.	Listează ID-ul și numele specializărilor de la facultatea X (alege tu string-ul X).
 select specializare.id_facultate ,specializare.denumire 
 from specializare
 join facultate
 on specializare.id_facultate=facultate.id_facultate
 where facultate.denumire="Cardinal";
 -- 2.	Afișează numele specializării care are cele mai multe cursuri. (opțional, rezolvati prin doua metode)
 select specializare.denumire,count(specializare.id_specializare) as numar_cursuri 
 from specializare
 join materie
 on materie.id_specializare=specializare.id_specializare
group by materie.id_specializare;
 -- 3.Afișează un set de informații care să conțină următoarele: 
-- ●	numărul matricol al studentului
-- ●	numele studentului
-- ●	prenumele studentului
-- ●	numele specializării

  select student.nr_matricol,persoana.nume,persoana.prenume,specializare.denumire from student
  join persoana
  on persoana.cnp=student.cnp
  join specializare
  on specializare.id_specializare=student.id_specializare;
  
 -- 4.Afișează un set de informații care să conțină următoarele: 
-- ●	nota
-- ●	numele și prenumele studentului (într-o singură coloană)
-- ●	numele materiei pentru care a fost primită nota
SELECT nota.nota,concat(persoana.nume," ",persoana.prenume) as numele_student,materie.denumire FROM universitate.nota
join student
on nota.id_student=student.nr_matricol
join persoana
on student.cnp=persoana.cnp
join materie
on nota.id_curs=materie.id_materie;
-- 5.	Afișează numele și codul matricol al studentilor din anul 2 care au cel puțin o notă mai mică decât 5.
select persoana.nume as numele,student.nr_matricol from persoana
join student
on persoana.cnp=student.cnp
join nota
on nota.id_student= student.nr_matricol
where nota.nota>5 and student.semestru = 1 ;

-- 1.Listează ID-ul și denumirea specializărilor care aparțin facultăților fondate înainte de anul 1920
select denumire,id_specializare 
from specializare
where id_facultate in (select id_facultate from facultate where an_fondare >1920);
-- 2.Setează data examenului anul viitor, de ziua Europei, pentru toate notele corespunzătoare materiilor predate în anul 2 de studiu.

-- 5.Afișează numele și codul matricol al studentilor din anul 2 care au cel puțin o notă mai mică decât 5
select distinct(id_student) as cod_matric ,an_curent
from nota 
join student
on nota.id_student=student.nr_matricol
where nota<7 and an_curent=2;

-- lab partea 8 exercitiul 2
select student.nr_matricol,facultate.id_facultate from student 
join specializare on student.id_specializare=specializare.id_specializare
join facultate on specializare.id_facultate = facultate.id_facultate
order by facultate.denumire;
-- exercitiul 3
select persoana.nume,persoana.prenume,facultate.denumire,avg(nota.nota) as medie from persoana
join student on student.cnp=persoana.cnp
join specializare on  specializare.id_specializare =student.id_specializare
join facultate on facultate.id_facultate =specializare.id_facultate
join nota on nota.id_student =student.nr_matricol
 -- group by facultate.denumire
group by specializare.denumire
;
-- exercitiul 4
select materie.profesor,nota.data_examen from materie
join nota on nota.id_curs=materie.id_materie
where datediff(curdate(),data_examen) > 1825;

-- exercitiul 2 ce am facut lab la 17-12-2021
select student.nr_matricol as cod_matricol,specializare.id_facultate from student
 join specializare
 on specializare.id_specializare=student.id_specializare
 ;
 
 select * from nota where nota >6 ;

select * from student where nr_matricol not in(select distinct(nr_matricol) from nota where nota>= 5);