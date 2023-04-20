create table 진료과(
    과번호 INT NOT NULL,
    과이름 VARCHAR(20) NOT NULL,
    전화번호 CHAR(20),
    PRIMARY KEY(과번호)
);

create table 의사(
    의사번호 INT NOT NULL,
    이름 CHAR(10) NOT NULL,
    전화번호 CHAR(20),
    주소 CHAR(10),
    과번호 INT,
    PRIMARY KEY(의사번호),
    FOREIGN KEY(과번호) REFERENCES 진료과(과번호)
);

create table 간호사(
    간호사번호 INT NOT NULL,
    이름 CHAR(10) NOT NULL,
    전화번호 CHAR(20),
    주소 CHAR(10),
    과번호 INT,
    PRIMARY KEY (간호사번호),
    FOREIGN KEY(과번호) REFERENCES 진료과(과번호)
);

create table 환자(
    환자번호 INT NOT NULL,
    이름 CHAR(10) NOT NULL,
    전화번호 CHAR(20),
    주소 CHAR(10),
    주민등록번호 CHAR(20),
    신장 NUMBER(5,1),
    몸무게 NUMBER(5,1),
    혈액형 VARCHAR(4),
    성별 CHAR(6),
    처치일 DATE,
    처치내용 VARCHAR(20),
    간호사번호 INT,
    PRIMARY KEY (환자번호),
    FOREIGN KEY(간호사번호) REFERENCES 간호사(간호사번호),
    CHECK (혈액형 IN ('A','B','O','AB'))
);

create table 진료(
    진료번호 INT NOT NULL,
    진료일 DATE,
    의사번호 INT,
    환자번호 INT, 
    PRIMARY KEY(진료번호, 의사번호, 환자번호),
    FOREIGN KEY(의사번호) REFERENCES 의사(의사번호),
    FOREIGN KEY(환자번호) REFERENCES 환자(환자번호)
);

create table 입원(
    입원일 DATE NOT NULL,
    퇴원일 DATE,
    입원실 INT,
    환자번호 INT,
    PRIMARY KEY(환자번호, 입원일),
    FOREIGN KEY(환자번호) REFERENCES 환자(환자번호)
);

create table 진료내용(
    진료내용 VARCHAR(20) NOT NULL,
    환자번호 INT,
    PRIMARY KEY(진료내용, 환자번호),
    FOREIGN KEY(환자번호) REFERENCES 환자(환자번호)
);
