----------------------------------------------------------------------
-- 1) RESTAURANTS
----------------------------------------------------------------------
CREATE TABLE RESTAURANTS (
    RESTAURANT_ID        NUMBER
       GENERATED BY DEFAULT ON NULL AS IDENTITY
       CONSTRAINT PK_RESTAURANTS PRIMARY KEY,

    NAME                 VARCHAR2(255) NOT NULL,
       -- Removed unique constraint if it was there. Typically, different restaurants can share a name.

    AVERAGE_RATING       NUMBER(2,1)      DEFAULT 0,
    TOTAL_REVIEWS        NUMBER           DEFAULT 0,
    IS_UBER_ONE_ELIGIBLE CHAR(1)          DEFAULT 'N',

    ADDRESS_LINE1        VARCHAR2(255),
    ADDRESS_LINE2        VARCHAR2(255),
    ADDRESS_LINE3        VARCHAR2(255),
    CITY                 VARCHAR2(100),
    STATE                VARCHAR2(100),
    ZIP_CODE             VARCHAR2(20),
    COUNTRY              VARCHAR2(100),

    PHONE_NUMBER         VARCHAR2(20),

    CREATED_AT           DATE DEFAULT SYSDATE NOT NULL,
    UPDATED_AT           DATE
);

----------------------------------------------------------------------
-- 2) RESTAURANT_SCHEDULES
----------------------------------------------------------------------
CREATE TABLE RESTAURANT_SCHEDULES (
    SCHEDULE_ID          NUMBER
       GENERATED BY DEFAULT ON NULL AS IDENTITY
       CONSTRAINT PK_RESTAURANT_SCHEDULES PRIMARY KEY,

    RESTAURANT_ID        NUMBER NOT NULL
       CONSTRAINT FK_RESTAURANT_SCHEDULES_RESTAURANTS
       REFERENCES RESTAURANTS (RESTAURANT_ID),

    DAY_OF_WEEK          VARCHAR2(9)  DEFAULT 'Monday'    NOT NULL,
    MEAL_TYPE            VARCHAR2(50) DEFAULT 'Breakfast' NOT NULL,
    START_TIME           VARCHAR2(5)  DEFAULT '06:00'     NOT NULL,
    END_TIME             VARCHAR2(5)  DEFAULT '10:29'     NOT NULL
);

----------------------------------------------------------------------
-- 3) DELIVERY_OPTIONS
----------------------------------------------------------------------
CREATE TABLE DELIVERY_OPTIONS (
    DELIVERY_OPTION_ID   NUMBER
       GENERATED BY DEFAULT ON NULL AS IDENTITY
       CONSTRAINT PK_DELIVERY_OPTIONS PRIMARY KEY,

    RESTAURANT_ID        NUMBER NOT NULL
       CONSTRAINT FK_DELIVERY_OPTIONS_RESTAURANTS
       REFERENCES RESTAURANTS (RESTAURANT_ID),

    OPTION_TYPE          VARCHAR2(50) DEFAULT 'Delivery' NOT NULL,
    FEE                  NUMBER(6,2)  DEFAULT 0,
    MIN_PURCHASE         NUMBER(6,2)  DEFAULT 0,
    ETA_LOWER_BOUND      NUMBER(3)    DEFAULT 0,
    ETA_UPPER_BOUND      NUMBER(3)    DEFAULT 0
);

----------------------------------------------------------------------
-- 4) MENU_SECTIONS
----------------------------------------------------------------------
CREATE TABLE MENU_SECTIONS (
    SECTION_ID           NUMBER
       GENERATED BY DEFAULT ON NULL AS IDENTITY
       CONSTRAINT PK_MENU_SECTIONS PRIMARY KEY,

    RESTAURANT_ID        NUMBER NOT NULL
       CONSTRAINT FK_MENU_SECTIONS_RESTAURANTS
       REFERENCES RESTAURANTS (RESTAURANT_ID),

    SECTION_NAME         VARCHAR2(255) NOT NULL
);

