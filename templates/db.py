import mysql.connector
from flask import g

def get_db():
    if 'db' not in g:
        g.db = mysql.connector.connect(
            host='localhost',
            user='root',
            password='your_password',
            database='welcomehome'
        )
    return g.db

def init_db():
    db = get_db()
    cursor = db.cursor()
    with open('schema.sql', 'r') as f:
        cursor.execute(f.read(), multi=True)
    db.commit()

