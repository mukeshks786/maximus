
/*Write a query in SQL to display all departments including those where does not have any employee*/

SELECT COUNT(employees.department_id) AS total,departments.department_name FROM employees RIGHT JOIN departments ON  employees.department_id=departments.department_id 
GROUP BY department_name HAVING total=0

/*Write a query in SQL to display the first and last name and salary for those employees who earn less than 
the employee earn whose number is 192*/

SELECT  first_name,last_name,salary FROM employees WHERE salary < (SELECT salary FROM employees WHERE employee_id='192')

/*Write a query in SQL to display the first name, last name, and department number for those employees 
who works in the same department as the employee who holds the first name as John*/

SELECT COUNT(E.first_name),E.first_name , E.last_name , E.department_id FROM employees AS E GROUP BY first_name,department_id 
HAVING first_name='John'

/*
Write a query in SQL to display the job title, department name, full name (first and last name ) of employee, 
and starting date for all the jobs which started on or after 1st January, 1993 and ending with on or before 31 August, 1997
*/
SELECT  CONCAT_WS(' ',e.first_name,e.last_name) AS `full name`,hire_date FROM employees AS e WHERE hire_date BETWEEN
'1993-01-1' AND '1997-08-31'

/*Write a query in SQL to display job title, full name (first and last name ) of employee, and the difference between maximum salary for the job and salary of the employee*/

SELECT job_title,CONCAT_WS(' ',first_name,last_name) AS `full name`,salary,max_salary-salary AS diff FROM employees JOIN jobs ON  employees.job_id=jobs.job_id;




