-- run as ADMIN
-- change the user permissions
SET DEFINE OFF;
GRANT RESOURCE TO user_oreilly_may25;
GRANT CREATE SESSION TO user_oreilly_may25;
GRANT CREATE VIEW TO user_oreilly_may25;
GRANT CREATE TABLE TO user_oreilly_may25;
GRANT CONNECT TO user_oreilly_may25;
GRANT ALTER SYSTEM TO user_oreilly_may25;
GRANT ALTER USER TO user_oreilly_may25;
ALTER USER user_oreilly_may25 QUOTA 10M ON temp;
GRANT CONSOLE_DEVELOPER TO user_oreilly_may25;
GRANT DWROLE TO user_oreilly_may25;
GRANT EXECUTE ON DBMS_CLOUD TO user_oreilly_may25;
GRANT EXECUTE ON DBMS_CLOUD_AI TO user_oreilly_may25;



