# -*- coding: utf-8 -*-
"""json_translate

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1CMci5RWJeDhMSfLLPa6GBqJemaHqu5KI
"""

# !pip install ultralytics # 이 파이썬을 돌린 서버 환경에서 ultralytics를 설치하고 이 파이썬 파일을 돌리자
from flask import Flask
from ultralytics import YOLO
import json

app = Flask(__name__)

def predict_image_model(pt_path, img_path):# /best.pt를/넣은/path/best.pt, # 이미지가 적힌 path
  model = YOLO(pt_path)
  results = model(img_path)  # return a list of Results objects
  return results

# 예측 데이터를 필요한 정보들만 딕셔너리 형태로 담는다
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

# 딕셔너리를 받아서 json 형태로 반환
def jsonify(box_dict):
  return json.dumps(box_dict, ensure_ascii=False, indent="\t")


# 혹시 몰라서 json파일을 생성하는 함수도 만듬
def make_json_file(box_dict, save_folder_path): # 딕셔너리 데이터 입력받기, 저장될 폴더 path 받기
  with open(save_folder_path + '/' + 'json_file.json', "w", encoding="utf-8") as file_write: # 저장될 폴더에 json 파일 만들기
    # write json data into file
    json.dump(box_dict, file_write, ensure_ascii=False, indent="\t") # 만든 json파일에 내용 적기, indent="\t" 있어야 한줄로 않나오고 탭넣어서 나옴

@app.route('/')
def index_html():
  return 'index.html'

@app.route('/predict.do')
def predictDo(pt_path, img_path):
  results = predict_image_model(pt_path, img_path)
  box = box_dict(results)
  json = jsonify(box)
  return json

if __name__ == '__main__':
    app.run()