-- Flyway baseline for employees, audit_logs, users
-- Source: Flyway docs (community plugin for Spring Boot)

CREATE TABLE IF NOT EXISTS users (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  role VARCHAR(20) NOT NULL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE IF NOT EXISTS employees (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  full_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  phone VARCHAR(32) NULL,
  department VARCHAR(100) NULL,
  title VARCHAR(100) NULL,
  hire_date DATE NOT NULL,
  status VARCHAR(16) NOT NULL,
  salary DECIMAL(12,2) NOT NULL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL,
  INDEX idx_emp_department (department),
  INDEX idx_emp_status (status),
  INDEX idx_emp_title (title)
);

CREATE TABLE IF NOT EXISTS audit_logs (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  employee_id BIGINT NOT NULL,
  action VARCHAR(64) NOT NULL,
  actor VARCHAR(255) NOT NULL,
  details TEXT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_audit_employee FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE
);


