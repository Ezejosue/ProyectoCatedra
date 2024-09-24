CREATE DATABASE IF NOT EXISTS db_bank;

-- Use the database
USE db_bank;

-- Create Users table (General table for all types of users)
CREATE TABLE User
(
    id_user   BIGINT AUTO_INCREMENT PRIMARY KEY,
    name      VARCHAR(100)                                                                   NOT NULL,
    DUI       VARCHAR(10)                                                                    NOT NULL UNIQUE,
    user_type ENUM ('customer', 'dependent', 'cashier', 'branch_manager', 'general_manager') NOT NULL,
    salary    DECIMAL(10, 2)
);

-- Create Customer table (inherits from User)
CREATE TABLE Customer
(
    id_customer  BIGINT PRIMARY KEY,
    num_accounts TINYINT DEFAULT 0,
    FOREIGN KEY (id_customer) REFERENCES User (id_user)
);

-- Create Dependent table (inherits from User)
CREATE TABLE Dependent
(
    id_dependent               BIGINT PRIMARY KEY,
    commission_per_transaction DECIMAL(5, 2) DEFAULT 5.00,
    FOREIGN KEY (id_dependent) REFERENCES User (id_user)
);

-- Create Employee table (inherits from User)
CREATE TABLE Employee
(
    id_employee     BIGINT PRIMARY KEY,
    employee_status ENUM ('active', 'inactive') NOT NULL,
    FOREIGN KEY (id_employee) REFERENCES User (id_user)
);

-- Create Cashier table (inherits from Employee)
CREATE TABLE Cashier
(
    id_cashier BIGINT PRIMARY KEY,
    FOREIGN KEY (id_cashier) REFERENCES Employee (id_employee)
);

-- Create Branch Manager table (inherits from Employee)
CREATE TABLE BranchManager
(
    id_branch_manager BIGINT PRIMARY KEY,
    approval_status   ENUM ('approved', 'rejected', 'pending') DEFAULT 'pending',
    FOREIGN KEY (id_branch_manager) REFERENCES Employee (id_employee)
);

-- Create General Manager table (inherits from Employee)
CREATE TABLE GeneralManager
(
    id_general_manager BIGINT PRIMARY KEY,
    FOREIGN KEY (id_general_manager) REFERENCES Employee (id_employee)
);

-- Create Branch table
CREATE TABLE Branch
(
    id_branch         BIGINT AUTO_INCREMENT PRIMARY KEY,
    branch_name       VARCHAR(100) NOT NULL,
    address           VARCHAR(255) NOT NULL,
    id_branch_manager BIGINT,
    FOREIGN KEY (id_branch_manager) REFERENCES BranchManager (id_branch_manager)
);

-- Create BankAccount table (each customer can have up to 3 accounts)
CREATE TABLE BankAccount
(
    id_account     BIGINT AUTO_INCREMENT PRIMARY KEY,
    account_number VARCHAR(20) NOT NULL UNIQUE,
    balance        DECIMAL(12, 2) DEFAULT 0.00,
    id_customer    BIGINT,
    FOREIGN KEY (id_customer) REFERENCES Customer (id_customer)
);

-- Create Transaction table (records all account transactions)
CREATE TABLE Transaction
(
    id_transaction         BIGINT AUTO_INCREMENT PRIMARY KEY,
    transaction_type       ENUM ('deposit', 'withdrawal', 'transfer') NOT NULL,
    amount                 DECIMAL(12, 2)                             NOT NULL,
    transaction_date       DATETIME DEFAULT CURRENT_TIMESTAMP,
    id_origin_account      BIGINT,
    id_destination_account BIGINT                                     NULL,
    FOREIGN KEY (id_origin_account) REFERENCES BankAccount (id_account),
    FOREIGN KEY (id_destination_account) REFERENCES BankAccount (id_account)
);

-- Create Loan table (loan requests made by customers)
CREATE TABLE Loan
(
    id_loan         BIGINT AUTO_INCREMENT PRIMARY KEY,
    loan_amount     DECIMAL(12, 2) NOT NULL,
    interest_rate   DECIMAL(4, 2)  NOT NULL,
    loan_status     ENUM ('pending', 'approved', 'rejected') DEFAULT 'pending',
    monthly_payment DECIMAL(12, 2) NOT NULL,
    duration_years  INT            NOT NULL,
    id_customer     BIGINT,
    id_cashier      BIGINT,
    FOREIGN KEY (id_customer) REFERENCES Customer (id_customer),
    FOREIGN KEY (id_cashier) REFERENCES Cashier (id_cashier)
);

-- Create PersonnelAction table (records actions for employees such as hire/fire)
CREATE TABLE PersonnelAction
(
    id_action          BIGINT AUTO_INCREMENT PRIMARY KEY,
    action_type        ENUM ('hire', 'terminate') NOT NULL,
    action_status      ENUM ('pending', 'approved', 'rejected') DEFAULT 'pending',
    id_employee        BIGINT,
    id_branch_manager  BIGINT,
    id_general_manager BIGINT,
    FOREIGN KEY (id_employee) REFERENCES Employee (id_employee),
    FOREIGN KEY (id_branch_manager) REFERENCES BranchManager (id_branch_manager),
    FOREIGN KEY (id_general_manager) REFERENCES GeneralManager (id_general_manager)
);
