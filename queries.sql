USE universidad;
/*Primer grupo*/
/*1*/
select apellido1, apellido2,nombre from persona
where tipo = 'alumno'
order by apellido1, apellido2, nombre asc; 
/*2*/
select apellido1, apellido2,nombre from persona
where tipo = 'alumno'
and telefono is null
order by apellido1, apellido2, nombre asc; 
/*3*/
select apellido1, apellido2,nombre from persona
where tipo = 'alumno'
and YEAR(fecha_nacimiento) = 1999
order by apellido1, apellido2, nombre asc; 
/*4*/
select apellido1, apellido2,nombre,nif from persona
where tipo = 'profesor'
and telefono is null
and nif regexp '[0-9]*K'
order by apellido1, apellido2, nombre asc; 
/*5*/
select * from asignatura
where cuatrimestre = 1
and curso = 3
and id_grado = 7;
/*6*/
select apellido1,apellido2, persona.nombre,departamento.nombre as Departamento from persona
inner join profesor
on persona.id = id_profesor
inner join departamento
on departamento.id = profesor.id_departamento
order by apellido1, apellido2, persona.nombre;
/*7*/
select apellido1,apellido2, persona.nombre,departamento.nombre as Departamento from persona
inner join profesor
on persona.id = id_profesor
inner join departamento
on departamento.id = profesor.id_departamento
order by apellido1, apellido2, persona.nombre asc;
/*8*/
select departamento.nombre as Departamento from profesor
inner join departamento
on departamento.id = profesor.id_departamento
inner join asignatura
on profesor.id_profesor = asignatura.id_profesor
inner join grado
on asignatura.id_grado = grado.id
group by departamento.nombre;
/*9*/
select apellido1,apellido2,nombre from persona
inner join alumno_se_matricula_asignatura
on persona.id = id_alumno
inner join curso_escolar
on id_curso_escolar= curso_escolar.id
where curso_escolar.anyo_inicio = 2014
group by apellido1,apellido2,nombre;
/*Segundo grupo*/
/*1*/
select departamento.nombre, apellido1,apellido2,persona.nombre from departamento
right join profesor
on departamento.id = profesor.id_departamento
inner join persona
on profesor.id_profesor = persona.id
order by departamento.nombre, apellido1, apellido2, persona.nombre;
/*2*/
select id_profesor from profesor
where profesor.id_departamento is NUll;
/*3*/
select count(id_profesor) as Numero_Profesores, departamento.nombre from departamento
right join profesor
on departamento.id = profesor.id_departamento
group by departamento.nombre
order by count(id_profesor) desc;

select * from curso_escolar;

