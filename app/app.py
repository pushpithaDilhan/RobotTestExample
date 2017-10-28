from flask import Flask, redirect, url_for, render_template, request, abort

app = Flask(__name__)

@app.route('/', methods=['GET','POST'])
def index():
    if request.method == 'GET':
        return render_template('index.html')
    elif request.method == 'POST':
        username = request.form['username_input']
        password = request.form['password_input']
        if username == 'test' and password == 'test123':
            return redirect(url_for('success'))
    else:
        abort(400)

@app.route('/success')
def success():
    return render_template('login_success.html')

if __name__ == '__main__':
    app.run(debug=True)