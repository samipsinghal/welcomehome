from flask import Blueprint, render_template, request, redirect, flash, session
from werkzeug.security import generate_password_hash, check_password_hash
from db import get_db

auth = Blueprint('auth', __name__)

@auth.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = generate_password_hash(request.form['password'])
        db = get_db()
        cursor = db.cursor()
        try:
            cursor.execute(
                "INSERT INTO Person (userName, password, fname, lname, email) VALUES (%s, %s, %s, %s, %s)",
                (username, password, request.form['fname'], request.form['lname'], request.form['email'])
            )
            db.commit()
            flash('Registration successful!')
            return redirect(url_for('auth.login'))
        except Exception as e:
            flash('Error during registration: {}'.format(e))
    return render_template('register.html')

@auth.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        db = get_db()
        cursor = db.cursor(dictionary=True)
        cursor.execute("SELECT * FROM Person WHERE userName = %s", (username,))
        user = cursor.fetchone()
        if user and check_password_hash(user['password'], password):
            session['user_id'] = user['userName']
            session['username'] = user['fname']
            flash('Login successful!')
            return redirect(url_for('index'))
        flash('Invalid username or password.')
    return render_template('login.html')

@auth.route('/logout')
def logout():
    session.clear()
    flash('Logged out successfully!')
    return redirect(url_for('auth.login'))

