-- run as ADMIN
-- change the user permissions
SET DEFINE OFF;
GRANT RESOURCE TO user_oreilly_may27;
GRANT CREATE SESSION TO user_oreilly_may27;
GRANT CREATE VIEW TO user_oreilly_may27;
GRANT CREATE TABLE TO user_oreilly_may27;
GRANT CONNECT TO user_oreilly_may27;
GRANT ALTER SYSTEM TO user_oreilly_may27;
GRANT ALTER USER TO user_oreilly_may27;
ALTER USER user_oreilly_may27 QUOTA 10M ON temp;
GRANT CONSOLE_DEVELOPER TO user_oreilly_may27;
GRANT DWROLE TO user_oreilly_may27;
GRANT EXECUTE ON DBMS_CLOUD TO user_oreilly_may27;
GRANT EXECUTE ON DBMS_CLOUD_AI TO user_oreilly_may27;



