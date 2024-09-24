# Banco de Agricultura Salvadoreño Web System

This project is a web-based system for **Banco de Agricultura Salvadoreño SA de CV**, designed to organize and manage the internal activities of the bank. It includes different roles, such as customers, dependents, cashiers, branch managers, and general managers. Each role has specific actions and functionalities to ensure smooth banking operations.

## Features

- **Customer Management**: Customers can create and manage up to 3 bank accounts, view transaction history, and transfer funds.
- **Dependents**: Business owners (dependents) can assist customers with deposits and withdrawals and earn a 5% commission per transaction.
- **Cashiers**: Cashiers can register customers, add dependents, handle deposits/withdrawals, and approve or manage loan applications.
- **Branch Managers**: Managers can manage bank personnel, approve or reject loans, and handle branch administrative tasks.
- **General Managers**: The general manager oversees branch operations, approves or rejects personnel actions, and can create new branches.

## Roles and Responsibilities

### Customer
- Can create up to 3 bank accounts.
- Can view transaction history (deposits, withdrawals, transfers).
- Can transfer money to other bank users.

### Dependent (Business Owner)
- Can perform deposits and withdrawals for customers.
- Earns a 5% commission per transaction.
- Requires customer’s DUI to view their accounts.

### Cashier
- Can register new customers and dependents.
- Handles deposits and withdrawals for customers.
- Manages loan applications, ensuring compliance with salary-based loan limits.

### Branch Manager
- Adds or removes bank employees (cashiers, cleaning staff, secretaries, financial advisors).
- Approves or rejects loans submitted by cashiers.
- Manages personnel status (active/inactive).

### General Manager
- Approves or rejects actions initiated by branch managers.
- Can create new bank branches and assign managers.
- Monitors transactions for all branches.

## Database Schema

The project uses a MySQL database to manage all entities, including:
- **Users** (general entity for customers, dependents, and employees)
- **Customers** (bank customers)
- **BankAccounts** (customer accounts)
- **Transactions** (deposits, withdrawals, transfers)
- **Loans** (customer loans with status management)
- **Personnel Actions** (actions related to employee management)
- **Branches** (branch offices of the bank)

### Relationships

- A **User** can be a **Customer**, **Dependent**, or **Employee**.
- A **Customer** can have multiple **BankAccounts** (up to 3).
- A **Cashier** can manage **Loans** and customer transactions.
- A **Branch Manager** oversees **PersonnelActions** and approves **Loans**.
- A **General Manager** can approve/reject personnel actions and create **Branches**.

## Getting Started

### Prerequisites

- MySQL database
- Java (for backend if using Java Spring Boot)
- A modern web browser for accessing the frontend

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-repository/bank-system.git
   ```
2. Set up the database:
   - Create a MySQL database and execute the provided SQL schema in the `/util` folder.
   - Adjust the database connection details in the application configuration file (e.g., `application.properties` for Spring Boot).

3. Install dependencies:
   - For a Java Spring Boot project, run:
     ```bash
     mvn clean install
     ```

4. Run the application:
   - For Java Spring Boot, run:
     ```bash
     mvn spring-boot:run
     ```

5. Access the application at `http://localhost:8080` or another configured port.

### Database Setup

1. Use the `MySQL` script provided in the `/uitñ` folder to create the required tables.
2. Make sure the foreign keys and constraints are correctly configured to enforce data integrity.
3. Sample data for testing can be inserted into the database using the `bank.sql` file.

### Technologies Used
- **Backend**: Java Spring Boot
- **Frontend**: HTML/CSS/JavaScript
- **Database**: MySQL
- **Version Control**: Git

## Contributing

Contributions are welcome! Please follow these steps:
1. Fork the repository.
2. Create your feature branch (`git checkout -b feature/new-feature`).
3. Commit your changes (`git commit -m 'Add new feature'`).
4. Push to the branch (`git push origin feature/new-feature`).
5. Open a pull request.

## License

This project is licensed under the CREATIVE COMMONS License - see the [LICENSE](LICENSE) file for details.

## Contact

For any questions, feel free to contact the development team:
- **Project Lead**: Josue Avalos
- **Email**: your.email@example.com
