from django.contrib.auth.models import AbstractUser
from django.db import models


class User(AbstractUser):
    # Estende l'utente di Django con campi aggiuntivi
    profile_image = models.ImageField(upload_to='profile_images/', null=True, blank=True)
    badges = models.ManyToManyField('Badge', through='UserBadge', blank=True)

    def __str__(self):
        return self.username


class Badge(models.Model):
    # Distintivi che gli utenti possono guadagnare
    name = models.CharField(max_length=100)
    description = models.TextField()
    icon = models.ImageField(upload_to='badge_icons/')

    def __str__(self):
        return self.name


class UserBadge(models.Model):
    # Tabella di associazione tra utenti e distintivi
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    badge = models.ForeignKey(Badge, on_delete=models.CASCADE)
    date_earned = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.user.username} - {self.badge.name}"