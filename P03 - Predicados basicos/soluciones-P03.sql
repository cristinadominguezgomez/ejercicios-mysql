-- 1. Obtener una relación por orden alfabético de los departamentos cuyo presupuesto es inferior a 30.000 € 
-- El nombre de los departamentos vendrá precedido de las palabras 'DEPARTAMENTO DE '. 
-- Nota: El presupuesto de los departamentos viene expresado en miles de €.
-- **Nota:** Si da problemas probar sin preceder con Departamento. Lo aclaramos en clase
SELECT numde, numce, direc, tidir, CONCAT(presu, " €") presupuesto, depde, CONCAT("DEPARTAMENTO DE ", nomde) departamento 
FROM departamentos WHERE presu < 30.000 ORDER BY nomde;

-- 2. Muestra el número y el nombre de cada departamento separados por un guión 
-- y en un mismo campo llamado “Número-Nombre”, además del tipo de director mostrado como “Tipo de Director”, 
-- para aquellos departamentos con presupuesto inferior a 30.000 €.

SELECT CONCAT(numde," - ",nomde) "Número-Nombre", tidir "Tipo de Director" FROM departamentos WHERE presu < 30.000;

-- 3. Suponiendo que en los próximos dos años el coste de vida va a aumentar un 8% anual 
-- y que se suben los salarios solo un 2% anual, hallar para los empleados con más de 4 hijos su nombre 
-- y su sueldo anual, actual y para cada uno de los próximos dos años, clasificados por orden alfabético. 
-- Las columas deben llamarse 'Nombre', 'Salario Hoy', 'Salario +1 año', 'Salario +2 años'

SELECT nomem "Nombre", salar "Salario Hoy", @s1 := ROUND((salar + (salar*2/100)), 2) "Salario +1 año", ROUND((@s1 + (@s1*2/100)), 2) "Salario +2 años" FROM empleados WHERE numhi > 4;

-- 4. Hallar, por orden alfabético, los nombres de los empleados tales que si se les da una gratificación de 120 € 
-- por hijo, el total de esta gratificación supera el 20% de su salario.

SELECT nomem FROM empleados WHERE @grat := (120*numhi) > (salar*20/100) ORDER BY nomem;



-- 5. Para los empleados del departamento 112 hallar el nombre y el salario total (salario más comisión), 
-- por orden de salario total decreciente, y por orden alfabético dentro de salario total.

SELECT nomem, IFNULL(salar, 0) + IFNULL(comis, 0) "Salario Total" FROM empleados WHERE numde = 112;

-- 6. Vemos que para Micaela no se muestra nada en Salario Total, esto es debido a que su comisión es Nula (Lo que no significa que sea 0--> significa que no se ha introducido ningún valor). 
-- Esto impide hacer el cálculo de la suma. Muestra entonces la misma consulta anterior pero sólo para aquellos empleados cuya comisión no sea nula.
 SELECT nomem, (salar + comis) "Salario Total" FROM empleados WHERE numde = 112 AND comis IS NOT NULL;
 
-- 7. Repite la consulta anterior para mostrarla con un € al lado del salario total.:
 SELECT nomem, CONCAT((salar + comis)," €") "Salario Total" FROM empleados WHERE numde = 112 AND comis IS NOT NULL;

-- 8. En una campaña de ayuda familiar se ha decidido dar a los empleados una paga extra de 60 € por hijo, 
-- a partir del cuarto inclusive. Obtener por orden alfabético para estos empleados: nombre y salario total 
-- que van a cobrar incluyendo esta paga extra. Mostrarlo con simbolo de €..
SELECT nomem, CONCAT((salar +(60*numhi)), " €") salario_total FROM empleados WHERE numhi >= 4 ORDER BY nomem;

-- 9. Introducción a SELECT subordinado. Imaginemos la misma consulta anterior, pero en la que se nos pide 
-- mostrar los mismos campos pero para aquellos empleados cuyo número de hijos iguale o supere a los de Juliana. 
-- Es decir, Juliana tiene 4 hijos pero no lo sabemos. Lo que sabemos es el nombre. 
-- En este caso haremos otro SELECT cuyo resultado de la búsqueda sea el número de hijos de Juliana.

SELECT nomem, CONCAT((salar +(60*numhi)), " €") salario_total FROM empleados 
WHERE numhi >= (SELECT numhi FROM empleados WHERE nomem = "JULIANA") ORDER BY nomem;

-- 10. Obtener por orden alfabético los nombres de los empleados cuyos sueldos igualan o superan 
-- al de CLAUDIA en más del 15%.

SELECT nomem FROM empleados WHERE salar >= (SELECT (salar + (salar*15/100)) FROM empleados WHERE numem = "420")
ORDER BY nomem;

-- 11. Obtener los nombres de los departamentos que no dependen funcionalmente de otro.
SELECT nomde FROM departamentos WHERE ISNULL(depde);