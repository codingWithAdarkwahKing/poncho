# Generated by Django 4.0.2 on 2024-02-13 10:39

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='WorkoutProgram',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('height', models.IntegerField()),
                ('workout_type', models.CharField(max_length=100)),
                ('repetitions', models.IntegerField()),
            ],
        ),
    ]
