from flask import Flask, request, jsonify
from flask_basicauth import BasicAuth
from textblob import TextBlob
from sklearn.linear_model import LinearRegression
import pickle
import os


model = pickle.load(open('models/model.hdf5', 'rb'))
columns = ['size', 'year', 'garage']

app = Flask(__name__)
app.config['BASIC_AUTH_USERNAME'] = os.environ.get('BASIC_AUTH_USERNAME')
app.config['BASIC_AUTH_PASSWORD'] = os.environ.get('BASIC_AUTH_PASSWORD')

basic_auth = BasicAuth(app)

@app.route('/')
def home():
  return 'Welcome home.'

@app.route('/sentiment/<text>')
@basic_auth.required
def sentiment(text):
  tb = TextBlob(text)
  tb_en = tb.translate(to='en')
  polarity = tb_en.sentiment.polarity

  return 'polarity: {}'.format(polarity)

@app.route('/price/', methods=['POST'])
@basic_auth.required
def price():
  data = request.get_json()
  input_data = [data[col] for col in columns]
  price = model.predict([input_data])

  return jsonify(price=price[0])

if __name__ == '__main__':
  app.run(debug=True, host='0.0.0.0')