----------------------------------------------------------------------
-- 5) MENU_ITEMS
--    No longer has UQ_MENU_ITEMS_NAME constraint on NAME
----------------------------------------------------------------------
CREATE TABLE MENU_ITEMS (
    ITEM_ID              NUMBER
       GENERATED BY DEFAULT ON NULL AS IDENTITY
       CONSTRAINT PK_MENU_ITEMS PRIMARY KEY,

    SECTION_ID           NUMBER NOT NULL
       CONSTRAINT FK_MENU_ITEMS_MENU_SECTIONS
       REFERENCES MENU_SECTIONS (SECTION_ID),

    NAME                 VARCHAR2(255) NOT NULL,
       -- Removed the UNIQUE constraint so duplicates are allowed

    BASE_PRICE           NUMBER(6,2)  DEFAULT 0 NOT NULL,
    CURRENCY             VARCHAR2(3)  DEFAULT 'USD' NOT NULL,
    CALORIES             NUMBER(5)    DEFAULT 0,

    POPULARITY_RANK      NUMBER(3),
    POPULARITY_LABEL     VARCHAR2(50),
    ORDERED_COUNT        NUMBER       DEFAULT 0,

    IMAGE_URL            VARCHAR2(255),
    DESCRIPTION          VARCHAR2(2000)
);

----------------------------------------------------------------------
-- 6) ITEM_OPTIONS
----------------------------------------------------------------------
CREATE TABLE ITEM_OPTIONS (
    OPTION_ID            NUMBER
       GENERATED BY DEFAULT ON NULL AS IDENTITY
       CONSTRAINT PK_ITEM_OPTIONS PRIMARY KEY,

    ITEM_ID              NUMBER NOT NULL
       CONSTRAINT FK_ITEM_OPTIONS_MENU_ITEMS
       REFERENCES MENU_ITEMS (ITEM_ID),

    OPTION_NAME          VARCHAR2(255) DEFAULT 'Regular' NOT NULL,
    ADDITIONAL_COST      NUMBER(6,2)   DEFAULT 0,
    CALORIE_CHANGE       NUMBER(5)     DEFAULT 0,
    POPULARITY_LABEL     VARCHAR2(50),
    ORDERED_COUNT        NUMBER        DEFAULT 0
);

----------------------------------------------------------------------
-- 7) PROMOTIONS
----------------------------------------------------------------------
CREATE TABLE PROMOTIONS (
    PROMOTION_ID         NUMBER
       GENERATED BY DEFAULT ON NULL AS IDENTITY
       CONSTRAINT PK_PROMOTIONS PRIMARY KEY,

    RESTAURANT_ID        NUMBER NOT NULL
       CONSTRAINT FK_PROMOTIONS_RESTAURANTS
       REFERENCES RESTAURANTS (RESTAURANT_ID),

    DESCRIPTION          VARCHAR2(32767),    -- or CLOB or VARCHAR2(4000)
    MIN_PURCHASE_AMOUNT  NUMBER(6,2) DEFAULT 0,
    DISCOUNT_AMOUNT      NUMBER(6,2) DEFAULT 0,
    START_DATE           DATE        DEFAULT SYSDATE,
    END_DATE             DATE
);

----------------------------------------------------------------------
-- 8) FEATURED_ITEMS
----------------------------------------------------------------------
CREATE TABLE FEATURED_ITEMS (
    FEATURED_ITEM_ID     NUMBER
       GENERATED BY DEFAULT ON NULL AS IDENTITY
       CONSTRAINT PK_FEATURED_ITEMS PRIMARY KEY,

    RESTAURANT_ID        NUMBER NOT NULL
       CONSTRAINT FK_FEATURED_ITEMS_RESTAURANTS
       REFERENCES RESTAURANTS (RESTAURANT_ID),

    ITEM_ID              NUMBER NOT NULL
       CONSTRAINT FK_FEATURED_ITEMS_MENU_ITEMS
       REFERENCES MENU_ITEMS (ITEM_ID),

    FEATURED_RANK        NUMBER(3),

    CONSTRAINT UQ_FEATURED_ITEMS UNIQUE (RESTAURANT_ID, ITEM_ID)
);
