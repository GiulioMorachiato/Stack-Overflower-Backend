from django.db import models
from users.models import User
from trips.models import Trip


class Post(models.Model):
    # Post condivisi durante un viaggio
    trip = models.ForeignKey(Trip, on_delete=models.CASCADE, related_name='posts')
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    content = models.TextField()
    image = models.ImageField(upload_to='post_images/', null=True, blank=True)
    latitude = models.FloatField(null=True, blank=True)  # Coordinate geografiche
    longitude = models.FloatField(null=True, blank=True)
    location_name = models.CharField(max_length=200, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    # Campi per funzionalità ML Kit
    ocr_text = models.TextField(null=True, blank=True)  # Testo riconosciuto nelle immagini
    translated_text = models.TextField(null=True, blank=True)  # Traduzione
    object_tags = models.JSONField(null=True, blank=True)  # Tag degli oggetti riconosciuti
    smart_caption = models.TextField(null=True, blank=True)  # Didascalia generata


class Comment(models.Model):
    # Commenti ai post
    post = models.ForeignKey(Post, on_delete=models.CASCADE, related_name='comments')
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    content = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)


class Like(models.Model):
    # Mi piace ai post
    post = models.ForeignKey(Post, on_delete=models.CASCADE, related_name='likes')
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)