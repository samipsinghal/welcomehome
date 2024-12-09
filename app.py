from flask import Flask, render_template, redirect, url_for, session
from auth import auth
from db import init_db

app = Flask(__name__)
app.secret_key = 'your_secret_key'

# Register blueprints
app.register_blueprint(auth)

@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    init_db()  # Initialize the database on startup
    app.run(debug=True)

