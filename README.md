# Online-Job-Portal-Application


A web-based job portal developed using **ASP.NET** and **SQL Server**, designed to streamline the job search and recruitment process. The platform offers dedicated interfaces for job seekers, employers, and administrators, featuring smart job filtering, resume upload, and an automated resume keyword matching system.

---

## 🔧 Tech Stack

- **Frontend**: HTML, CSS, JavaScript, Bootstrap
- **Backend**: ASP.NET (C#)
- **Database**: SQL Server (managed using SQL Server Management Studio)

---


## 🎯 Objectives

- Provide a centralized platform for job searching and recruitment.
- Enable job seekers to filter, search, and apply for jobs efficiently.
- Help employers find suitable candidates using resume keyword matching.
- Offer real-time data insights and application tracking via an admin dashboard.

---


## 🚀 Features

### 👨‍💼 Job Seekers
- Register, log in, and manage profiles.
- Browse and filter jobs by:
  - **Location**
  - **Job type** (Full-time, Part-time, Remote)
  - **Posting date**
- Upload and manage resumes.
- Apply to jobs directly through the portal.
- Redirect to LinkedIn for additional opportunities.

### 🏢 Employers / Admin
- Post and manage job listings.
- View and track user applications.
- Access real-time dashboard showing:
  - Total users
  - Active job posts
  - Application statistics
- **Resume Matching System**: Matches CV keywords with job descriptions and shows a match percentage for each applicant.

---


## 📷 Screenshots _
Screenshots file is uploaded with name "Screenshot_for_job"_.



## 📌 Problem Addressed

Traditional hiring is time-consuming, scattered, and lacks intelligent automation. This portal:
- Centralizes job listings
- Automates resume filtering
- Enhances communication between employers and candidates
- Reduces manual overhead and hiring time

---


## 🛠️ How It Works

1. **Frontend** handles all user interactions, such as browsing jobs or submitting applications.
2. **Backend (ASP.NET with C#)** processes requests, manages sessions, handles business logic, and interacts with the database.
3. **SQL Server** stores:
   - User data
   - Job listings
   - Application records
   - Uploaded resumes
4. **Resume Matching Module** extracts keywords from resumes and compares them with job descriptions to compute a relevance score.

---


## 🖥️ Installation & Setup

1. Clone the repository:

   ```bash
   git clone https://github.com/Ashvini8879/Online-Job-Portal-Application.git
   ```

2. Open the solution file in **Visual Studio**.

3. Configure the **SQL Server** connection string in `Web.config`.

4. Import the database script from the `/Database` folder into SQL Server.

5. Run the application via IIS Express or your preferred local server.

---



## 📈 Future Enhancements

* Add email notifications for applicants and employers.
* Integrate AI-based resume ranking.
* Enable OAuth login (Google, LinkedIn).
* Deploy live using Azure or Render.

---


## 🙌 Acknowledgements

Developed as part of an academic project to improve the hiring experience using ASP.NET and modern web technologies.

