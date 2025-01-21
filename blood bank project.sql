CREATE TABLE BloodDonors (
    donor_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob DATE,
    blood_type VARCHAR(3),
    phone VARCHAR(15),
    address VARCHAR(100),
    date_of_donation DATE
);

INSERT INTO BloodDonors (donor_id, first_name, last_name, dob, blood_type, phone, address, date_of_donation) VALUES
(1, 'John', 'Doe', '1990-04-15', 'A+', '1234567890', '123 Elm St', '2024-04-10'),
(2, 'Jane', 'Smith', '1985-02-28', 'O-', '0987654321', '456 Oak Ave', '2024-03-22'),
(3, 'Alice', 'Johnson', '1980-11-10', 'B+', '5551234567', '789 Pine Rd', '2024-02-05'),
(4, 'Bob', 'Brown', '1995-01-19', 'AB-', '3334445555', '321 Maple Dr', '2024-01-11'),
(5, 'Eve', 'Davis', '1992-07-30', 'A-', '6667778888', '654 Cedar Blvd', '2023-12-20');

CREATE TABLE BloodBags (
    bag_id INT PRIMARY KEY,
    donor_id INT,
    blood_type VARCHAR(3),
    donation_date DATE,
    expiry_date DATE,
    quantity_ml INT,
    status VARCHAR(20),
    FOREIGN KEY (donor_id) REFERENCES BloodDonors(donor_id)
);

INSERT INTO BloodBags (bag_id, donor_id, blood_type, donation_date, expiry_date, quantity_ml, status) VALUES
(1, 1, 'A+', '2024-04-10', '2024-07-10', 450, 'Available'),
(2, 2, 'O-', '2024-03-22', '2024-06-22', 450, 'Available'),
(3, 3, 'B+', '2024-02-05', '2024-05-05', 450, 'Available'),
(4, 4, 'AB-', '2024-01-11', '2024-04-11', 450, 'Available'),
(5, 5, 'A-', '2023-12-20', '2024-03-20', 450, 'Available');

CREATE TABLE BloodTransactions (
    transaction_id INT PRIMARY KEY,
    bag_id INT,
    transaction_date DATE,
    transaction_type VARCHAR(20),  -- "donation" or "issue"
    quantity INT,
    recipient_name VARCHAR(100),
    FOREIGN KEY (bag_id) REFERENCES BloodBags(bag_id)
);

INSERT INTO BloodTransactions (transaction_id, bag_id, transaction_date, transaction_type, quantity, recipient_name) VALUES
(1, 1, '2024-04-12', 'donation', 450, NULL),
(2, 2, '2024-03-23', 'donation', 450, NULL),
(3, 3, '2024-02-06', 'donation', 450, NULL),
(4, 4, '2024-01-12', 'donation', 450, NULL),
(5, 5, '2023-12-22', 'donation', 450, NULL);

-- Retrieve all donors' information
SELECT * FROM BloodDonors;

-- Retrieve all available blood bags
SELECT * FROM BloodBags WHERE status = 'Available';

-- Retrieve blood bags of a specific type
SELECT * FROM BloodBags WHERE blood_type = 'A+';

-- Check transaction details for a specific bag
SELECT * FROM BloodTransactions WHERE bag_id = 1;

-- Count of blood donations by blood type
SELECT blood_type, COUNT(*) FROM BloodBags GROUP BY blood_type;
insert into Student_details values (102,'Jayshri','Ahmednagar','2003-05-27','7028829782');

show tables;

help 'status';

ALTER TABLE BloodDonors
ADD COLUMN email VARCHAR(100);
desc table BloodDonors;

drop table BloodBags;

select * from BloodDonors;

truncate table BloodDonors;

UPDATE BloodBags
SET quantity_ml = 400
WHERE bag_id = 6;

DELETE FROM BloodBags
WHERE bag_id = 6;

SELECT * FROM BloodBags
WHERE status = 'Available';

INSERT INTO BloodBags (bag_id, donor_id, blood_type, donation_date, expiry_date, quantity_ml, status)
VALUES (6, 6, 'O+', '2024-04-15', '2024-07-15', 450, 'Available');

INSERT INTO BloodDonors (donor_id, first_name, last_name, dob, blood_type, phone, address, date_of_donation)
VALUES (6, 'George', 'Miller', '1987-08-14', 'O+', '5555555555', '1234 Sunset Blvd', '2024-04-15');

DROP TABLE IF EXISTS BloodBags;

CREATE TABLE BloodDonors (
    donor_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob DATE,
    blood_type VARCHAR(3),
    phone VARCHAR(15),
    address VARCHAR(100),
    date_of_donation DATE
);



TRUNCATE TABLE BloodBags;

SELECT donor_id, first_name, last_name, blood_type, phone
FROM BloodDonors;

SELECT bag_id, blood_type, donation_date, expiry_date, quantity_ml
FROM BloodBags
WHERE status = 'Available';


SELECT donor_id, first_name, last_name, blood_type
FROM BloodDonors
WHERE blood_type = 'O+';

SELECT blood_type, COUNT(*) AS number_of_bags
FROM BloodBags
WHERE status = 'Available'
GROUP BY blood_type;

SELECT transaction_id, transaction_date, transaction_type, quantity, recipient_name
FROM BloodTransactions
WHERE bag_id = 1;

SELECT donor_id, first_name, last_name, date_of_donation
FROM BloodDonors
WHERE date_of_donation > '2024-01-01';

SELECT blood_type, COUNT(*) AS donor_count
FROM BloodDonors
GROUP BY blood_type;

SELECT blood_type, MAX(donation_date) AS latest_donation
FROM BloodBags
GROUP BY blood_type;

SELECT bag_id, blood_type, donation_date, expiry_date
FROM BloodBags
WHERE expiry_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY);

SELECT donor_id, first_name, last_name, COUNT(*) AS donation_count
FROM BloodDonors
GROUP BY donor_id
HAVING donation_count > 1;

SELECT transaction_id, transaction_date, transaction_type, quantity, recipient_name
FROM BloodTransactions
WHERE bag_id = 2
ORDER BY transaction_date DESC
LIMIT 1;

SELECT b.bag_id, b.blood_type, b.donation_date, b.expiry_date, d.first_name, d.last_name
FROM BloodBags b
JOIN BloodDonors d ON b.donor_id = d.donor_id;

