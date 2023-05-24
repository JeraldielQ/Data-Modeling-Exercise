DROP DATABASE IF EXISTS medical_center;
CREATE DATABASE medical_center;
\c medical_center

CREATE TABLE Doctor (
  doctor_id INT PRIMARY KEY,
  name VARCHAR(255),
  specialization VARCHAR(255),
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

CREATE TABLE Patient (
  patient_id INT PRIMARY KEY,
  name VARCHAR(255),
  date_of_birth DATE,
  address VARCHAR(255),
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

CREATE TABLE Visit (
  visit_id INT PRIMARY KEY,
  doctor_id INT,
  patient_id INT,
  visit_date DATE,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
  FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

CREATE TABLE Disease (
  disease_id INT PRIMARY KEY,
  name VARCHAR(255),
  description VARCHAR(255),
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

CREATE TABLE Diagnosis (
  diagnosis_id INT PRIMARY KEY,
  visit_id INT,
  disease_id INT,
  notes VARCHAR(255),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  FOREIGN KEY (visit_id) REFERENCES Visit(visit_id),
  FOREIGN KEY (disease_id) REFERENCES Disease(disease_id)
);
