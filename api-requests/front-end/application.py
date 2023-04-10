from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def index():
  return render_template("index.html")

@app.route("/gets")
def get_requests():
  return render_template("get.html")

@app.route("/posts")
def post_requests():
  return render_template("post.html")

if __name__ == "__main__":
  app.run(debug=True)