# File: users/signals.py
from django.db.models.signals import post_save
from django.dispatch import receiver
from trips.models import Trip
from posts.models import Post, Comment
from .badge_service import BadgeService

@receiver(post_save, sender=Trip)
def check_badges_on_trip_created(sender, instance, created, **kwargs):
    """Controlla badge quando viene creato un viaggio"""
    if created:
        print(f"🎒 Trip created by {instance.created_by.username}, checking badges...")
        BadgeService.check_and_assign_badges(instance.created_by)

@receiver(post_save, sender=Post)
def check_badges_on_post_created(sender, instance, created, **kwargs):
    """Controlla badge quando viene creato un post"""
    if created:
        print(f"📸 Post created by {instance.user.username}, checking badges...")
        BadgeService.check_and_assign_badges(instance.user)

@receiver(post_save, sender=Comment)
def check_badges_on_comment_created(sender, instance, created, **kwargs):
    """Controlla badge quando viene creato un commento"""
    if created:
        print(f"💬 Comment created by {instance.user.username}, checking badges...")
        BadgeService.check_and_assign_badges(instance.user)