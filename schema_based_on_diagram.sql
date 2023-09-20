CREATE DATABASE clinic;

CREATE TABLE patients (id SERIAL PRIMARY KEY, Name VARCHAR(255), date_of_birth date);
CREATE TABLE invoices (id SERIAL PRIMARY KEY, Total_amount DECIMAL, Generated_at TIMESTAMP, Paid_at TIMESTAMP, Medical_history_id INT);
CREATE TABLE Medical_histories (id SERIAL PRIMARY KEY, Admitted_at TIMESTAMP, patient_id INT, Status VARCHAR(255));
CREATE TABLE invoice_items (id SERIAL PRIMARY KEY, Unit_price DECIMAL, Quantity INT, Total_price DECIMAL, Invoice_id INT, treatment_id INT);
CREATE TABLE treatment (id SERIAL PRIMARY KEY, type VARCHAR, Name VARCHAR(255));

ALTER TABLE invoice_items ADD CONSTRAINT fk_invoices FOREIGN KEY (Invoice_id) REFERENCES invoices(id);
ALTER TABLE invoice_items ADD CONSTRAINT fk_treatments FOREIGN KEY (treatment_id) REFERENCES treatment(id);
ALTER TABLE invoices ADD CONSTRAINT fk_medical_histories FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id);
ALTER TABLE medical_histories ADD CONSTRAINT fk_medical FOREIGN KEY (patient_id) REFERENCES patients(id);

CREATE TABLE patient_treatments (
    treatments_id SERIAL PRIMARY KEY,
    medical_history_id INT,
    treatment_id INT,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
    FOREIGN KEY (treatment_id) REFERENCES treatment(id)
);
