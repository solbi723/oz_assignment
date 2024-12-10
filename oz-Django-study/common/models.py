from django.db import models

# Create your models here.
class CommonModel(models.Model):
    created_at = models.DateTimeField(auto_now_add=True) # 현재 데이터 생성 시간을 기준으로 생성됨 -> 이후 데이터가 업데이트 되어도 수정되지 않음
    updated_at = models.DateTimeField(auto_now=True) # 생성되는 시간 기준으로 일단 생성됨 -> 이후 데이터가 업데이트가 되면 시간도 업데이트 된 현재 시간을 기준으로 업데이트 됨

    # Meta클래스는 권한, 데이터베이스 이름, 단 복수 이름, 추상화, 순서 지정 등과 같은 모델에 대한 다양한 사항을 정의하는 데 사용
    class Meta:
        abstract = True # DB 테이블에 위와 같은 컬럼들이 추가되지 않음
        

