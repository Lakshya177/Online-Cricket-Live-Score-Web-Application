# Online-Cricket-Live-Score-Web-Application

## 📌 Introduction
<pre>
Cricket is one of the most popular sports in the world, and millions of people want to stay updated with live match scores. 
However, not everyone has access to live television or paid streaming services. To solve this problem, the Online Cricket Live 
Score Web Application was developed.

This project is a web application that provides live cricket scores using an API. The system allows users to view live scores 
without logging in. However, to access additional features like match highlights, match history, future match schedules, and 
personalized content, users must register and log in.

The system has two main types of users: Audience and Admin.

Admin: Manages match details, upcoming matches, and other system data.
Audience: Can view match information, scores, and access additional features after logging in.

Additional features include:

Password reset via email for secure account recovery
Advertisements displayed on the dashboard for users.

</pre>

----

## 🎯 Objectives
<pre>
To provide live cricket scores using an API.
To allow users to view match highlights and match history.
To provide future match schedules.
To implement a user registration and login system.
To implement an admin panel for managing match data.
To implement an email feature for password reset.
To display Advertisements within the application.
To build a web application using Servlets and JSP.
</pre>

-----

## 🛠️ Technologies Used
<pre>
  Category       Technology             
                                      
  Frontend     -  HTML, CSS, JavaScript  
  Backend      -  Java Servlet, JSP      
  Database     -  MySQL                  
  Connectivity -  JDBC                   
  API          -  Live Cricket Score API 
  Email        -  JavaMail API           
  Server       -  Apache Tomcat          
</pre>

----

## 👥 System Modules
<pre>
1. Audience Module
View Live Cricket Score (without login)
User Registration
User Login
View Match Highlights
View Match History
View Future Matches
Forgot Password (Email Reset)
View Advertisements
  
2. Admin Module
Admin Login
Add Future Match Details
Edit Match Details
Delete Match Details
Manage Match History
Manage Highlights
Manage Advertisements
</pre>

-----

## 🔐 Features
<pre>
Live Score API Integration – View real-time cricket scores.
User Registration & Login – Secure authentication for users.
Admin Panel – Manage matches, highlights, and advertisements.
Match History – Access past match details and statistics.
Future Match Schedule – View upcoming matches.
Highlights Details – Watch match highlights.
Email Password Reset – Recover account securely via email.
Future Matches Display – Show upcoming matches on the dashboard.
Secure Login System – Protect user and admin accounts.
Advertisements – Display ads for additional content and revenue.
</pre>

-----

## 📌 Validation Rules
<pre>
  
1️⃣ Mobile Number Rules
Must be exactly 10 digits.
First digit must be 6, 7, 8, or 9.
Only numbers (0–9) are allowed.
Cannot be empty (required field).
Example valid: 9876543210
Example invalid: 5876543210, 1234567890, 987654321

2️⃣ Password Rules
Password field cannot be empty.
Confirm password field cannot be empty.
Password and confirm password must match.

3️⃣ Form Submission Rules
Form cannot submit if mobile number is invalid.
Form cannot submit if passwords do not match.
</pre>

----

##  📂 Project Structure

<h2>AdminControl</h2>
<pre>
├── WebPages                
|   ├─ META-INF             
|   └── WEB-INF             
│       ├── Admin.html
│       └── index.html
│
├── Source Packages           
│    └── Default Package       
│          ├── Mailer.java
│          └── SendMail.java
│
├── Test Package                      
├── Libraries                   
├── Test-libraries              
└── Configuration-files         
    ├── MANIFEST.MF
    ├── context.xml
    └── web-fragment.xml
</pre>

<h2>Audience Page</h2>

