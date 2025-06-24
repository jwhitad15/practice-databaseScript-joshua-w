-- MODOULE: Database Design, Practice 1: Generating a Database Script

START TRANSACTION;

DROP TABLE IF EXISTS toothpaste, toothbrushes, customers;

CREATE TABLE toothpaste (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    brand VARCHAR(20) NOT NULL,
    toothpaste_name VARCHAR(31) NOT NULL
);

CREATE TABLE toothbrushes (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    brand VARCHAR(20) NOT NULL,
    toothbrush_model VARCHAR(31) NOT NULL
);

CREATE TABLE customers (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
    toothpaste_id INT NOT NULL REFERENCES toothpaste(id),
    toothbrush_id INT REFERENCES toothbrush(id)
);

INSERT INTO toothpaste (brand, toothpaste_name) VALUES 
	('Colgate', 'Optic White'),
    ('Colgate', 'Cavity Protection'),
    ('Vicco', 'Neem'),
    ('Sensodyne', 'Clinical White Intensive Clean');
    
INSERT INTO toothbrushes (brand, toothbrush_model) VALUES
	('Oral-B', 'Fresh & Clean'),
    ('Oral-B', 'IO Series 10'),
    ('Colgate', 'Cibaca Supreme'),
    ('Great Value', 'Value Brush');
    
INSERT INTO customers (first_name, last_name, toothpaste_id, toothbrush_id) VALUES 
	('Bill', 'Gates', 1, 2),
    ('Steve', 'Jobs', 4, 1),
    ('Steve', 'Wozniak', 2, 3),
    ('Jeff', 'Bezos', 3, 4),
    ('Elon', 'Musk', 2, null);

-- ROLLBACK
COMMIT;
