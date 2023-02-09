DROP TABLE IF EXISTS assignments ;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS Animals;
DROP TABLE IF EXISTS enclosures;

CREATE TABLE enclosures(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    capacity INT,
    closedForMaintenance BOOLEAN
);

INSERT INTO enclosures (name, capacity, closedForMaintenance) 
VALUES ('Big cat field', 20, false),
('Small cat field',30,false),
('Reptile field', 50, false),
('Bear field',10,false),
('Giraffe field', 20, true)
;



CREATE TABLE animals(
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    type VARCHAR,
    age INT,
    enclosure_id INT REFERENCES enclosures(id)
);

INSERT INTO animals (name, type, age, enclosure_id) 
VALUES 
('Tony','Tiger',59,1),
('Anna','Lion',10,1),
('Bob','Python',2,3),
('Claire','Lizard',5,3),
('Dina','Black bear',7,4),
('Emma','Brown bear',10,4),
('Finn', 'Giraffe',20,5),
('George','Giraffe',30,5),
('Hailey','Jungle cat',6,2),
('Isabella','Servals',4,2)
;


CREATE TABLE employees(
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    employeeNumber INT
);

INSERT INTO employees (name, employeeNumber) 
VALUES 
('Jack',123),
('Kate',456),
('Levi',789);


CREATE TABLE assignments(
    id SERIAL PRIMARY KEY,
    employeeId INT REFERENCES employees(id),
    enclosureId INT REFERENCES enclosures(id),
    day VARCHAR
);
INSERT INTO assignments (employeeId, enclosureId,day)
VALUES
(1,2,'Monday'),
(1,4,'Tuesday'),
(2,5,'Wednesday'),
(2,3,'Thursday'),
(3,1,'Friday')
;


