CREATE DATABASE Transport
ON
(
	Name = 'Transport_data',
	FILENAME = 'A:\PROJECTS\DM_DBMS\LAB 3\Transport.mdf',
	SIZE = 10MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 5MB
)
LOG ON
(
	Name = 'Transport_log',
	FILENAME = 'A:\PROJECTS\DM_DBMS\LAB 3\Transport.ldf',
	SIZE = 5MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 5%
);
