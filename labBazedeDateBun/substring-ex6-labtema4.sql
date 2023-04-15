SELECT cnp,concat(nume," ",prenume) as nume,
concat('1978',
'-',
substr(cnp,4,1),
'-',
substr(cnp,3,1)) as data,
substr(cnp,4,1) as luna FROM universitate.persoana;