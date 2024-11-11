from flask import Flask
from flask_restful import Api
from resources.item import Item #resources 폴더에서 item.py파일에 Item 클래스
app = Flask(__name__)

api = Api(app)

items = [] #DB의 대체 역할 (간단한 DB 역할)


    
api.add_resource(Item, '/item/<string:name>')   #경로 추가

