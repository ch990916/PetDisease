# -*- coding: utf-8 -*-

import io
import torch
from flask import Flask, request, jsonify, make_response
from flask_cors import CORS
from PIL import Image
import json
from ultralytics import YOLO


app = Flask(__name__)
CORS(app)

skin_model = torch.hub.load('ultralytics/yolov5', 'custom', path='pet_detect.pt', force_reload=True)

pt_path_0 = "best_0.pt" # 동일한 폴더에 넣었을때 사용할 수 있는 상대경로 스타일
pt_path_1 = "best_1.pt"
pt_path_2 = "best_2.pt"
pt_path_5 = "best_5.pt"
pt_path_7 = "best_7.pt"
pt_path_9 = "best_9.pt"

def predict_image_model(pt_path, img_path):# /best.pt를/넣은/path/best.pt, # 이미지가 적힌 path
  model = YOLO(pt_path)
  results = model(img_path)  # return a list of Results objects
  return results


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

def box_dict(results):
  # Process results list
  for result in results:
      boxes = result.boxes.cpu().numpy()  # Boxes object for bbox outputs
  box = boxes[0]
  box_dict = {
      'cls': str(round(box.cls[0])), # 0 - 무증상, 1 - 결막염, 2 - 궤양성각막질환 , 3 - 백내장, 4 - 비궤양성각막질환, 5 - 색소침착성각막염, 6 - 안검내반증, 7 - 안검염, 8 - 안검종양, 9 - 유루증, 10 - 핵경화
      'conf': str(box.conf[0]), # json은 float을 변환 불가,
      'orig_shape': [box.orig_shape[0], box.orig_shape[1]], # [width, height]
      'xyxy': [round(v) for v in box.xyxy[0]], # [x시작좌표, y시작좌표, x종료좌표, y종료좌표]
  }
  return box_dict

def eye_jsonify(box_dict):
  return json.dumps(box_dict, ensure_ascii=False, indent="\t")

@app.route("/detect.json", methods=["POST"])     #요청
def predict():
    # POST 요청이 아닐경우, error처리 할거
    if request.method != "POST":
        return "hello world"

    if request.files.get("pm_photo"):
        
        im_file = request.files["pm_photo"]
        im_bytes = im_file.read()
        im = Image.open(io.BytesIO(im_bytes))
        print(im)
        results = skin_model(im, size=640)
        resBody = jsonify(results)

        return resBody

@app.route('/predict.do', methods =['POST'])
def predictDo():
  if request.method != 'POST':
    return "Not POST"
  
  if request.files.get("pm_photo"):
    img_file = request.files["pm_photo"]
    img_bytes = img_file.read()
    img = Image.open(io.BytesIO(img_bytes))

    results_0 = predict_image_model(pt_path_0, img)
    box_0 = box_dict(results_0)
    results_1 = predict_image_model(pt_path_1, img)
    box_1 = box_dict(results_1)
    results_2 = predict_image_model(pt_path_2, img)
    box_2 = box_dict(results_2)
    results_5 = predict_image_model(pt_path_5, img)
    box_5 = box_dict(results_5)
    results_7 = predict_image_model(pt_path_7, img)
    box_7 = box_dict(results_7)
    results_9 = predict_image_model(pt_path_9, img)
    box_9 = box_dict(results_9)

    box_list = [box_0, box_1, box_2, box_5, box_7, box_9]
    conf_list = [float(a['conf']) for a in box_list]
    max_conf = max(conf_list)
    diease_list = ["결막염","궤양성각막질환","백내장","안검내반증","안검종양","핵경화"]
    pred_disease = ""
    j = 0
    for i in range(len(conf_list)):
      if max_conf == conf_list[i]:
        pred_disease = diease_list[i]
        j = i
    
    if max_conf == 0.0001:
      pred_disease = "무증상"
    box = {
        "name": pred_disease,
        "conf": max_conf,
    }
    json = eye_jsonify(box)
    return json


@app.route("/")
def hello():
    return 'Hello, World'


if __name__ == "__main__":
    
    app.run(host="0.0.0.0", port=5000, threaded=True)