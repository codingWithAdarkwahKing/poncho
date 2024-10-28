from django.urls import path

from . import views

app_name = 'mysite'

urlpatterns = [
    path('home/', views.home_view, name='home'),
    path('workout/', views.WorkoutProgramListCreate.as_view(), name='workout-list-create'),
    path('workout/<int:pk>/', views.WorkoutProgramRetrieveUpdateDestroy.as_view(), name='workout-retrieve-update-destroy'),
]