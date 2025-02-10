SELECT
  emp.firstName,
  emp.lastName,
  man.firstName,
  man.lastName
FROM employee AS emp
LEFT JOIN employee AS man
ON emp.managerId = man.employeeId