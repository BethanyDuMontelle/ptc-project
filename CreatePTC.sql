/******************************************************/
/* Create the PTC Database 					      */
/* Bethany DuMontelle 						      */
/* 3/11/19 								      */
/******************************************************/

DROP DATABASE IF EXISTS PTC;

CREATE DATABASE PTC;

USE PTC;

/*INSERT INTO District VALUES (1, "");*/
/****************************************************/
CREATE TABLE District (
  district_id     TINYINT, 
  district_name   VARCHAR(16), 
  PRIMARY KEY(district_id)
);


/* id, name*/
INSERT INTO District VALUES (1, "St. Charles");
INSERT INTO District VALUES (2, "Orchard Farm");
INSERT INTO District VALUES (3, "Fort Zumwalt");
INSERT INTO District VALUES (4, "Francis Howell");
INSERT INTO District VALUES (5, "Lutheran");
INSERT INTO District VALUES (6, "Wentzville");
INSERT INTO District VALUES (7, "Christian");

/****************************************************/
CREATE TABLE School (
  school_id           TINYINT,
  school_name         VARCHAR(32),
  school_abbr         VARCHAR(3),
  school_district_id  TINYINT,
  PRIMARY KEY(school_id),
  FOREIGN KEY(school_district_id) REFERENCES District(district_id)
);

/* id, name, abbriviation, district id*/
INSERT INTO School VALUES(1, "St. Charles High", "SCH", 1);
INSERT INTO School VALUES(2, "St. Charles West", "SCW", 1);
INSERT INTO School VALUES(3, "Orchard Farm", "OF", 2);
INSERT INTO School VALUES(4, "Fort Zumwalt North", "FZN", 3);
INSERT INTO School VALUES(5, "Fort Zumwalt South", "FZS", 3);
INSERT INTO School VALUES(6, "Fort Zumwalt East", "FZE", 3);
INSERT INTO School VALUES(7, "Fort Zumwalt West", "FZW", 3);
INSERT INTO School VALUES(8, "Liberty", "WZL", 6);
INSERT INTO School VALUES(9, "Holt", "WZH", 6);
INSERT INTO School VALUES(10, "Timberland", "WZT", 6);
INSERT INTO School VALUES(11, "Francis Howell Central", "FHC", 4);
INSERT INTO School VALUES(12, "Francis Howell High", "FHH", 4);
INSERT INTO School VALUES(13, "Francis Howell North", "FHN", 4);
INSERT INTO School VALUES(14, "Christian High", "CH", 7);
INSERT INTO School VALUES(15, "Lutheran High", "LH", 5);

/****************************************************/
CREATE TABLE Staff (
  staff_id        TINYINT,
  staff_fname     VARCHAR(16),
  staff_lname     VARCHAR(20),
  staff_program   VARCHAR(4),
  staff_room      VARCHAR(10),
  /*staff_picture   LONGVARBINARY,*/
  staff_email     VARCHAR(32),
  staff_phone     VARCHAR(12),
  PRIMARY KEY(staff_id)
);

/* id, fname, lname, program, room, picture (later), email, phone*/
INSERT INTO Staff VALUES(1,"Thorin", "Schmidt", "CSD", "A107", 
                         "tschmidt@stcharlessd.org", "636-443-4987");
INSERT INTO Staff VALUES(2,"Robert", "Turner", "AST2", "A109", 
                         "roturner@stcharlessd.org", "636-443-4982");
INSERT INTO Staff VALUES(3,"Glenn", "Seithel", "AST1", "A108", 
                         "gseithel@stcharlessd.org", "636-443-4978");
INSERT INTO Staff VALUES(4,"Sean", "Crader", "ACR", "A106", 
                         "scrader@stcharlessd.org", "636-443-4984");
INSERT INTO Staff VALUES(5,"Casey", "Lober", "COU", "C101", 
                         "clober@stcharlessd.org", "636-443-4957");
INSERT INTO Staff VALUES(6,"Kristen", "Brent", "COU", "C103", 
                         "kbrent@stcharlessd.org", "636-443-4965");
INSERT INTO Staff VALUES(7,"Carla", "Johnson", "RES", "B102", 
                         "carjohnson@stcharlessd.org", "636-443-4971");
                         
