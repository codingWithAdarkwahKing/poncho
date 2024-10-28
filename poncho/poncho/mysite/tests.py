from django.test import TestCase
from django.contrib.auth.models import AnonymousUser
from rest_framework.test import APIRequestFactory
from accounts.models import Account  # Adjusted import
from .models import WorkoutProgram
from .views import home_view
from .serializers import WorkoutProgramSerializer

class WorkoutProgramModelTestCase(TestCase):
    def setUp(self):
        self.workout_program = WorkoutProgram.objects.create(
            name='Test Program',
            height=180,
            workout_type='Strength',
            repetitions=10
        )

    def test_workout_program_creation(self):
        self.assertEqual(self.workout_program.name, 'Test Program')
        self.assertEqual(self.workout_program.height, 180)
        self.assertEqual(self.workout_program.workout_type, 'Strength')
        self.assertEqual(self.workout_program.repetitions, 10)

class ViewsTestCase(TestCase):
    def setUp(self):
        self.factory = APIRequestFactory()
        self.user = Account.objects.create_user(email='test@example.com', username='testuser', password='12345')
        
    def test_home_view_authenticated_user(self):
        request = self.factory.get('/')
        request.user = self.user
        response = home_view(request)
        self.assertEqual(response.status_code, 200)

    def test_home_view_anonymous_user(self):
        request = self.factory.get('/')
        request.user = AnonymousUser()
        response = home_view(request)
        self.assertEqual(response.status_code, 302)

class WorkoutProgramSerializerTestCase(TestCase):
    def setUp(self):
        self.workout_program_data = {
            'name': 'Test Program',
            'height': 180,
            'workout_type': 'Strength',
            'repetitions': 10
        }
        self.serializer = WorkoutProgramSerializer(data=self.workout_program_data)

    def test_valid_serializer(self):
        self.assertTrue(self.serializer.is_valid())

    def test_serializer_save(self):
        self.assertTrue(self.serializer.is_valid())  # Ensuring serializer is valid
        self.serializer.save()
        workout_program = WorkoutProgram.objects.get(name='Test Program')
        self.assertEqual(workout_program.height, 180)
