BEGIN
    DBMS_NETWORK_ACL_ADMIN.append_host_ace(
        HOST   => 'api.openai.com',
        ace    =>
            xs$ace_type(privilege_list   => XS$name_list('http'),
                        principal_name   => 'may13',
                        principal_type   => xs_acl.ptype_db));
END;

-- change the user permissions
SET DEFINE OFF;
GRANT RESOURCE TO may13;
GRANT CREATE SESSION TO may13;
GRANT CREATE VIEW TO may13;
GRANT CREATE TABLE TO may13;
GRANT CONNECT TO may13;
GRANT ALTER SYSTEM TO may13;
GRANT ALTER USER TO may13;
ALTER USER may13 QUOTA 10M ON temp;
GRANT CONSOLE_DEVELOPER TO may13;
GRANT DWROLE TO may13;
GRANT EXECUTE ON DBMS_CLOUD TO may13;
GRANT EXECUTE ON DBMS_CLOUD_AI TO may13;



