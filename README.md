# 🍽️ CatERing Project

## 📝 Overview

**CatERing** is a **university project** developed for the *Sviluppo Applicazioni Software* course (Computer Science) at the **University of Turin**. The project is a Java-based simulation of management software for a catering service. The system models the main business processes involved in event catering, such as menu management, kitchen tasks, event organization, and data persistence.

The project follows a **layered architecture**, strictly separating business logic, persistence, and user interface components.

## ✨ Main Features

* 🎉 **Event & Catering Management:** Comprehensive handling of catering events and their lifecycle.
* 🥘 **Menu & Preparation Handling:** Management of menus, recipes, and culinary preparations.
* 👨‍🍳 **Kitchen Task Assignment:** Organization and assignment of kitchen tasks.
* 💾 **Persistent Data Storage:** Robust data storage using **MySQL**.
* 🏗️ **Architecture:** Clear separation between business logic and data access.
* 🧪 **Quality Assurance:** Dedicated test classes for validating system functionalities.

## 🛠️ Technologies Used

* ☕ **Java**
* 🐬 **MySQL**
* 🔌 **JDBC** (MySQL Connector)
* 💻 **IDE Structure** (IntelliJ IDEA compatible)

## 📂 Project Structure

```text
CatERing/
│
├── src/
│   ├── businesslogic/   # 🧠 Core application logic
│   ├── persistence/     # 💾 Database access and queries
│   ├── ui/              # 🖥️ User interface layer
│   ├── CatERingApp.java # 🚀 Main entry point
│   └── Test*.java       # 🧪 Test classes
│
├── catering.sql         # 📜 Database schema
├── dbreset.sql          # 🔄 Database reset script
├── mysql-connector-j/   # 📦 MySQL JDBC driver
└── out/                 # ⚙️ Compiled output

```

## 🗄️ Database Setup

1. **Install MySQL** on your system.
2. **Create a new database** instance.
3. **Execute Script:** Run `catering.sql` to create tables and relationships.
4. **(Optional):** Use `dbreset.sql` to reset the database if needed.
5. **Configure:** Update database connection parameters in the persistence layer.

## 🚀 How to Run

1. Open the project in **IntelliJ IDEA** (or another Java IDE).
2. Make sure the **MySQL connector** is correctly linked in dependencies.
3. Set up the database as described above.
4. Run `CatERingApp.java`.

## 🧪 Testing

The project includes several test classes (`TestCatERing*.java`) that can be executed individually to verify specific functionalities of the system.

## 📚 Technical Documentation & Attachments

The project includes **technical attachments** (*Allegati Tecnici*) provided as part of the university assignment. These documents describe in detail the requirements, design choices, and workflows of the system.

In particular:

* **📋 Technical Appendix – Task Management:** Describes the modeling and handling of kitchen tasks, including assignment, scheduling, and execution within the catering workflow.
* **📅 Technical Appendix – Event Management:** Details the management of catering events, roles involved, event lifecycle, and interactions between system components.

These documents complement the source code by providing formal specifications and clarifying the expected behavior of the system.

🤝 Contributing
This project was developed as part of the Sviluppo Applicazioni Software course at the University of Turin.

## 👥 Contributors

* **Davide Robustelli** — [@xDavikx](https://github.com/xDavikx)
* **Luca Robustelli** - [@LucRobus99](https://github.com/LucaRobus99)
---


> **🎓 Educational Purpose**
> This project was developed **for academic purposes** as part of a university course at the **University of Turin**. It is not intended for production use.




