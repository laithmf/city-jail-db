-- ============================================================
-- City Jail Database — Seed Data
-- Course: CSC4710  |  Winter 2023
-- ============================================================

USE city_jail;

-- -------------------------
-- Crime codes
-- -------------------------
INSERT INTO crime_codes VALUES (301, 'Agg Assault');
INSERT INTO crime_codes VALUES (302, 'Auto Theft');
INSERT INTO crime_codes VALUES (303, 'Burglary-Business');
INSERT INTO crime_codes VALUES (304, 'Criminal Mischief');
INSERT INTO crime_codes VALUES (305, 'Drug Offense');
INSERT INTO crime_codes VALUES (306, 'Bomb Threat');

-- -------------------------
-- Probation officers
-- -------------------------
INSERT INTO prob_officers (prob_id, last, first, city, status, mgr_id)
    VALUES (100, 'Peek',    'Susan',  'Virginia Beach', 'A', NULL);
INSERT INTO prob_officers (prob_id, last, first, city, status, mgr_id)
    VALUES (102, 'Speckle', 'Jeff',   'Virginia Beach', 'A', 100);
INSERT INTO prob_officers (prob_id, last, first, city, status, mgr_id)
    VALUES (104, 'Boyle',   'Chris',  'Virginia Beach', 'A', 100);
INSERT INTO prob_officers (prob_id, last, first, city, status, mgr_id)
    VALUES (106, 'Taps',    'George', 'Chesapeake',     'A', NULL);
INSERT INTO prob_officers (prob_id, last, first, city, status, mgr_id)
    VALUES (108, 'Ponds',   'Terry',  'Chesapeake',     'A', 106);
INSERT INTO prob_officers (prob_id, last, first, city, status, mgr_id)
    VALUES (110, 'Hawk',    'Fred',   'Chesapeake',     'I', 106);

-- -------------------------
-- Officers
-- -------------------------
INSERT INTO officers VALUES (111112, 'Shocks', 'Pam',   'OCVW', 'E5546A33', '7574446767', 'A');
INSERT INTO officers VALUES (111113, 'Busey',  'Gerry', 'GHNT', 'E5577D48', '7574446767', 'A');
INSERT INTO officers VALUES (111114, 'Gants',  'Dale',  'SBCH', 'E5536N02', '7574446767', 'A');
INSERT INTO officers VALUES (111115, 'Hart',   'Leigh', 'WAVE', 'E5511J40', '7574446767', 'A');
INSERT INTO officers VALUES (111116, 'Sands',  'Ben',   'OCVW', 'E5588R00', '7574446767', 'I');

-- -------------------------
-- Criminals
-- -------------------------
INSERT INTO criminals VALUES (1020, 'Phelps',    'Sam',   '1105 Tree Lane',    'Virginia Beach', 'VA', '23510', '7576778484', 'Y', 'N');
INSERT INTO criminals VALUES (1021, 'Sums',      'Tammy', '22 E. Ave',         'Virginia Beach', 'VA', '23510', '7575453390', 'N', 'Y');
INSERT INTO criminals VALUES (1022, 'Caulk',     'Dave',  '8112 Chester Lane', 'Chesapeake',     'VA', '23320', '7578403690', 'N', 'Y');
INSERT INTO criminals VALUES (1023, 'Dabber',    'Pat',   NULL,                'Chesapeake',     'VA', '23320', NULL,         'N', 'N');
INSERT INTO criminals VALUES (1024, 'Perry',     'Cart',  NULL,                'Norfolk',        'VA', '26501', NULL,         'N', 'Y');
INSERT INTO criminals VALUES (1025, 'Cat',       'Tommy', NULL,                'Norfolk',        'VA', '26503', NULL,         'N', 'Y');
INSERT INTO criminals VALUES (1026, 'Simon',     'Tim',   NULL,                'Norfolk',        'VA', '26503', NULL,         'N', 'Y');
INSERT INTO criminals VALUES (1027, 'Pints',     'Reed',  NULL,                'Norfolk',        'VA', '26505', NULL,         'N', 'Y');
INSERT INTO criminals VALUES (1028, 'Mansville', 'Nancy', NULL,                'Norfolk',        'VA', '26505', NULL,         'N', 'Y');
INSERT INTO criminals VALUES (1029, 'Statin',    'Penny', NULL,                'Norfolk',        'VA', '26505', NULL,         'N', 'Y');
INSERT INTO criminals VALUES (1030, 'Panner',    'Lee',   NULL,                'Norfolk',        'VA', '26505', NULL,         'N', 'Y');

