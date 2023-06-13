/* 
If you plan to change the values of some fileds of a table - mutating a table,
then follow the suggestions below:
1. use BEFORE trigger
2. change the :new buffer values (for insert/update)

See the following example: update or insert upper-case values into a table

For debugging any trigger, use dbms_output.put_line
*/
set serveroutput on

CREATE OR REPLACE TRIGGER StudentData
  BEFORE INSERT OR UPDATE ON STUDENTS
  FOR EACH ROW
DECLARE
BEGIN
  /*
	DBMS_OUTPUT.put_line('Last Name='||v_last);
	DBMS_OUTPUT.put_line('old last=' || :OLD.last);
	DBMS_OUTPUT.put_line('new first=' || :NEW.first);
	DBMS_OUTPUT.put_line('old middle=' || :OLD.middle);
	DBMS_OUTPUT.put_line('new middle=' || :NEW.middle);
	DBMS_OUTPUT.put_line('old major=' || :OLD.major);
	DBMS_OUTPUT.put_line('new major=' || :NEW.major);
  */
  :new.last := InitCap(:new.last);
  :new.first := InitCap(:new.first);
  :new.middle := Substr(Upper(:new.middle),1,1);
  :new.major := substr(upper(:new.major),1,4);
  /*
	DBMS_OUTPUT.put_line('Last Name='||v_last);
	DBMS_OUTPUT.put_line('old last=' || :OLD.last);
	DBMS_OUTPUT.put_line('new first=' || :NEW.first);
	DBMS_OUTPUT.put_line('old middle=' || :OLD.middle);
	DBMS_OUTPUT.put_line('new middle=' || :NEW.middle);
	DBMS_OUTPUT.put_line('old major=' || :OLD.major);
	DBMS_OUTPUT.put_line('new major=' || :NEW.major);
  */
END;
/
show errors

