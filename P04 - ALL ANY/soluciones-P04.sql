-- 1. Obtener por orden alfabético los nombres de los empleados cuyo salario supera al máximo salario de los empleados 
-- del departamento 122.
SELECT nomem FROM empleados WHERE numde = "122";

-- 2. La misma consulta pero para el departamento 150. 
SELECT nomem FROM empleados WHERE numde = "150";

-- 3. Obtener por orden alfabético los nombres de los empleados cuyo salario supera en dos veces y media 
-- o más al mínimo salario de los empleados del departamento 122.

SELECT nomem FROM empleados WHERE salar >= (SELECT MIN(salar*2.5) FROM empleados WHERE numde = "122") ORDER BY nomem;

-- 4. Obtener los nombres y salarios de los empleados cuyo salario coincide con la comisión multiplicada por 10 
-- de algún otro o la suya propia - NO SALE NINGUNO Y SI HAY
-- selecciona el nombre y salario cuando el salario es igual a alguna comision por 10 de algun empleado (ANY)

SELECT nomem, salar FROM empleados WHERE salar = ANY (SELECT comis*10 FROM empleados);
 
-- 5. Obtener por orden alfabético los nombres y salarios de los empleados cuyo salario es superior a la comisión máxima existente multiplicada por 20.

SELECT nomem, salar FROM empleados WHERE salar > ANY (SELECT MAX(comis) FROM empleados) ORDER BY nomem;

-- 6. Obtener por orden alfabético los nombres y salarios de los empleados cuyo salario es inferior a veinte veces 
-- la comisión más baja existente.

SELECT nomem, salar FROM empleados WHERE salar < ANY (SELECT MIN(comis*20) FROM empleados);
