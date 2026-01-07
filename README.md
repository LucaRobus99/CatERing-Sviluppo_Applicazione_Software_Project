# CatERing Project

## Overview

CatERing is a **university project** developed in Java that simulates the management software of a catering service. The system models the main business processes involved in event catering, such as menu management, kitchen tasks, event organization, and data persistence.

The project follows a **layered architecture** and separates business logic, persistence, and user interface components.

## Main Features

* Event and catering management
* Menu and preparation handling
* Kitchen task assignment
* Persistent data storage using **MySQL**
* Clear separation between business logic and data access
* Test classes for validating system functionalities

## Technologies Used

* **Java**
* **MySQL**
* **JDBC (MySQL Connector)**
* IDE project structure (IntelliJ IDEA compatible)

## Project Structure

```
CatERing/
│
├── src/
│   ├── businesslogic/   # Core application logic
│   ├── persistence/    # Database access and queries
│   ├── ui/             # User interface layer
│   ├── CatERingApp.java
│   └── Test*.java      # Test classes
│
├── catering.sql        # Database schema
├── dbreset.sql         # Database reset script
├── mysql-connector-j/  # MySQL JDBC driver
└── out/                # Compiled output
```

## Database Setup

1. Install MySQL on your system
2. Create a new database
3. Execute the `catering.sql` script to create tables
4. (Optional) Use `dbreset.sql` to reset the database
5. Configure database connection parameters in the persistence layer

## How to Run

1. Open the project in **IntelliJ IDEA** (or another Java IDE)
2. Make sure the MySQL connector is correctly linked
3. Set up the database as described above
4. Run `CatERingApp.java`

## Testing

The project includes several test classes (`TestCatERing*.java`) that can be executed individually to verify specific functionalities of the system.

## Technical Documentation and Attachments

The project includes **technical attachments (Allegati Tecnici)** provided as part of the university assignment. These documents describe in detail the requirements, design choices, and workflows of the system.

In particular:

* **Technical Appendix – Task Management**: describes the modeling and handling of kitchen tasks, including assignment, scheduling, and execution within the catering workflow.
* **Technical Appendix – Event Management**: details the management of catering events, roles involved, event lifecycle, and interactions between system components.

These documents complement the source code by providing formal specifications and clarifying the expected behavior of the system.

## Educational Purpose

This project was developed **for academic purposes** as part of a university course. It is not intended for production use.