-- -------------------------
-- Aliases
-- -------------------------
INSERT INTO aliases VALUES (100, 1020, 'Bat');
INSERT INTO aliases VALUES (101, 1022, 'Cabby');

-- -------------------------
-- Crimes
-- -------------------------
INSERT INTO crimes (crime_id, criminal_id, classification, date_charged, status, hearing_date, appeal_cut_date)
    VALUES (10085, 1020, 'F', '2008-09-03', 'CA', '2008-09-15', '2008-12-15');
INSERT INTO crimes (crime_id, criminal_id, classification, date_charged, status, hearing_date, appeal_cut_date)
    VALUES (10086, 1021, 'M', '2008-10-20', 'CL', '2008-12-05', NULL);
INSERT INTO crimes (crime_id, criminal_id, classification, date_charged, status, hearing_date, appeal_cut_date)
    VALUES (10087, 1022, 'M', '2008-10-30', 'IA', '2008-12-05', '2009-03-15');
INSERT INTO crimes (crime_id, criminal_id, classification, date_charged, status, hearing_date, appeal_cut_date)
    VALUES (10088, 1023, 'O', '2008-11-05', 'CA', NULL,         NULL);
INSERT INTO crimes (crime_id, criminal_id, classification, date_charged, status, hearing_date, appeal_cut_date)
    VALUES (10089, 1025, 'M', '2008-10-22', 'CA', '2008-11-25', '2009-02-15');
INSERT INTO crimes (crime_id, criminal_id, classification, date_charged, status, hearing_date, appeal_cut_date)
    VALUES (10090, 1026, 'M', '2008-10-22', 'CA', '2008-11-25', '2009-02-15');
INSERT INTO crimes (crime_id, criminal_id, classification, date_charged, status, hearing_date, appeal_cut_date)
    VALUES (10091, 1027, 'M', '2008-10-24', 'CA', '2008-11-28', '2009-02-15');
INSERT INTO crimes (crime_id, criminal_id, classification, date_charged, status, hearing_date, appeal_cut_date)
    VALUES (10092, 1028, 'M', '2008-10-24', 'CA', '2008-11-28', '2009-02-15');
INSERT INTO crimes (crime_id, criminal_id, classification, date_charged, status, hearing_date, appeal_cut_date)
    VALUES (10093, 1024, 'M', '2008-10-22', 'CA', '2008-11-25', '2009-02-15');
INSERT INTO crimes (crime_id, criminal_id, classification, date_charged, status, hearing_date, appeal_cut_date)
    VALUES (10094, 1029, 'M', '2008-10-26', 'CA', '2008-11-26', '2009-02-17');
INSERT INTO crimes (crime_id, criminal_id, classification, date_charged, status, hearing_date, appeal_cut_date)
    VALUES (25344031, 1030, 'M', '2008-10-26', 'CA', '2008-11-26', '2009-02-17');
INSERT INTO crimes (crime_id, criminal_id, classification, date_charged, status, hearing_date, appeal_cut_date)
    VALUES (25344060, 1030, 'M', '2008-11-18', 'CL', '2008-11-26', NULL);

-- -------------------------
-- Crime charges
-- -------------------------
INSERT INTO crime_charges VALUES (5000, 10085,    301, 'GL', 3000.00, 200.00,  40.00,  '2008-10-15');
INSERT INTO crime_charges VALUES (5001, 10085,    305, 'GL', 1000.00, 100.00,  NULL,   '2008-10-15');
INSERT INTO crime_charges VALUES (5002, 10086,    304, 'GL',  200.00, 100.00,  25.00,  '2009-02-15');
INSERT INTO crime_charges VALUES (5003, 10087,    305, 'GL',  100.00,  50.00, 150.00,  '2009-03-15');
INSERT INTO crime_charges VALUES (5004, 10088,    306, 'PD',    NULL,   NULL,   NULL,  NULL);
INSERT INTO crime_charges VALUES (5005, 10089,    305, 'GL',  100.00,  50.00,  NULL,   '2009-02-15');
INSERT INTO crime_charges VALUES (5006, 10090,    305, 'GL',  100.00,  50.00,  NULL,   '2009-02-15');
INSERT INTO crime_charges VALUES (5007, 10091,    305, 'GL',  100.00,  50.00,  20.00,  '2009-02-15');
INSERT INTO crime_charges VALUES (5008, 10092,    305, 'GL',  100.00,  50.00,  25.00,  '2009-02-15');
INSERT INTO crime_charges VALUES (5009, 10093,    305, 'GL',  100.00,  50.00,  NULL,   '2009-02-15');
INSERT INTO crime_charges VALUES (5010, 10094,    305, 'GL',   50.00,  50.00,  NULL,   '2009-02-17');
INSERT INTO crime_charges VALUES (5011, 25344031, 305, 'GL',   50.00,  50.00,  NULL,   '2009-02-17');
INSERT INTO crime_charges VALUES (5012, 25344060, 305, 'GL',   50.00,  50.00, 100.00,  '2009-02-17');

