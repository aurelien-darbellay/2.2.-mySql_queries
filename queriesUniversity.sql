USE universidad;
/*Primer grupo*/
/*1*/
select apellido1, apellido2,nombre from persona where tipo = 'alumno' order by apellido1, apellido2, nombre asc; 
/*2*/
select apellido1, apellido2,nombre from persona where tipo = 'alumno' and telefono is null order by apellido1, apellido2, nombre asc; 
/*3*/
select apellido1, apellido2,nombre from persona where tipo = 'alumno' and YEAR(fecha_nacimiento) = 1999 order by apellido1, apellido2, nombre asc; 
/*4*/
select apellido1, apellido2,nombre,nif from persona where tipo = 'profesor' and telefono is null and nif regexp '[0-9]*K' order by apellido1, apellido2, nombre asc; 
/*5*/
select * from asignatura where cuatrimestre = 1 and curso = 3 and id_grado = 7;
/*6*/
select apellido1,apellido2, persona.nombre,departamento.nombre as Departamento from persona inner join profesor on persona.id = id_profesor inner join departamento on departamento.id = profesor.id_departamento order by apellido1, apellido2, persona.nombre;
/*7*/
select apellido1,apellido2, persona.nombre,departamento.nombre as Departamento from persona inner join profesor on persona.id = id_profesor inner join departamento on departamento.id = profesor.id_departamento order by apellido1, apellido2, persona.nombre asc;
/*8*/
select departamento.nombre as Departamento from profesor inner join departamento on departamento.id = profesor.id_departamento inner join asignatura on profesor.id_profesor = asignatura.id_profesor inner join grado on asignatura.id_grado = grado.id group by departamento.nombre;
/*9*/
select apellido1,apellido2,nombre from persona inner join alumno_se_matricula_asignatura on persona.id = id_alumno inner join curso_escolar on id_curso_escolar= curso_escolar.id where curso_escolar.anyo_inicio = 2014 group by apellido1,apellido2,nombre;
/*Segundo grupo*/
/*1*/
select departamento.nombre, apellido1,apellido2,persona.nombre from departamento right join profesor on departamento.id = profesor.id_departamento inner join persona on profesor.id_profesor = persona.id order by departamento.nombre, apellido1, apellido2, persona.nombre;
/*2*/
select id_profesor from profesor where profesor.id_departamento is NUll;
/*3*/
select departamento.nombre as NombreDepartamento from profesor right join departamento on departamento.id = profesor.id_departamento where id_profesor is null;
/*4*/
select persona.id, persona.nombre, apellido1, apellido2 from asignatura right join profesor on asignatura.id_profesor = profesor.id_profesor right join persona on persona.id = profesor.id_profesor where asignatura.id is null and persona.tipo = 'profesor';
/*5*/
select nombre from asignatura where asignatura.id_profesor is null;
/*6*/
select departamento.nombre from asignatura right join profesor on asignatura.id_profesor = profesor.id_profesor right join departamento  on departamento.id = profesor.id_departamento where asignatura.id is null group by departamento.nombre;
/*Tercer grupo*/
/*1*/
select count(id) as NumAlumnos from persona where tipo = 'alumno' group by tipo;
/*2*/
select count(id) as NumAlumnos1999 from persona where tipo = 'alumno' and YEAR(fecha_nacimiento) = 1999 group by tipo;
/*3*/
select departamento.nombre, count(id_profesor) as NumProfesores  from departamento right join profesor on departamento.id = profesor.id_departamento group by departamento.id order by count(id_profesor) asc;
/*4*/
select departamento.nombre, persona.nombre, persona.apellido1, persona.apellido2  from profesor right join persona on profesor.id_profesor = persona.id right join departamento on departamento.id = profesor.id_departamento order by departamento.nombre asc;
/*5*/
select grado.nombre, count(asignatura.id) as NumAsignaturas from asignatura right join grado on asignatura.id_grado = grado.id group by grado.id order by count(asignatura.id) desc;
/*6*/
select grado.nombre, count(asignatura.id) as NumAsignaturas from asignatura right join grado on asignatura.id_grado = grado.id group by grado.id having count(asignatura.id) >40 order by count(asignatura.id) desc;
/*7*/
select grado.nombre, asignatura.tipo, sum(asignatura.creditos) from asignatura left join grado on asignatura.id_grado = grado.id group by asignatura.tipo, grado.nombre;
/*8*/
select anyo_inicio, count(id_alumno) from alumno_se_matricula_asignatura right join curso_escolar on id_curso_escolar= curso_escolar.id group by curso_escolar.id;
/*9*/
select persona.id, persona.nombre, apellido1, apellido2, count(asignatura.id) NumAsignaturas from profesor inner join persona on profesor.id_profesor = persona.id left join asignatura  on persona.id = asignatura.id_profesor group by persona.id order by count(asignatura.id) desc;
/*10*/
select * from persona where fecha_nacimiento = (select max(fecha_nacimiento) from persona where tipo = 'alumno');
/*11*/
select persona.id, persona.nombre, apellido1, apellido2, departamento.nombre as NombreDepartamento from profesor inner join departamento on departamento.id = profesor.id_departamento inner join persona on profesor.id_profesor = persona.id left join asignatura on profesor.id_profesor = asignatura.id_profesor group by profesor.id_profesor having count(asignatura.id)= 0;





