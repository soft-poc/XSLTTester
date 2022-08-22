from flask import Flask, render_template
import sqlite3
app = Flask(__name__)

def get_db_connection():
    conn = sqlite3.connect('database.db')
    conn.row_factory = sqlite3.Row
    return conn


@app.route('/')
def hello():
    return 'Hello, World!'

@app.route('/index2')
def OutNames():
    return render_template("test.html", name="arjun ")

@app.route('/index')
def index():
    conn = get_db_connection()
    posts = conn.execute('SELECT * FROM posts').fetchall()
    conn.close()
    return render_template('index.html', posts=posts)

app.run()