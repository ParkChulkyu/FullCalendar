CREATE TABLE CREATECAL(
	ID VARCHAR2(1000) PRIMARY KEY,
	TITLE VARCHAR2(1000) NOT NULL,
	STARTDATE VARCHAR2(2000) NOT NULL, 
	ENDDATE VARCHAR2(2000) NOT NULL,
	COLOR VARCHAR2(1000) NOT NULL
);

SELECT * FROM CREATECAL;

DROP TABLE CREATECAL;

INSERT INTO CREATECAL VALUES ('박철규', '부산여행', 20200120, 20200122, 'red');