# -*- coding: utf-8 -*-

import io
import torch
from flask import Flask, request, jsonify, make_response
from flask_cors import CORS
from PIL import Image
import json


app = Flask(__name__)
CORS(app)

model = torch.hub.load('ultralytics/yolov5', 'custom', path='pet_detect.pt', force_reload=True)

def jsonify(results):
    box_dict_list = []
    for result in results.xyxy[0]:
        
        class_num = int(result[5])
        if class_num == 0 :
            cls = '미란/궤양'
        elif class_num == 1 :
            cls = '결절/종양'
        else :
            cls = '농포/여드름'

        box_dict = {
            'cls': cls,
            'cls_num': str(int(result[5].round())),  # 클래스 정보 - # 0 - 미란/궤양, 1 - 결절/종양, 2 - 농포/여드름
            'conf': '{:.2f}'.format(result[4].item()),  # 신뢰도
            'orig_shape': [(result[2] - result[0]).round().item(), (result[3] - result[1]).round().item()],   # width, height 계산
            'xyxy': [round(v.item()) for v in result[:4]],  # 기본 좌표정보
        }
        box_dict_list.append(box_dict)
    return json.dumps(box_dict_list)

@app.route("/detect.json", methods=["POST"])     #요청
def predict():
    # POST 요청이 아닐경우, error처리 할거
    if request.method != "POST":
        return "hello world"

    if request.files.get("image"):
        
        im_file = request.files["image"]
        im_bytes = im_file.read()
        im = Image.open(io.BytesIO(im_bytes))


        results = model(im, size=640)
        resBody = jsonify(results)

        return resBody

@app.route("/")
def hello():
    return 'Hello, World'


if __name__ == "__main__":
    
    app.run(host="0.0.0.0", port=5000, threaded=True)