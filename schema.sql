-- Challenge Code: Deliverable 1: The Number of Retiring Employees by Title

--Create a retirement titles table 
SELECT e.emp_no,
e.first_name, 
e.last_name,
ti.title,
ti.from_date,
ti.to_date
INTO retirement_title
FROM employees as e
INNER JOIN titles as ti 
ON e.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

--Create a unique retirement titles table - this time with distinct on 
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title 
INTO unique_titles
FROM retirement_title
WHERE (to_date = '9999-01-01')
ORDER BY emp_no;

--Create a retiring titles table
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

-- Challenge Code: Deliverable 2: The Employees Eligible for the Mentorship Program
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, 
de.from_date, de.to_date, ti.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de 
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (de.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

