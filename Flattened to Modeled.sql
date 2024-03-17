--Flattened to Modeled

--DIM_CLIENT
insert into HAKKODA.MODELED.DIM_CLIENT
select t.client_id, client_name, client_last_name, email
from (
        select *, row_number() over (partition by client_id order by client_id, client_name) rnk
        from client
    )t
where t.rnk=1;

--DIM_ADDRESS
insert into HAKKODA.MODELED.DIM_ADDRESS
select ADDRESS_ID, STREET,CITY, STATE,ZIP_CODE
from (
        select *, row_number() over (partition by ZIP_CODE order by ADDRESS_ID) rnk
        from ADDRESS
    )t
where t.rnk=1;

--DIM_PRODUCT
insert into HAKKODA.MODELED.DIM_PRODUCT
select MD5(concat(ifnull(product_name,'N/A'),category, brand)) as PRODUCT_KEY,PRODUCT_ID,  
        ifnull(product_name,'N/A') as product_name, CATEGORY,  BRAND
from PRODUCT
GROUP BY PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND;

--DIM_STORE
insert into HAKKODA.MODELED.DIM_STORE
select STORE_ID,  
        ifnull(STORE_NAME,'N/A') as STORE_NAME, LOCATION
from STORE
GROUP BY STORE_ID, STORE_NAME, LOCATION;

--FACT_Sales

insert into HAKKODA.MODELED.FACT_SALES
select STORE_ID, 
    MD5(concat(ifnull(product_name,'N/A'),category, brand)) as PRODUCT_KEY,
    CLIENT_ID, 
    ZIP_CODE, 
    TRANSACTION_ID, 
    QUANTITY_OF_ITEMS_SOLD, 
    UNIT_PRICE,
    DISCOUNT
from HAKKODA.LANDING.TRANSACTIONS;