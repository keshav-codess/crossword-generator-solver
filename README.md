# 🧩 CrossMaster - Crossword Generator & Solver  

![CrossMaster Banner](https://img.shields.io/badge/Java%20Servlets-Maven-blue?style=for-the-badge&logo=java)  
![Crossword Solver](https://img.shields.io/badge/Crossword-Generator%20%26%20Solver-orange?style=for-the-badge&logo=apachetomcat)  
![Status](https://img.shields.io/badge/Status-Active-success?style=for-the-badge)  

---

## 🌟 Overview  
**CrossMaster** is a **web-based Crossword Generator & Solver** built using **Java Servlets, JSP, and Maven**.  
This project allows users to:  
✅ **Generate random crossword grids** from words you provide.  
✅ **Solve word search puzzles** with automatic **highlighting & positions**.  
✅ Simple and elegant **Bootstrap UI** for easy interaction.  

🚀 Perfect for **Java Web Development practice** and portfolio showcase!  

---

## ✨ Features  
- 🛠 **Generate Crossword** dynamically with random letters filled in.  
- 🔍 **Solve Word Search Puzzles** by entering grid & words.  
- 🎨 **Highlight matching words** in the grid with positions.  
- 💻 Built using **Java Servlets + JSP (Tomcat)**.  
- 🎯 Responsive UI powered by **Bootstrap 5**.  

---

## 🖼️ Screenshots  

### 🏠 Home Page  
![Home Page](screenshots/home.png)  

### 🛠 Generate Crossword  
![Generate Crossword](screenshots/generate.png)  

### 🔍 Solve Crossword  
![Solve Crossword](screenshots/solve.png)  

### ✅ Solved Crossword (Highlighted Words)  
![Solved Crossword](screenshots/solved.png)  

---

## 🛠 Tech Stack  
- **Frontend:** HTML5, CSS3, Bootstrap 5  
- **Backend:** Java Servlets (JSP)  
- **Server:** Apache Tomcat 10+  
- **Build Tool:** Maven  
- **Version Control:** Git & GitHub  

---

## ⚡ Setup Instructions  

### 1️⃣ Clone the Repository  
```bash
git clone https://github.com/your-username/crossmaster.git
cd crossmaster

2️⃣ Build the Project
bash
Copy
Edit
mvn clean install
3️⃣ Deploy on Tomcat
Copy the generated WAR file from target/ to your Tomcat webapps/ folder.

Start Tomcat and access:

bash
Copy
Edit
http://localhost:8080/crossmaster


📂 Project Structure
swift
Copy
Edit
crossmaster/
│
├── src/main/
│   ├── java/com/crossword/servlets/
│   │    ├── GenerateCrosswordServlet.java
│   │    ├── SolveCrosswordServlet.java
│   │
│   ├── webapp/
│   │    ├── index.jsp
│   │    ├── generate.jsp
│   │    ├── solve.jsp
│   │    ├── result.jsp
│
├── pom.xml
└── README.md
