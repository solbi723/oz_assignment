from django.contrib import admin
from .models import Board

# Register your models here.
@admin.register(Board)
class BoardAdmin(admin.ModelAdmin):
    list_display = ('title', 'writer', 'date', 'likes', 'content', "created_at", "updated_at") #리스트형태, 튜플 다 가능
    list_filter = ('date', "writer")
    search_fields = ('title', 'content')
    ordering = ('-date',) #-붙이면 역순
    readonly_fields = ('writer',)
    fieldsets = (
        (None, {'fields': ('title', 'content')}),
        ('추가 옵션', {'fields': ('writer', 'likes', 'reviews'), 'classes': ('collapse',)}),
    )
    list_per_page = 10 #한 페이지에 보여줄 게시글

    actions = ('increment_likes',)

    def increment_likes(self, request, queryset):
        # 선택된 게시글들에 대해 'likes' 수를 1씩 증가
        for board in queryset:
            board.likes += 1
            board.save()
    increment_likes.short_description = "선택된 게시글의 좋아요 수 증가"