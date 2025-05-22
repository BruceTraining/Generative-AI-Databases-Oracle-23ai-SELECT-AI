BEGIN
   --  DBMS_CLOUD.drop_credential('CREDENTIAL_OPENAI');
  DBMS_CLOUD.create_credential(
    credential_name => 'CREDENTIAL_OPENAI',
    username        => 'OPENAI', 
    password        => '<your_api_token>'
  );
END;