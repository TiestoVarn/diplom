from flask import Flask, render_template, request, redirect, url_for

import os

Mykola = Flask(__name__)

@Mykola.route('/')
def home():
    return render_template('home.html')

if __name__ == "__main__":
    Mykola.run(host="0.0.0.0", port="1337", debug=True)