-- -------------------------
-- Sentences
-- -------------------------
INSERT INTO sentences VALUES (1000, 1020, 'J', NULL, '2008-09-15', '2010-09-15', 0);
INSERT INTO sentences VALUES (1001, 1021, 'P', 102,  '2008-12-05', '2009-06-05', 0);
INSERT INTO sentences VALUES (1002, 1022, 'P', 108,  '2009-03-20', '2009-08-20', 0);
INSERT INTO sentences VALUES (1003, 1024, 'P', 106,  '2008-12-20', '2009-03-20', 1);
INSERT INTO sentences VALUES (1004, 1025, 'P', 106,  '2008-12-20', '2009-03-20', 0);
INSERT INTO sentences VALUES (1005, 1026, 'P', 106,  '2008-12-20', '2009-03-20', 0);
INSERT INTO sentences VALUES (1006, 1027, 'P', 106,  '2008-12-20', '2009-03-20', 0);
INSERT INTO sentences VALUES (1007, 1028, 'P', 106,  '2008-12-20', '2009-03-20', 0);
INSERT INTO sentences VALUES (1008, 1029, 'P', 106,  '2008-12-20', '2009-02-05', 1);
INSERT INTO sentences VALUES (1009, 1030, 'P', 106,  '2008-12-20', '2009-02-05', 1);
INSERT INTO sentences VALUES (1010, 1030, 'P', 106,  '2009-02-06', '2009-07-06', 0);

-- -------------------------
-- Crime officers (junction)
-- -------------------------
INSERT INTO crime_officers VALUES (10085,    111112);
INSERT INTO crime_officers VALUES (10086,    111114);
INSERT INTO crime_officers VALUES (10087,    111115);
INSERT INTO crime_officers VALUES (10088,    111115);
INSERT INTO crime_officers VALUES (10089,    111115);
INSERT INTO crime_officers VALUES (10090,    111115);
INSERT INTO crime_officers VALUES (10091,    111115);
INSERT INTO crime_officers VALUES (10092,    111115);
INSERT INTO crime_officers VALUES (10093,    111115);
INSERT INTO crime_officers VALUES (10094,    111115);
INSERT INTO crime_officers VALUES (25344031, 111115);
INSERT INTO crime_officers VALUES (10089,    111116);
INSERT INTO crime_officers VALUES (25344060, 111116);

-- -------------------------
-- Appeals
-- -------------------------
INSERT INTO appeals VALUES (7500, 10087, '2008-12-10', '2008-12-20', 'A');
INSERT INTO appeals VALUES (7501, 10086, '2008-12-15', '2008-12-20', 'A');
INSERT INTO appeals VALUES (7502, 10085, '2008-09-20', '2008-10-28', 'A');

-- -------------------------
-- Probation contact schedule
-- -------------------------
INSERT INTO prob_contact VALUES (10, 1,   80,  'Weekly');
INSERT INTO prob_contact VALUES (20, 81,  160, 'Every 2 weeks');
INSERT INTO prob_contact VALUES (30, 161, 500, 'Monthly');

-- -------------------------
-- Data warehouse seed
-- -------------------------
INSERT INTO criminals_dw VALUES (1020, 'Phelps', 'Sam',   '1105 Tree Lane',    'Virginia Beach', 'VA', '23510', '7576778484', 'Y', 'N');
INSERT INTO criminals_dw VALUES (1021, 'Sums',   'Tammy', '22 E. Ave',         'Virginia Beach', 'VA', '23510', '7575453390', 'N', 'Y');
INSERT INTO criminals_dw VALUES (1022, 'Caulk',  'Dave',  '8112 Chester Lane', 'Chesapeake',     'VA', '23320', '7578403690', 'N', 'Y');
INSERT INTO criminals_dw VALUES (1023, 'Dabber', 'Pat',   NULL,                'Chesapeake',     'VA', '23320', NULL,         'N', 'N');
INSERT INTO criminals_dw VALUES (1024, 'Perry',  'Cart',  '11 New St.',        'Surry',          'VA', '54501', NULL,         'N', 'Y');
INSERT INTO criminals_dw VALUES (1025, 'Cat',    'Tommy', NULL,                'Norfolk',        'VA', '26503', '7578889393', 'N', 'Y');
