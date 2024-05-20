use Transport;

CREATE TABLE depot(
	id INT IDENTITY(1,1) PRIMARY KEY,
	number int UNIQUE NOT NULL
);

CREATE TABLE route(
	id INT IDENTITY(1,1) PRIMARY KEY,
	number int UNIQUE NOT NULL
);

CREATE TABLE transport(
	id INT IDENTITY(1,1) PRIMARY KEY,
	route_id INT REFERENCES route(id),
	type VARCHAR(20) NOT NULL,
	gov_num varchar(8) NOT NULL,
	CONSTRAINT chk_gov_num CHECK (gov_num LIKE '[0-9][0-9][0-9][0-9][A-Z][A-Z][-][0-9]'),
	brand varchar(20),
	capacity int NOT NULL CHECK(capacity > 0),
	bus_num DECIMAL(4,0) UNIQUE
);

CREATE TABLE depot_transport(
	depot_id INT REFERENCES depot(id),
	transport_id INT REFERENCES transport(id),
	PRIMARY KEY(depot_id, transport_id)
);

CREATE TABLE driver(
	id INT IDENTITY(1,1) PRIMARY KEY,
	transport_id INT REFERENCES transport(id),
	name VARCHAR(50) NOT NULL,
	phone varchar(13) NOT NULL,
	CONSTRAINT chk_phone CHECK(phone LIKE '[+][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	categories varchar(21)
);

CREATE TABLE stop(
	id INT IDENTITY(1,1) PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	x INT NOT NULL,
	y INT NOT NULL
);

CREATE TABLE route_stop(
	route_id INT REFERENCES route(id),
	stop_id INT REFERENCES stop(id),
	stop_number INT NOT NULL,
	PRIMARY KEY(route_id, stop_id)
);