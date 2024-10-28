from django.shortcuts import render
from django.contrib.auth.decorators import login_required


@login_required(login_url='accounts:must_authenticate')
def home_view(request):
    return render(request, 'mysite/home.html')

from rest_framework import generics
from .models import WorkoutProgram
from .serializers import WorkoutProgramSerializer

class WorkoutProgramListCreate(generics.ListCreateAPIView):
    queryset = WorkoutProgram.objects.all()
    serializer_class = WorkoutProgramSerializer

class WorkoutProgramRetrieveUpdateDestroy(generics.RetrieveUpdateDestroyAPIView):
    queryset = WorkoutProgram.objects.all()
    serializer_class = WorkoutProgramSerializer
