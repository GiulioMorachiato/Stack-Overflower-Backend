from django.db import models
from users.models import User

class Trip(models.Model):
    # Definisce un viaggio con i suoi membri
    name = models.CharField(max_length=200)
    description = models.TextField()
    start_date = models.DateField()
    end_date = models.DateField()
    created_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='created_trips')
    members = models.ManyToManyField(User, related_name='trips')  # Utenti che partecipano al viaggio
    created_at = models.DateTimeField(auto_now_add=True)