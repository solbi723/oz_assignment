from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.
class User(AbstractUser):
    is_business = models.BooleanField(default=False)
    grade = models.CharField(max_length=10, default='C')





    #(models.Model) 상속
    # name = models.CharField(max_length=20) #이름 짧은 문자열 최대 20글자까지
    # description = models.TextField() # 긴 문자열
    # age = models.PositiveBigIntegerField(null = True) # 나이는 음수 x ,양의 정수형 숫자
    # gender = models.CharField(max_length=10) # 성별 (초이스를 사용해 남성 여성 둘 중 하나만 선택하도록도 가능함)

    # def __str__(self):
    #     return f"{self.name} / ({self.age}살)"

