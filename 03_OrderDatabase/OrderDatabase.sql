CREATE TABLE CUSTOMERS(
    CUSTNO INT,
    CNAME VARCHAR2(50),
    CITY VARCHAR2(50),
    PRIMARY KEY(CUSTNO)
    );

CREATE TABLE ORDERS(
    ORDERNO INT,
    ODATE DATE,
    CUSTNO INT,
    ORD_AMT INT,
    PRIMARY KEY(ORDERNO),
    FOREIGN KEY(CUSTNO) REFERENCES CUSTOMERS(CUSTNO)
    );

CREATE TABLE ITEM(
    ITEMNO INT,
    UNIT_PRICE INT,
    PRIMARY KEY(ITEMNO)
    );

CREATE TABLE ORDER_ITEM(
    ORDERNO INT,
    ITEMNO INT,
    QTY INT,
    PRIMARY KEY(ORDERNO, ITEMNO),
    FOREIGN KEY(ORDERNO) REFERENCES ORDERS(ORDERNO),
    FOREIGN KEY(ITEMNO) REFERENCES ITEM(ITEMNO)
    );

CREATE TABLE WAREHOUSE(
    WAREHOUSENO INT,
    CITY VARCHAR2(50),
    PRIMARY KEY(WAREHOUSENO)
    );

CREATE TABLE SHIPMENT(
    ORDERNO INT,
    WAREHOUSENO INT,
    SHIP_DATE DATE,
    PRIMARY KEY(ORDERNO, WAREHOUSENO),
    FOREIGN KEY(ORDERNO) REFERENCES ORDERS(ORDERNO),
    FOREIGN KEY(WAREHOUSENO) REFERENCES WAREHOUSE(WAREHOUSENO)
    );

INSERT INTO CUSTOMERS VALUES(&CUSTNO, '&CNAME', '&CITY');
INSERT INTO ORDERS VALUES(&ORDERNO, '&ODATE', &CUSTNO, &ORD_AMT);
INSERT INTO ITEM VALUES(&ITEMNO, &UNIT_PRICE);
INSERT INTO ORDER_ITEM VALUES(&ORDERNO, &ITEMNO, &QTY);
INSERT INTO WAREHOUSE VALUES(&WAREHOUSENO, '&CITY');
INSERT INTO SHIPMENT VALUES(&ORDERNO, &WAREHOUSENO, '&SHIP_DATE');

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;
SELECT * FROM ITEM;
SELECT * FROM ORDER_ITEM;
SELECT * FROM WAREHOUSE;
SELECT * FROM SHIPMENT;
