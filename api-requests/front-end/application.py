from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)

@app.route("/")
def index():
  return render_template("index.html")

@app.route("/gets")
def get_requests():
  return render_template("get.html")

@app.route("/gets/all")
def get_all_requests():
  # Insert your get request
  requests = None
  return render_template("get.html", requests=requests)

@app.route("/posts", methods=('GET', 'POST'))
def post_requests():
  if request.method == 'POST':
    # Insert your post request
    return redirect(url_for("index"))
  return render_template("post.html")

if __name__ == "__main__":
  app.run(debug=True)