-- run as ADMIN
BEGIN
    DBMS_NETWORK_ACL_ADMIN.append_host_ace(
        HOST   => 'api.openai.com',
        ace    =>
            xs$ace_type(privilege_list   => XS$name_list('http'),
                        principal_name   => 'user_oreilly_may27',
                        principal_type   => xs_acl.ptype_db));
END;

GRANT EXECUTE ON DBMS_CLOUD TO user_oreilly_may27;
GRANT EXECUTE ON DBMS_CLOUD_AI TO user_oreilly_may27;
