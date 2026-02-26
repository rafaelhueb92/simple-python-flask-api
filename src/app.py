from socket import gethostname
from flask import Flask, request, render_template, jsonify
from prometheus_client import start_http_server

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello World! This is a simple Flask API. YEAH!'

@app.route('/json')
def json_response():
    data = {
        'message': 'Hello, this is a JSON response',
        'status': 'success'
    }
    return jsonify(data)

@app.route('/healthz')
def healthz():
    return jsonify({'status': 'healthy',
                    'hostname': gethostname()})

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        name = request.form['username']
        return f"Hello {name}, POST request received"
    return render_template('name.html')

if __name__ == '__main__':
    PROMETHEUS_PORT=8001
    start_http_server(PROMETHEUS_PORT)
    print(f"Metrics available at http://{gethostname()}:{PROMETHEUS_PORT}/metrics")
    
    app.run(host="0.0.0.0", port=5002,debug=True, use_reloader=False)
