-- TASK 1
-- Find names of all employees who have sold over 50,000

SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.emp_id IN (
		SELECT works_with.emp_id
        FROM works_with
        WHERE works_with.total_sales > 50000
	);
    
-- TASK 2
-- Find all clients who are handles by the branch that Michael Scott manages
-- Assume you know Michael's ID

SELECT client.client_name 
FROM client
WHERE client.branch_id IN (
		SELECT branch.branch_id
        FROM branch
        WHERE branch.mgr_id = 102
	);

-- TASK 3
-- Find all clients who are handles by the branch that Michael Scott manages
-- Assume you DONT'T know Michael's ID

SELECT client.client_name 
FROM client 
WHERE client.branch_id = (
		SELECT branch.branch_id 
        FROM branch
        WHERE branch.mgr_id = (	
			SELECT employee.emp_id 
            FROM employee
            WHERE employee.first_name = 'Michael'
				AND employee.last_name = 'Scott'
         )
	);
    
-- TASK 4
-- Find the names of employees who work with clients handled by the scranton branch

SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.emp_id in (
		SELECT works_with.emp_id
        FROM works_with
        WHERE works_with.client_id in (
			SELECT client.client_id 
			FROM client
			WHERE client.branch_id = (
					SELECT branch.branch_id
					FROM branch
					WHERE branch.branch_name = 'Scranton'
				)
        )
	);
    
-- TASK 5
-- Find the names of all clients who have spent more than 100,000 dollars

SELECT client.client_name 
FROM client
WHERE client.client_id IN (
			SELECT client_id
			FROM (
				SELECT SUM(works_with.total_sales) as sum_total_sales, client_id
				FROM works_with
				GROUP BY client_id) as no_thing
			WHERE sum_total_sales > 100000
        );

SELECT client.client_name
FROM client
WHERE client.client_id IN (
                          SELECT client_id
                          FROM (
                                SELECT SUM(works_with.total_sales) AS totals, client_id
                                FROM works_with
                                GROUP BY client_id) as ducss
                          WHERE totals > 100000
);

    