/****************************************************/
CREATE TABLE Student (
  student_id                  INTEGER,
  student_fname               VARCHAR(16),
  student_lname               VARCHAR(20),
  staff_id                    TINYINT,
  /*student_picture            LONGVARBINARY,*/
  student_email               VARCHAR(32),
  student_isresource          BOOLEAN,
  /*student_resource_staff_id   TINYINT,
  student_counselor_staff_id  TINYINT,*/
  school_id      TINYINT,
  PRIMARY KEY(student_id),
  /*FOREIGN KEY(student_resource_staff_id) REFERENCES Staff(staff_id),
  FOREIGN KEY(student_counselor_staff_id) REFERENCES Staff(staff_id),*/
  FOREIGN KEY(staff_id) REFERENCES Staff(staff_id),
  FOREIGN KEY(school_id) REFERENCES School(school_id)  
);

/* id, fname, lname, teacher, email, resource?, resource counselor, counselor, home school*/
INSERT INTO Student VALUES(1, "John", "Smith", 1, "jsmith@stcharlessd.org", false, 9);
INSERT INTO Student VALUES(2, "Jane", "Doe",   3, "jdoe@stcharlessd.org", true, 7);
INSERT INTO Student VALUES(3, "Gary", "Snail", 4, "gasnail@stcharlessd.org", false, 11);
INSERT INTO Student VALUES(4, "Oswald", "Cobblepot", 1, "oswcobblepot@stcharlessd.org", true, 15);
INSERT INTO Student VALUES(5, "Obi Wan", "Kenobi", 2, "okenobi@stcharlessd.org", true, 2);
INSERT INTO Student VALUES(6, "Jar Jar", "Binks", 2, "jjbinks@stcharlessd.org", true, 10);
INSERT INTO Student VALUES(7, "Shaggy", "Rogers", 1, "srogers@stcharlessd.org", false, 11);
INSERT INTO Student VALUES(8, "Squidward", "Tentacles", 4, "stentacles@stcharlessd.org", true, 14);
INSERT INTO Student VALUES(9, "Sqwilliam", "Fancyson-Tentacles", 1, "sfancyson@stcharlessd.org", false, 14);

/****************************************************/
CREATE TABLE Guardian (
    guardian_id         INTEGER,
    guardian_fname      VARCHAR(16),
    guardian_lname      VARCHAR(20),
    guardian_address1    VARCHAR(32),
    guardian_address2   VARCHAR(32),
    guardian_city       VARCHAR(20),
    guardian_state      VARCHAR(2),
    guardian_ZIP        VARCHAR(5),
    guardian_email      VARCHAR(32),
    guardian_cell       VARCHAR(12),
    guardian_home_phone VARCHAR(12),
    PRIMARY KEY(guardian_id)
);

/*INSERT INTO Guardian VALUES(1, "Noh", "Tereal", "782 Yeet Street", NULL, "Oofville", "MO", "703089", "goodemail@att.net", "444-888-1616", "987-654-3210");*/
/*id, fname, lname, address1, address2, city, state, zip, email, cell, home phone*/
INSERT INTO Guardian VALUES(1, "Gerald", "Snail", "675 Foxtrot Ln", NULL, "Garden Grove", "CA", "92841", "gerald.snail@bikinibottom.gov", "555-903-5678", NULL);
INSERT INTO Guardian VALUES(2, "Qui Gon", "Jinn", "1600 Penn. Ave", NULL, "WA", "DC", "20500", "qgjinn@jediorder.org", "314-159-2653", NULL);
INSERT INTO Guardian VALUES(3, "Gay", "Bowser", "123 OWO Manor", NULL, "Moon Metropolis", "AL", "31019", "gaybowser@gmail.com", "636-123-4567", NULL);
INSERT INTO Guardian VALUES(4, "Noh", "Tereal", "782 Yeet St.", NULL, "Oofville", "MO", "70308", "goodemail@att.net", "444-888-1616", NULL);
INSERT INTO Guardian VALUES(5, "Bob", "Ross", "221B Baker St.", NULL, "O'Fallon", "MO", "63366", "thisisnotfake@gmail.com", "636-555-444", NULL);
INSERT INTO Guardian VALUES(1, "", "", "", "", "", "", "", "", "", "");
