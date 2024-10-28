from django.db import models

class WorkoutProgram(models.Model):
    name = models.CharField(max_length=100)
    height = models.IntegerField()
    workout_type = models.CharField(max_length=100)
    repetitions = models.IntegerField()

    def __str__(self):
        return self.name