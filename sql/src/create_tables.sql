DROP TABLE WORK_EXPR;
DROP TABLE EDUCATIONAL_DETAILS;
DROP TABLE MESSAGE;
DROP TABLE CONNECTION_USR;
DROP TABLE USR;

CREATE TABLE USR
(
	userId VARCHAR(10) UNIQUE NOT NULL,
	password VARCHAR(10) NOT NULL,
	email TEXT NOT NULL,
	name CHAR(50),
	dateOfBirth DATE,
	PRIMARY KEY (userId)
);

CREATE TABLE WORK_EXPR
(
	userId CHAR(10) NOT NULL,
	company CHAR(50) NOT NULL,
	role CHAR(50) NOT NULL,
	location CHAR(50),
	startDate DATE,
	endDate DATE,
	PRIMARY KEY(userId,company,role,startDate),
	FOREIGN KEY (userId) REFERENCES USR(userId)
	    ON DELETE CASCADE -- If user is deleted, no longer need User's work experience
);

CREATE TABLE EDUCATIONAL_DETAILS
(
	userId CHAR(10) NOT NULL,
	instituitionName CHAR(50) NOT NULL,
	major CHAR(50) NOT NULL,
	degree CHAR(50) NOT NULL,
	startdate DATE,
	enddate DATE,
	PRIMARY KEY(userId,major,degree)
	FOREIGN KEY (userId) REFERENCES USR(userId)
	    ON DELETE CASCADE -- If user is deleted, no longer need User's work experience
);

CREATE TABLE MESSAGE
(
	msgId INTEGER UNIQUE NOT NULL,
	senderId CHAR(10) NOT NULL,
	receiverId CHAR(10) NOT NULL,
	contents CHAR(500) NOT NULL,
	sendTime TIMESTAMP,
	deleteStatus INTEGER,
	status CHAR(30) NOT NULL,
	PRIMARY KEY(msgId),
    FOREIGN KEY (senderId) REFERENCES USR(userId)
        ON DELETE NO ACTION , -- Cannot set to NULL because of requirements. We cannot delete CASCADE because of requirements, other user may want to see!
    FOREIGN KEY (receiverId) REFERENCES USR(userId)
        ON DELETE NO ACTION  -- Cannot set to NULL because of requirements. We cannot delete CASCADE because of requirements, other user may want to see!
);

CREATE TABLE CONNECTION_USR
(
	userId CHAR(10) NOT NULL,
	connectionId CHAR(10) NOT NULL,
	status CHAR(30) NOT NULL,
	PRIMARY KEY(userId,connectionId),
    FOREIGN KEY (userId) REFERENCES USR(userId)
    	ON DELETE CASCADE, -- CASCADE to remove "CONNECTION" between both entities (since one no longer exists)
    FOREIGN KEY (connectionId) REFERENCES USR(userId)
    	ON DELETE CASCADE -- CASCADE to remove "CONNECTION" between both entities (since one no longer exists)

);