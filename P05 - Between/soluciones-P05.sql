-- 1. Obtener por orden alfabético los nombres de los empleados cuyo salario está entre 1500 € y 1600 €.-

SELECT nomem FROM empleados WHERE salar BETWEEN 1500 AND 1600 ORDER BY nomem;

-- 2. Obtener por orden alfabético los nombres y salarios de los empleados con comisión, 
-- cuyo salario dividido por su número de hijos cumpla una, o ambas, de las dos condiciones siguientes:
-- Que sea inferior de 720 €
-- Que sea superior a 50 veces su comisión.

SELECT nomem, salar FROM empleados WHERE salar NOT BETWEEN salar/numhi AND comis*50 ORDER BY nomem;
