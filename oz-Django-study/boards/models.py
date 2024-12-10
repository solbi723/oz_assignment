from django.db import models
from common.models import CommonModel #경로 입력> common폴더 안 models파일에서 CommonModel이라는 클래스 가져와/CommonModel이 models.Model을 상속받고 있음
# Create your models here.

# 게시글
# - title
# - content

class Board(CommonModel):
    title = models.CharField(max_length=30)
    content = models.TextField()
    writer = models.CharField(max_length=30)
    date = models.DateTimeField(auto_now_add=True)
    likes = models.PositiveBigIntegerField(default=0)
    reviews = models.PositiveBigIntegerField(default=0)

    user = models.ForeignKey("users.User",on_delete=models.CASCADE)

    def __str__(self):
        return self.title