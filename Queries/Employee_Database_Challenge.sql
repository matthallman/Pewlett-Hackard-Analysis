-- Challenge Module 7, Deliverable 1: The Number of Retiring Employees by Title
-- Retrieve three columns from the employees table.  
SELECT e.emp_no, 
	e.first_name, 
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as e
	INNER JOIN titles as ti
		ON (e.emp_no = ti.emp_no)
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

-- Print retirement_titles db
SELECT * FROM retirement_titles;

-- Use Dictinct On with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no)
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles 
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.from_date DESC;

--Print unique_title
SELECT * FROM unique_titles;

-- Retreive the number of titles from the unique_titles table.
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

-- Print retiring_titles
SELECT * FROM retiring_titles;


-- Challenge Module 7, Deliverable 2: Employees Eligible for Mentorship Program
-- Retirement Eligibility
DROP TABLE mentorship

SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name, 
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship
FROM employees as e
	INNER JOIN dept_emp as de
		ON (e.emp_no = de.emp_no)
	INNER JOIN titles as ti
		ON (e.emp_no = ti.emp_no)
WHERE de.to_date = '9999-01-01' 
	AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

-- Print mentorship db
SELECT * FROM mentorship;

-------------
SELECT COUNT(title), title
INTO mentorship_program
FROM mentorship
GROUP BY title
ORDER BY count DESC;

-- Print retiring_titles
SELECT * FROM mentorship_program;