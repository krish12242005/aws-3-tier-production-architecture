from flask import Flask
import os

app = Flask(__name__)

@app.route("/")
def home():
    return """
    <html>
        <head>
            <title>AWS 3-Tier Application</title>
        </head>
        <body>
            <h1>?? AWS 3-Tier Production Architecture</h1>
            <p>Application is running successfully.</p>
            <p>Environment: Production</p>
        </body>
    </html>
    """

@app.route("/health")
def health():
    return {"status": "healthy"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int(os.getenv("PORT", 5000)))
