import flask
import test

app = flask.Flask(__name__)

# 모델 로드
model = load_model('model.h5')

@app_route('/predict', methods=['POST'])
def predict():
    # 전달된 데이터 처리
    data = flask.request.json

    # 데이터 전처리
    processed_data = preprocess_data(data)

    # 모델 예측
    prediction = model.predict(processed_data)

    # 예측 결과 반환
    response = {'prediction': prediction}
    return flask.jsonify(response)

if __name__ == '__main__':
    app.run()