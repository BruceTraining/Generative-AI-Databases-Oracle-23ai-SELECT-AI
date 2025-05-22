----------------------------------------------------------------------
-- 1) CUSTOMERS
----------------------------------------------------------------------
CREATE TABLE CUSTOMERS (
    CUSTOMER_ID          NUMBER, 
    FIRSTNAME            VARCHAR2(255),
    LASTNAME             VARCHAR2(255),
    ADDRESS_LINE1        VARCHAR2(255),
    ADDRESS_LINE2        VARCHAR2(255),
    ADDRESS_LINE3        VARCHAR2(255),
    CITY                 VARCHAR2(100),
    STATE                VARCHAR2(2),
    ZIP_CODE             VARCHAR2(20),
    COUNTRY              VARCHAR2(100),
    PHONE_NUMBER         VARCHAR2(20)
);