<pre>
 ├── WebPages
 │        ├──JavaScript
 │        |     └──one.js
 |        |
 │        ├──META-INF
 │        ├──WEB-INF
 │        ├──Image
 |        |    ├─Background.jpg
 |        |    ├─delete.png
 |        |    └──edit.png
 |        |
 |        ├─Check_admin_login.jsp
 |        ├─Delete_Future_Match
 |        ├─EditHistory.jsp
 |        ├─Edit_Future_Match.jsp
 |        ├─FutureMatches.html
 |        ├─History_Match.html
 |        ├─Home2.html
 |        ├─InsertHistoryMatch.jsp
 |        ├─Login.html
 |        ├─LoginError.html
 |        ├─Logout.html
 |        ├─Registers.html
 |        ├─Registers2.html
 |        ├─ShowHistoryMatches.jsp
 |        ├─ShowHistoryMatches2.jsp
 |        ├─Show_Future_Matches.jsp
 |        ├─Update.html
 |        ├─Update.jsp
 |        ├─Update_Future_Match.jsp
 |        ├─Video.jsp
 |        ├─add_advertisement.html
 |        ├─admin_home.jsp
 |        ├─admin_login.jsp
 |        ├─audience_upcoming_matches.jsp
 |        ├─delte.jsp
 |        ├─edit.jsp
 |        ├─fetch.jsp
 |        ├─forget.html
 |        ├─index.html
 |        ├─logout.jsp
 |        └──register.html
 |
 ├──Source Package
 |         └── Default Package   
 |               ├─ChecKLogin.java
 |               ├─DeleteHistoryServlet.java
 |               ├─FutureMatch.java
 |               ├─Home.java
 |               ├─LiveScoreServlet.java
 |               ├─Logout.java
 |               ├─Mailer.java
 |               ├─Profile.java
 |               ├─Register.java
 |               ├─SendMail.java
 |               ├─Update.java
 |               ├─UpdateHistoryServlet.java
 |               ├─UpdatePassword.java
 |               ├─UpdateServlet.java
 |               └── Update.java
 |
 ├─Test Packages        
 ├─Libraries
 |      ├─activation.jar
 |      ├─httpclient.jar
 |      ├─httpcore.jar
 |      ├─slf4j-api.jar
 |      ├─mail.jar
 |      ├─json.jar
 |      ├─mysql-connector.jar
 |      ├─JDK
 |      └──Apache Tomacat
 |
 ├─Test Libraries
 └──Configuration Files
          ├── MANIFEST.MF
          ├── context.xml
          └── web-fragment.xml
</pre>

-----

## 📸 Screenshots

## 🔹 1. Home Page (Audience Login)

Description:
The Home Page allows users to log in using email and password, view live scores, register a new account, 
and reset their password using the forgot password option.

<img width="1920" height="200" alt="Screenshot (476)" src="https://github.com/user-attachments/assets/9a698947-055a-430f-9bd4-ea14d010a82b" />


## 🔹 2. User Registration Page
Description:
New users can create an account by entering their Name, Email, Mobile, Password and  Confirm Password.

<img width="1920" height="444" alt="Screenshot (477)" src="https://github.com/user-attachments/assets/e990bdde-c485-4129-932f-b5a6e444444d" />


## 🔹 3. Audience Login 
Description:
After registration, the audience can log in by entering their email and password 

<img width="1920" height="444" alt="Screenshot (480)" src="https://github.com/user-attachments/assets/d4ca40f4-b379-4f04-a296-590d4191e3f4" />


## 🔹 4. Advertisement Page
Description:
After login, an advertisement page is displayed before accessing the user dashboard.

<img width="1891" height="444" alt="Screenshot (479)" src="https://github.com/user-attachments/assets/f2484e9e-4883-4ff1-a4f5-3e11163e0e4d" />


## 🔹 5. Dashboard (Audience page)
Description:
The Dashboard provides options such as Home, Upcoming Matches, Match History, Profile, and Logout for the users.

<img width="1920" height="444" alt="Screenshot (481)" src="https://github.com/user-attachments/assets/ea0e6f92-921a-40c7-8128-0d16f39e77d0" />


## 🔹 6. Profile Page
Description:
The Profile Page displays user details such as Name, Email, and Mobile Number, and provides options to Edit, Delete, Home, and Logout.

