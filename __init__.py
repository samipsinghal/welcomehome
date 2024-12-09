import os
from flask import Flask
from auth import auth
from db import init_db

def create_app():
    # Create and configure the Flask app
    app = Flask(__name__)
    app.secret_key = os.getenv("SECRET_KEY", "your_secret_key")

    # Register Blueprints
    app.register_blueprint(auth)

    # Initialize the database
    with app.app_context():
        init_db()

    return app

