from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/work')
def work():
    return render_template('work.html')

@app.route('/ml')
def ml():
    return render_template('ml.html')

@app.route('/bodybuilding')
def bodybuilding():
    return render_template('bodybuilding.html')

@app.route('/finance')
def finance():
    return render_template('finance.html')

@app.route('/planner')
def planner():
    return render_template('projects.html')

if __name__ == '__main__':
    app.run(debug=True)
