/* Ben & Jerry Trigger Example (no employee can make more than 10 times as much as the lowest paid employee)

from Dr. Phillips
*/

/* use
insert into employees
values ('11','Doe','John','M','ITEC','111-1111',420001);
to create error
insert into employees
values ('11','Doe','John','M','ITEC','111-1111',419999);
is ok
*/

set serveroutput on

CREATE OR REPLACE TRIGGER SalaryTrig
  BEFORE INSERT ON Employees
  FOR EACH ROW
DECLARE
  v_upper_sal_limit NUMBER(10,2);
  v_lower_sal_limit NUMBER(10,2);
BEGIN
  SELECT MIN(salary)*10 INTO v_upper_sal_limit
    FROM employees;
  SELECT MAX(salary)/10 INTO v_lower_sal_limit
    FROM employees;
  IF :new.salary NOT BETWEEN v_lower_sal_limit AND v_upper_sal_limit THEN
    RAISE_APPLICATION_ERROR(-20001,'salary out of allowed range');
  END IF;
END SalaryTrig;
/
show errors

