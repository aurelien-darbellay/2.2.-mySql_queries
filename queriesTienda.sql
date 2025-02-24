use tienda;
/*1*/
select nombre from producto;
/*2*/
select nombre, precio from producto;
/*3*/
select * from producto;
/*4*/
select nombre, precio, ROUND(precio * 1.05, 2) as precio_dollar from producto;
/*5*/
select nombre as nom_de_producte, precio as euros, ROUND(precio * 1.05, 2) as dollars from producto;
/*6*/
select upper(nombre), precio from producto;
/*7*/
select lower(nombre), precio from producto;
/*8*/
select nombre, upper(substr(nombre,1,2)) from fabricante;
/*9*/
select nombre, round(precio) from producto;
/*10*/
select nombre, truncate(precio,0) from producto;
/*11*/
select fabricante.codigo from fabricante inner join producto on fabricante.codigo = codigo_fabricante;
/*12*/
select fabricante.codigo from fabricante inner join producto on fabricante.codigo = codigo_fabricante group by fabricante.codigo;
/*13*/
select nombre from fabricante order by nombre asc;
/*14*/
select nombre from fabricante order by nombre desc;
/*15*/
select nombre, precio from producto order by nombre asc, precio desc;
/*16*/
select * from fabricante limit 5;
/*17*/
select * from fabricante limit 3,2;
/*18*/
select nombre, precio from producto order by precio asc limit 1;
/*19*/
select nombre, precio from producto order by precio desc limit 1;
/*20*/
select producto.nombre from producto right join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.codigo = 2;
/*21*/
select producto.nombre, precio, fabricante.nombre from producto left join fabricante on producto.codigo_fabricante = fabricante.codigo;
/*22*/
select producto.nombre, precio, fabricante.nombre from producto left join fabricante on producto.codigo_fabricante = fabricante.codigo order by fabricante.nombre asc;
/*23*/
select producto.codigo, producto.nombre,fabricante.nombre from producto left join fabricante on producto.codigo_fabricante = fabricante.codigo;
/*24*/
select producto.nombre, precio, fabricante.nombre from producto left join fabricante on producto.codigo_fabricante = fabricante.codigo order by precio asc limit 1;
/*25*/
select producto.nombre, precio, fabricante.nombre from producto left join fabricante on producto.codigo_fabricante = fabricante.codigo order by precio desc limit 1;
/*26*/
select producto.nombre from producto left join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = 'Lenovo';
/*27*/
select producto.nombre from producto left join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = 'Crucial' and precio >200;
/*28*/
select producto.nombre from producto left join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = 'Asus' or fabricante.nombre = 'Hewlett-Packard' or fabricante.nombre = 'Seagate';
/*29*/
select producto.nombre from producto left join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre IN('Asus', 'Hewlett-Packard','Seagate');
/*30*/
select producto.nombre, precio from producto left join fabricante on producto.codigo_fabricante = fabricante.codigo where substring(fabricante.nombre, -1) = 'e';
/*31*/
select producto.nombre, precio from producto left join fabricante on producto.codigo_fabricante = fabricante.codigo where locate('w',fabricante.nombre) > 0;
/*32*/
select producto.nombre, precio, fabricante.nombre from producto left join fabricante on producto.codigo_fabricante = fabricante.codigo where precio >=180 order by precio desc, producto.nombre asc;
/*33*/
select fabricante.codigo, fabricante.nombre from producto left join fabricante on producto.codigo_fabricante = fabricante.codigo group by fabricante.nombre, fabricante.codigo;
/*34*/
select fabricante.codigo, fabricante.nombre, producto.nombre from producto right join fabricante on producto.codigo_fabricante = fabricante.codigo;
/*35*/
select fabricante.codigo, fabricante.nombre from producto right join fabricante on producto.codigo_fabricante = fabricante.codigo where producto.codigo is null;
/*36*/
select producto.codigo, producto.nombre from producto left join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = 'Lenovo';
/*37*/
select * from producto where precio = (select max(precio) from producto left join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = 'Lenovo');
/*38*/
select producto.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = 'Lenovo' and precio = ( select max(precio) from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = 'Lenovo') limit 1;
/*39*/
select producto.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = 'Hewlett-Packard' and precio = ( select min(precio) from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = 'Hewlett-Packard' ) limit 1;
/*40*/
select producto.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where precio >= (select precio from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = 'Lenovo' and precio = ( select max(precio) from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = 'Lenovo') limit 1);
/*41*/
select producto.codigo, producto.nombre from producto  inner join fabricante on fabricante.codigo = producto.codigo_fabricante where fabricante.nombre = 'Asus' and precio > (select sum(producto.precio)/count(producto.codigo) from producto inner join fabricante on fabricante.codigo = producto.codigo_fabricante where fabricante.nombre = 'Asus');









