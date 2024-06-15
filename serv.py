# Launch command: 
# $ sudo python3 serv.py

from flask import Flask, send_file, abort, Response, jsonify
import logging
import json

logger = logging.getLogger('waitress')
logger.setLevel(logging.INFO)

app = Flask(__name__)

@app.route('/')
def index():
    try:
        return send_file('index.html', mimetype='text/html; charset=utf-8')
    except FileNotFoundError:
        abort(404, description="File not found")

@app.route('/ads.json')
def ads():
    try:
        return send_file('ads.json', mimetype='application/json')
    except FileNotFoundError:
        abort(404, description="File not found")

@app.route('/<path:path>')
def serve_file(path):
    try:
        return send_file(path)
    except FileNotFoundError:
        abort(404, description="File not found")

@app.route('/api/<search_term>')
def search_ads(search_term):
    try:
        with open('ads.json', 'r', encoding='utf-8') as f:
            ads_data = json.load(f)

        if isinstance(ads_data, list):
            matches = [ad for ad in ads_data if search_term.lower() in ad.get('Skelbimas', '').lower()]
            return jsonify(matches)
        else:
            return jsonify({"error": "ads.json does not contain an array of ads"}), 500

    except FileNotFoundError:
        abort(404, description="File not found")
    except json.JSONDecodeError:
        abort(500, description="Error decoding JSON")
    except Exception as e:
        app.logger.error(f"Unexpected error: {e}")
        return jsonify({"error": "Internal Server Error"}), 500

@app.errorhandler(404)
def not_found(e):
    return Response("File not found", status=404, mimetype='text/plain')

if __name__ == '__main__':
    from waitress import serve
    serve(app, host="0.0.0.0", port=80)

