--customer table
CREATE TABLE customer (
   customer_id SERIAL PRIMARY KEY,
   car_id INTEGER,
   first_name VARCHAR(50),
   last_name VARCHAR(50),
   address VARCHAR(200),
   billing VARCHAR(200),
   email VARCHAR(100),
   phone VARCHAR(20),
   car_id INTEGER NOT NULL,
 
  FOREIGN KEY (car_id) REFERENCES car_service_ticket_id(service_ticket_id)
);
	

--ticket services
CREATE TABLE car_service_ticket (
  service_ticket_id SERIAL PRIMARY KEY,
  customer_id INTEGER,
  car_id INTEGER,
  staff_id INTEGER,
  part_id INTEGER,
  service_id INTEGER,
  completed BOOLEAN,
  FOREIGN KEY (customer_id, car_id, staff_id, part_id, service_id) REFERENCES customer_id(customer_id)
);
--mechanic table
CREATE TABLE mechanic_services (
  service_id SERIAL PRIMARY KEY,
  service_price NUMERIC(8,2),
  staff_id INTEGER,
  part_id INTEGER,
  service_name VARCHAR(100),
  FOREIGN KEY (staff_id, part_id) REFERENCES customer_id(staff_id)
);
--car inventory
CREATE TABLE car_inventory (
  car_id SERIAL PRIMARY KEY,
  make VARCHAR(20),
  model VARCHAR(30),
  year_ VARCHAR(4),
  millage INTEGER,
  tuneup DATE,
  purchase_car BOOLEAN,
  service_car BOOLEAN,
  customer_id INTEGER,
  car_price NUMERIC(8,2),
  PRIMARY KEY (car_id),
  FOREIGN  KEY (customer_id) REFERENCES car_id(customer_id)
);
--parts table
CREATE TABLE parts(
  part_id SERIAL PRIMARY KEY,
  part_name VARCHAR(50),
  car_id INTEGER,
  part_price NUMERIC(8,2),
  service_ticket_id INTEGER,
  PRIMARY KEY (part_id),
  FOREIGN  KEY (car_id, service_ticket_id) REFERENCES part_id(service_ticket_id)
);
--staff table
CREATE TABLE staff (
  staff_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  staff_type VARCHAR(10),
  PRIMARY KEY (staff_id)
);
--service history
CREATE TABLE service_history (
  service_history_id SERIAL PRIMARY KEY,
  invoice_id INTEGER,
  customer_id INTEGER,
  car_id INTEGER,
  FOREIGN  KEY (customer_id, car_id, invoice_id) REFERENCES invoice(customer_id)
);

--invoice table
CREATE TABLE invoice (
  invoice_id SERIAL PRIMARY KEY,
  service_ticket_id INTEGER,
  customer_id INTEGER,
  car_id INTEGER,
  car_price NUMERIC(8,2),
  service_price NUMERIC(8,2),
  part_price NUMERIC(8,2),
  invoice_total NUMERIC(11,2),
  invoice_paid BOOLEAN,
  service_id INTEGER,
  staff_id INTEGER,
  FOREIGN KEY (service_ticket_id, customer_id, car_id, car_price, service_price, part_price, invoice_total, service_id, staff_id) REFERENCES customer_id(invoice_id)
);