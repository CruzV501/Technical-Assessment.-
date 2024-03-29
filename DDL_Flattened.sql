--DDL_Flattened

create or replace TABLE HAKKODA.FLATTENED.ADDRESS (
	ADDRESS_ID NUMBER(38,0),
	STREET VARCHAR(150),
	CITY VARCHAR(100),
	STATE VARCHAR(100),
	ZIP_CODE NUMBER(38,0)
);

create or replace TABLE HAKKODA.FLATTENED.CLIENT (
	CLIENT_ID NUMBER(38,0),
	CLIENT_NAME VARCHAR(150),
	CLIENT_LAST_NAME VARCHAR(150),
	EMAIL VARCHAR(150)
);

create or replace TABLE HAKKODA.FLATTENED.PRODUCT (
	PRODUCT_ID NUMBER(38,0),
	PRODUCT_NAME VARCHAR(150),
	CATEGORY VARCHAR(150),
    BRAND VARCHAR(150)
);

create or replace TABLE HAKKODA.FLATTENED.STORE (
	STORE_ID NUMBER(38,0),
	STORE_NAME VARCHAR(150),
	LOCATION VARCHAR(150)
);