/* This program will change lastname & firstname of the data you 
	insert or update to the Students table
from Dr. Phillips
*/

set serveroutput on

CREATE OR REPLACE TRIGGER UPPERCASE
  BEFORE INSERT OR UPDATE ON STUDENTS
  FOR EACH ROW
DECLARE
BEGIN
  :new.last := UPPER(:new.last);
  :new.first := UPPER(:new.first);
END UPPERCASE;
/
show errors
