
# **BPMS - Beauty Parlor Management System**

## **Overview**
BPMS (Beauty Parlor Management System) is a PHP-based web application designed to manage appointments, customers, and other essential functionalities of a beauty parlor. The system includes features for both administrators and users to streamline parlor operations.

This project includes a fully responsive design built with HTML, CSS, JavaScript, and PHP. It uses a MySQL database to store and manage data efficiently.

---

## **Features**
### **Admin Panel**
- Dashboard with notifications and insights.
- Manage appointments:
  - View new and completed bookings.
  - Update booking statuses.
- User management:
  - View registered users.
  - Modify user details.
- Profile management.
- Password management for administrators.
- Integrated calendar for scheduling.

### **User Panel**
- Appointment booking with details.
- Profile management.
- View booking status.

### **Other Features**
- Email notifications for bookings (if configured).
- Dynamic charts for data visualization.
- Mobile-friendly and responsive design.
- Animation effects with **Animate.css** and **WOW.js**.

---

## **Technologies Used**
- **Backend**: PHP
- **Frontend**: HTML, CSS, JavaScript, Bootstrap
- **Database**: MySQL
- **Additional Libraries**:
  - Font Awesome (icons)
  - jQuery (interactivity)
  - Chart.js (charts and graphs)
  - WOW.js and Animate.css (animations)
  - Clndr.js (calendar integration)

---

## **Installation**

### Prerequisites
1. A local server environment such as **XAMPP** or **WAMP**.
2. PHP 7.3 or higher.
3. MySQL database.

### Steps
1. **Clone or download the project**:
   ```bash
   git clone https://github.com/your-repository-link/bpms
   ```
   Or download the zip file from the repository.

2. **Place the project in your server directory**:
   - XAMPP: Move the project folder to `htdocs/`.
   - WAMP: Move the project folder to `www/`.

3. **Configure the database**:
   - Import the `bpms.sql` file into your MySQL database using phpMyAdmin.
   - Update the database connection settings in the `dbconnection.php` file:
     ```php
     $con = mysqli_connect("localhost", "root", "", "your_database_name");
     ```

4. **Start the server**:
   - Launch XAMPP or WAMP and start the **Apache** and **MySQL** services.

5. **Access the application**:
   - Open your browser and visit:
     ```
     http://localhost/bpms/
     ```

---


---

## **Usage**

1. **Admin Login**:
   - Access the admin panel by visiting:
     ```
     http://localhost/bpms/admin/
     ```
   - Default login credentials:
     - Username: `admin`
     - Password: `admin123`

2. **User Registration**:
   - Users can register from the homepage and book appointments after logging in.

---

## **Dependencies**

The project uses the following dependencies via CDN:
- jQuery
- Bootstrap
- Font Awesome
- Chart.js
- WOW.js
- Animate.css
- Clndr.js
- Moment.js
- Underscore.js
- MetisMenu

---

## **Contributing**

1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add feature"
   ```
4. Push to the branch:
   ```bash
   git push origin feature-name
   ```
5. Open a pull request.

---

## **License**

This project is licensed under the MIT License. See the LICENSE file for details.

