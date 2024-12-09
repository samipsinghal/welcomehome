# WelcomeHome

WelcomeHome is a web-based application designed to manage donations, orders, and user interactions. This project is built using Flask, MySQL, and Jinja2 templates.

---

## Features

1. **User Management**:
   - Register new users with secure password storage (hashed using SHA-256).
   - Login and logout functionality.

2. **Donation Management**:
   - Accept item donations from registered donors.
   - Associate donations with categories and track inventory.

3. **Item Management**:
   - Search for items and locate their storage details.
   - Manage and track item pieces.

4. **Order Management**:
   - Create, update, and view orders for donated items.
   - Track delivery status.

---

## Technologies Used

- **Backend**: Flask
- **Database**: MySQL
- **Frontend**: HTML5, CSS3, Jinja2 Templates
- **Dependencies**:
  - Flask
  - Flask-MySQL
  - Werkzeug (for password hashing)
  - MySQL Connector

---

## Installation Guide

### Prerequisites
- Python 3.8+
- MySQL
- pip (Python package manager)

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/welcomehome.git
   cd welcomehome
