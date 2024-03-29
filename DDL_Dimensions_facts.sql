--DDL_Dimensions/Fact

create or replace TABLE HAKKODA.MODELED.DIM_ADDRESS (
	ADDRESS_ID NUMBER(38,0),
	STREET VARCHAR(150),
	CITY VARCHAR(100),
	STATE VARCHAR(100),
	ZIP_CODE NUMBER(38,0)
);

create or replace TABLE HAKKODA.MODELED.DIM_CLIENT (
	CLIENT_ID NUMBER(38,0),
	CLIENT_NAME VARCHAR(150),
	CLIENTE_LAST_NAME VARCHAR(150),
	EMAIL VARCHAR(150)
);

create or replace TABLE HAKKODA.MODELED.DIM_PRODUCT (
    PRODUCTKEY varchar(16777216),
	PRODUCT_ID NUMBER(38,0),
	PRODUCT_NAME VARCHAR(150),
	CATEGORY VARCHAR(150),
    BRAND VARCHAR(150)
);

create or replace TABLE HAKKODA.MODELED.DIM_STORE (
    STORE_KEY varchar(16777216),
	STORE_ID NUMBER(38,0),
	STORE_NAME VARCHAR(150),
	LOCATION VARCHAR(150)
);

create or replace table fact_Sales
(
    STORE_ID varchar(16777216),
    PRODUCT_KEY varchar(16777216),
    CLIENT_ID number,
    ZIP_CODE number,
    TRANSACTION_ID number,
    QUANTITY_OF_SOLD_ITEMS number,
    UNIT_PRICE number(38,15),
    DISCOUNT number(38,2)
);