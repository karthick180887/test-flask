from flask import Flask, render_template
print('hello')
app = Flask(__name__)
@app.route("/")
def home():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)  # Add host='0.0.0.0'
