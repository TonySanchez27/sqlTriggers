/* This program will log into table called MAJ_AUDIT the action of 
	Insert/Delete/Update the field Major of the Students table
from Dr. Phillips
*/

set serveroutput on

CREATE OR REPLACE TRIGGER LOGSTUDENTCHANGES
  BEFORE INSERT OR DELETE OR UPDATE of Major ON STUDENTS
  FOR EACH ROW
DECLARE
  v_ChangeType CHAR(1);
  v_sid varchar2(10);
BEGIN
  IF INSERTING THEN
     V_ChangeType := 'I';
     v_sid := :new.sid;
  ELSIF UPDATING THEN
     V_ChangeType := 'U';
     v_sid := :new.sid;
  ELSE
     V_ChangeType := 'D';
     v_sid := :old.sid;
  END IF;

  INSERT INTO MAJ_AUDIT (change_type, changed_by, current_timestamp,
   	SID, old_major, new_major)
   	VALUES (v_ChangeType, USER, SYSDATE, v_sid, :old.major, :new.major);
END LOGSTUDENTCHANGES;
/
show errors
