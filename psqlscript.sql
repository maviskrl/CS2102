DROP TABLE IF EXISTS Users CASCADE;
DROP TABLE IF EXISTS Driver CASCADE;
DROP TABLE IF EXISTS Passenger CASCADE;
DROP TABLE IF EXISTS Admin CASCADE;
DROP TABLE IF EXISTS Verify CASCADE;
DROP TABLE IF EXISTS Car CASCADE;
DROP TABLE IF EXISTS Drives CASCADE;
DROP TABLE IF EXISTS Rides CASCADE;
DROP TABLE IF EXISTS Bids CASCADE;
DROP TABLE IF EXISTS Ratings CASCADE;
DROP TABLE IF EXISTS Favourites CASCADE;
DROP TABLE IF EXISTS Bookmarks CASCADE;

CREATE TABLE Users (
	username varchar(100),
	name varchar(100) NOT NULL,
	password varchar(100) NOT NULL,
	PRIMARY KEY (username)
);

CREATE TABLE Driver (
	username varchar(100) REFERENCES Users,
	name varchar(100) NOT NULL,
	PRIMARY KEY (username)
);

CREATE TABLE Passenger (
	username varchar(100) REFERENCES Users,
	name varchar(100) NOT NULL,
	PRIMARY KEY (username)
);

CREATE TABLE Admin (
	username varchar(100) REFERENCES Users,
	name varchar(100) NOT NULL,
	PRIMARY KEY (username)
);

CREATE TABLE Verify (
	auname varchar(100) REFERENCES Admin,
	duname varchar(100) REFERENCES Driver,
	since date
);

CREATE TABLE Car (
	plateNumber varchar(10) PRIMARY KEY,
	model varchar(100) NOT NULL,
	capacity integer NOT NULL
);

CREATE TABLE Drives (
	username varchar(100) NOT NULL UNIQUE,
	plateNumber varchar(10) NOT NULL UNIQUE,
	FOREIGN KEY (username) REFERENCES Driver,
	FOREIGN KEY (plateNumber) REFERENCES Car,
	PRIMARY KEY(username, plateNumber)
);

CREATE TABLE Rides (
	username varchar(100) NOT NULL REFERENCES Driver,
	pickup varchar(100) NOT NULL,
	dropoff varchar(100) NOT NULL,
	ride_date date NOT NULL,
	start_time time NOT NULL,
	PRIMARY KEY(username, pickup, dropoff, ride_date, start_time)
);

CREATE TABLE Bids (
	puname varchar(100) REFERENCES Passenger,
	duname varchar(100) REFERENCES Driver,
	pickup varchar(100) NOT NULL,
	dropoff varchar(100) NOT NULL,
	ride_date date NOT NULL,
	start_time time NOT NULL,
	FOREIGN KEY(duname, pickup, dropoff, ride_date, start_time) REFERENCES Rides,
	PRIMARY KEY(puname, duname, pickup, dropoff, ride_date, start_time),
	amount numeric,
	is_win boolean DEFAULT FALSE,
	CHECK (puname <> duname)
);

CREATE TABLE Ratings (
	puname varchar(100) REFERENCES Passenger,
	duname varchar(100) REFERENCES Driver,
	rating integer, 
	CHECK ((rating IS NULL) OR (rating >=0 AND rating <= 5)),
	PRIMARY KEY (puname, duname)
);

CREATE TABLE Favourites (
	pickup varchar(100),
	dropoff varchar(100),
	PRIMARY KEY (pickup, dropoff)
);

CREATE TABLE Bookmarks (
	puname varchar(100) REFERENCES Passenger,
	pickup varchar(100),
	dropoff varchar(100),
	FOREIGN KEY (pickup, dropoff) REFERENCES Favourites,
	PRIMARY KEY (puname, pickup, dropoff)
);