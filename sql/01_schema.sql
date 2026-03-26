-- ============================================================
-- City Jail Database — Schema (MySQL compatible)
-- Course: CSC4710  |  Winter 2023
-- Original schema: Oracle SQL, adapted for MySQL
-- ============================================================

CREATE DATABASE IF NOT EXISTS city_jail;
USE city_jail;

-- Drop tables in reverse FK dependency order
DROP TABLE IF EXISTS prob_contact;
DROP TABLE IF EXISTS criminals_dw;
DROP TABLE IF EXISTS crime_charges;
DROP TABLE IF EXISTS crime_officers;
DROP TABLE IF EXISTS appeals;
DROP TABLE IF EXISTS crime_codes;
DROP TABLE IF EXISTS sentences;
DROP TABLE IF EXISTS crimes;
DROP TABLE IF EXISTS aliases;
DROP TABLE IF EXISTS officers;
DROP TABLE IF EXISTS prob_officers;
DROP TABLE IF EXISTS criminals;

-- -------------------------
-- Core entity tables
-- -------------------------

CREATE TABLE criminals (
    criminal_id INT          NOT NULL,
    last        VARCHAR(15),
    first       VARCHAR(10),
    street      VARCHAR(30),
    city        VARCHAR(20),
    state       CHAR(2),
    zip         CHAR(5),
    phone       CHAR(10),
    v_status    CHAR(1)      NOT NULL DEFAULT 'N',
    p_status    CHAR(1)      NOT NULL DEFAULT 'N',
    CONSTRAINT criminals_id_pk       PRIMARY KEY (criminal_id),
    CONSTRAINT criminals_vstatus_ck  CHECK (v_status IN ('Y','N')),
    CONSTRAINT criminals_pstatus_ck  CHECK (p_status IN ('Y','N'))
);

CREATE TABLE aliases (
    alias_id    INT          NOT NULL,
    criminal_id INT          NOT NULL,
    alias       VARCHAR(20),
    CONSTRAINT aliases_id_pk          PRIMARY KEY (alias_id),
    CONSTRAINT aliases_criminalid_fk  FOREIGN KEY (criminal_id)
        REFERENCES criminals(criminal_id)
);

CREATE TABLE prob_officers (
    prob_id INT          NOT NULL,
    last    VARCHAR(15),
    first   VARCHAR(10),
    street  VARCHAR(30),
    city    VARCHAR(20),
    state   CHAR(2),
    zip     CHAR(5),
    phone   CHAR(10),
    email   VARCHAR(30),
    status  CHAR(1)      NOT NULL DEFAULT 'A',
    mgr_id  INT,
    pager   CHAR(10),
    CONSTRAINT probofficers_id_pk      PRIMARY KEY (prob_id),
    CONSTRAINT probofficers_status_ck  CHECK (status IN ('A','I'))
);

CREATE TABLE officers (
    officer_id INT          NOT NULL,
    last       VARCHAR(15),
    first      VARCHAR(10),
    precinct   CHAR(4),
    badge      VARCHAR(14),
    phone      CHAR(10),
    status     CHAR(1)      NOT NULL DEFAULT 'A',
    CONSTRAINT officers_id_pk      PRIMARY KEY (officer_id),
    CONSTRAINT officers_status_ck  CHECK (status IN ('A','I'))
);

CREATE TABLE crime_codes (
    crime_code       INT          NOT NULL,
    code_description VARCHAR(30),
    CONSTRAINT crimecodes_code_pk  PRIMARY KEY (crime_code)
);

-- -------------------------
-- Transaction tables
-- -------------------------

CREATE TABLE crimes (
    crime_id        INT          NOT NULL,
    criminal_id     INT          NOT NULL,
    classification  CHAR(1)      NOT NULL DEFAULT 'U',
    date_charged    DATE,
    status          CHAR(2),
    hearing_date    DATE,
    appeal_cut_date DATE,
    date_recorded   TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT crimes_id_pk        PRIMARY KEY (crime_id),
    CONSTRAINT crimes_class_ck     CHECK (classification IN ('F','M','O','U')),
    CONSTRAINT crimes_status_ck    CHECK (status IN ('CL','CA','IA')),
    CONSTRAINT crimes_criminalid_fk FOREIGN KEY (criminal_id)
        REFERENCES criminals(criminal_id)
);

CREATE TABLE sentences (
    sentence_id INT     NOT NULL,
    criminal_id INT     NOT NULL,
    type        CHAR(1),
    prob_id     INT,
    start_date  DATE,
    end_date    DATE,
    violations  INT     DEFAULT 0,
    CONSTRAINT sentences_id_pk      PRIMARY KEY (sentence_id),
    CONSTRAINT sentences_crimeid_fk FOREIGN KEY (criminal_id)
        REFERENCES criminals(criminal_id),
    CONSTRAINT sentences_probid_fk  FOREIGN KEY (prob_id)
        REFERENCES prob_officers(prob_id),
    CONSTRAINT sentences_type_ck    CHECK (type IN ('J','H','P'))
);

CREATE TABLE appeals (
    appeal_id    INT     NOT NULL,
    crime_id     INT     NOT NULL,
    filing_date  DATE,
    hearing_date DATE,
    status       CHAR(1) NOT NULL DEFAULT 'P',
    CONSTRAINT appeals_id_pk      PRIMARY KEY (appeal_id),
    CONSTRAINT appeals_crimeid_fk FOREIGN KEY (crime_id)
        REFERENCES crimes(crime_id),
    CONSTRAINT appeals_status_ck  CHECK (status IN ('P','A','D'))
);

-- -------------------------
-- Junction / linking tables
-- -------------------------

CREATE TABLE crime_officers (
    crime_id   INT NOT NULL,
    officer_id INT NOT NULL,
    CONSTRAINT crimeofficers_pk          PRIMARY KEY (crime_id, officer_id),
    CONSTRAINT crimeofficers_crimeid_fk  FOREIGN KEY (crime_id)
        REFERENCES crimes(crime_id),
    CONSTRAINT crimeofficers_officerid_fk FOREIGN KEY (officer_id)
        REFERENCES officers(officer_id)
);

CREATE TABLE crime_charges (
    charge_id     INT            NOT NULL,
    crime_id      INT            NOT NULL,
    crime_code    INT            NOT NULL,
    charge_status CHAR(2),
    fine_amount   DECIMAL(7,2),
    court_fee     DECIMAL(7,2),
    amount_paid   DECIMAL(7,2),
    pay_due_date  DATE,
    CONSTRAINT crimecharges_id_pk      PRIMARY KEY (charge_id),
    CONSTRAINT crimecharges_crimeid_fk FOREIGN KEY (crime_id)
        REFERENCES crimes(crime_id),
    CONSTRAINT crimecharges_code_fk    FOREIGN KEY (crime_code)
        REFERENCES crime_codes(crime_code),
    CONSTRAINT crimecharges_status_ck  CHECK (charge_status IN ('PD','GL','NG'))
);

-- -------------------------
-- Lookup / reference tables
-- -------------------------

CREATE TABLE prob_contact (
    prob_cat  INT,
    low_amt   INT,
    high_amt  INT,
    con_freq  VARCHAR(20)
);

-- -------------------------
-- Data warehouse / staging
-- -------------------------

CREATE TABLE criminals_dw (
    criminal_id INT,
    last        VARCHAR(15),
    first       VARCHAR(10),
    street      VARCHAR(30),
    city        VARCHAR(20),
    state       CHAR(2),
    zip         CHAR(5),
    phone       CHAR(10),
    v_status    CHAR(1),
    p_status    CHAR(1)
);
