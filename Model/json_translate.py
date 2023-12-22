# -*- coding: utf-8 -*-

# !pip install ultralytics # 이 파이썬을 돌린 서버 환경에서 ultralytics를 설치하고 이 파이썬 파일을 돌리자
from flask import Flask, request
from ultralytics import YOLO
import json
from werkzeug import secure_filename
import io
from PIL import Image

app = Flask(__name__)
app.config['MAX_CONTENT_LENGTH'] = 10 * 1024 * 1024 # 우선 업로드 파일 최대 용량을 10MB로 설정함
# pt_path_0 = "/best_0.pt를/넣은/path/best_0.pt" # 서버상에 best_0.pt (결막염모델) 있는 절대 경로
# pt_path_1 = "/best_1.pt를/넣은/path/best_1.pt" # 서버상에 best_1.pt (결막염모델) 있는 절대 경로
# pt_path_2 = "/best_2.pt를/넣은/path/best_2.pt" # 서버상에 best_2.pt (결막염모델) 있는 절대 경로
# pt_path_5 = "/best_5.pt를/넣은/path/best_5.pt" # 서버상에 best_5.pt (결막염모델) 있는 절대 경로
# pt_path_7 = "/best_7.pt를/넣은/path/best_7.pt" # 서버상에 best_7.pt (결막염모델) 있는 절대 경로
# pt_path_9 = "/best_9.pt를/넣은/path/best_9.pt" # 서버상에 best_9.pt (결막염모델) 있는 절대 경로
pt_path_0 = "best_0.pt" # 동일한 폴더에 넣었을때 사용할 수 있는 상대경로 스타일
pt_path_1 = "best_1.pt"
pt_path_2 = "best_2.pt"
pt_path_5 = "best_5.pt"
pt_path_7 = "best_7.pt"
pt_path_9 = "best_9.pt"

def predict_image_model(pt_path, img_path):# 이미지 파일이 있는 path
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

@app.route('/predict.do', methods =['POST'])
def predictDo():
  if request.method != 'POST':
    return "Not POST"
  
  if request.files.get("image"):
    img_file = request.files["images"]
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

    box = {
      "결막염": box_0,
      "궤양성각막질환": box_1,
      "백내장": box_2,
      "안검내반증": box_7,
      "안검종양": box_7,
      "핵경화": box_9,
      }
    json = jsonify(box)
    return json

if __name__ == '__main__':
    app.run()