from flask import Flask, render_template
import psutil

app = Flask(__name__)

@app.route("/")
def index():
    cpu_metric = psutil.cpu_percent()
    ram_metric = psutil.virtual_memory().percent
    Message = None

    if cpu_metric > 79 or ram_metric > 79:
        Message = "Resources are burning, Scale up or take down"
    return render_template("index.html", cpu_metric=cpu_metric, ram_metric=ram_metric, Message=Message)

if __name__ == '__main__':
    app.run(debug=True, host = '0.0.0.0')