<img width="1920" height="444" alt="Screenshot (482)" src="https://github.com/user-attachments/assets/650d595a-4181-41a0-8164-dd6272195c43" />


## 🔹 7. Upcoming Matches
Description:
The Upcoming Matches page shows the list of upcoming matches and their details for the users.

<img width="1920" height="444" alt="Screenshot (483)" src="https://github.com/user-attachments/assets/48e32574-d033-4fd3-b360-2ec9bb4674b7" />


## 🔹 8. History of Matches
Description:
The History of Matches page displays the details and highlights of previously played matches.

<img width="1920" height="444" alt="Screenshot (484)" src="https://github.com/user-attachments/assets/9f8a08c4-ecb6-43d8-b5a1-f84c83159793" />

## 🔹 9. Forget Password
Description:
Users can reset their password using an email link by entering Email, Password, and Confirm Password.

<img width="1920" height="444" alt="Screenshot (485)" src="https://github.com/user-attachments/assets/bf55b515-05a4-45a3-b006-a594b4885178" />
<img width="1895" height="444" alt="Screenshot (486)" src="https://github.com/user-attachments/assets/0fffb7d0-3f50-46b8-bc89-0c0237125a2c" />

## 🔹 10. Live Score
Description:
The Live Score page displays real-time cricket scores and match details using the Live Cricket API.

<img width="1887" height="444" alt="Screenshot (487)" src="https://github.com/user-attachments/assets/560ef54e-fcbb-4546-9e76-89134b289e18" />

## 🔹 10. Admin Login 
Description:
Admin can log in by entering Email and Password. Credentials are stored permanently in the database to allow secure authentication.

<img width="1920" height="444" alt="Screenshot (488)" src="https://github.com/user-attachments/assets/5dd9ac50-a1ff-4052-83bf-a7dedc8e3902" />

## 🔹 11. Admin (Dashboard)

Description:
Main control panel for the admin to manage users  Add Future Matches, View Future Matches, Add Match History,and History Matches List and Advertisement perform Edit or Delete actions.

<img width="1920" height="444" alt="Screenshot (489)" src="https://github.com/user-attachments/assets/e0aef4e3-d456-43e1-b91d-22a939b12fb0" />

a) Add Future Matches

<img width="1920" height="444" alt="Screenshot (490)" src="https://github.com/user-attachments/assets/82c14388-24cb-4bbd-8e08-540c3969f99b" />

b)View Future Matches

<img width="1906" height="444" alt="Screenshot (491)" src="https://github.com/user-attachments/assets/8d905f8e-bdf1-40a2-bf08-480a9e6086cd" />

c)Add Match History

<img width="1920" height="444" alt="Screenshot (493)" src="https://github.com/user-attachments/assets/7b0f566e-dbf4-40c4-b4c0-125638933e30" />

d)History Matches List

<img width="1920" height="444" alt="Screenshot (494)" src="https://github.com/user-attachments/assets/176fffd2-1d2a-4339-96d1-c86047535d17" />

e)Advertisement

<img width="1920" height="444" alt="Screenshot (495)" src="https://github.com/user-attachments/assets/61e6e170-cb7f-4f02-93ba-a7b59635cfe1" />

----

## 📌 Conclusion
<pre>
The Online Cricket Live Score Web Application is a useful platform for cricket fans who want to stay updated with live match 
scores without paid subscriptions. The system provides live scores, match history, highlights, and futurematch details. The admin 
panel helps manage match information efficiently. The email password reset feature improves the security of the system. Overall, 
the project demonstrates the use of web technologies like HTML, CSS, JavaScript, Servlet, JSP, MySQL, and API integration to build 
a real-world web application.
</pre>

-----

## 👨‍💻 Author
<pre>
Name: Lakshya Gupta
Role: Full Stack Developer
Technologies Used: HTML, CSS, JavaScript, Java Servlet, JSP, MySQL, JDBC, Live Cricket API, JavaMail API
</pre>
