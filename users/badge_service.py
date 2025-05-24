# File: users/badge_service.py
from django.db.models import Count
from .models import User, Badge, UserBadge
from trips.models import Trip
from posts.models import Post, Comment
import logging

logger = logging.getLogger(__name__)


class BadgeService:
    """Service per gestire l'assegnazione automatica dei badge"""

    @staticmethod
    def check_and_assign_badges(user):
        """Controlla e assegna tutti i badge possibili per un utente"""
        logger.info(f"Checking badges for user: {user.username}")

        # Lista di tutti i controlli badge
        badge_checks = [
            BadgeService._check_first_trip_badge,
            BadgeService._check_explorer_badge,
            BadgeService._check_photographer_badge,
            BadgeService._check_social_badge,
            BadgeService._check_globetrotter_badge,
        ]

        newly_earned = []
        for check_function in badge_checks:
            try:
                badge = check_function(user)
                if badge:
                    newly_earned.append(badge)
            except Exception as e:
                logger.error(f"Error checking badge for user {user.username}: {e}")

        return newly_earned

    @staticmethod
    def _check_first_trip_badge(user):
        """Badge per il primo viaggio creato"""
        badge_name = "First Trip"

        # Controlla se l'utente ha già questo badge
        if UserBadge.objects.filter(user=user, badge__name=badge_name).exists():
            return None

        # Controlla se l'utente ha creato almeno un viaggio
        trip_count = Trip.objects.filter(created_by=user).count()

        if trip_count >= 1:
            try:
                badge = Badge.objects.get(name=badge_name)
                UserBadge.objects.create(user=user, badge=badge)
                logger.info(f"Assigned '{badge_name}' badge to {user.username}")
                return badge
            except Badge.DoesNotExist:
                logger.warning(f"Badge '{badge_name}' does not exist in database")

        return None

    @staticmethod
    def _check_explorer_badge(user):
        """Badge per partecipare a 5 viaggi"""
        badge_name = "Explorer"

        if UserBadge.objects.filter(user=user, badge__name=badge_name).exists():
            return None

        # Conta i viaggi in cui l'utente è membro
        trip_count = user.trips.count()

        if trip_count >= 5:
            try:
                badge = Badge.objects.get(name=badge_name)
                UserBadge.objects.create(user=user, badge=badge)
                logger.info(f"Assigned '{badge_name}' badge to {user.username}")
                return badge
            except Badge.DoesNotExist:
                logger.warning(f"Badge '{badge_name}' does not exist in database")

        return None

    @staticmethod
    def _check_photographer_badge(user):
        """Badge per caricare 10 foto"""
        badge_name = "Photographer"

        if UserBadge.objects.filter(user=user, badge__name=badge_name).exists():
            return None

        # Conta i post con immagini dell'utente
        post_count = Post.objects.filter(user=user, image__isnull=False).exclude(image='').count()

        if post_count >= 10:
            try:
                badge = Badge.objects.get(name=badge_name)
                UserBadge.objects.create(user=user, badge=badge)
                logger.info(f"Assigned '{badge_name}' badge to {user.username}")
                return badge
            except Badge.DoesNotExist:
                logger.warning(f"Badge '{badge_name}' does not exist in database")

        return None

    @staticmethod
    def _check_social_badge(user):
        """Badge per lasciare 20 commenti"""
        badge_name = "Social"

        if UserBadge.objects.filter(user=user, badge__name=badge_name).exists():
            return None

        comment_count = Comment.objects.filter(user=user).count()

        if comment_count >= 20:
            try:
                badge = Badge.objects.get(name=badge_name)
                UserBadge.objects.create(user=user, badge=badge)
                logger.info(f"Assigned '{badge_name}' badge to {user.username}")
                return badge
            except Badge.DoesNotExist:
                logger.warning(f"Badge '{badge_name}' does not exist in database")

        return None

    @staticmethod
    def _check_globetrotter_badge(user):
        """Badge per visitare paesi diversi (basato sui location_name dei post)"""
        badge_name = "Globetrotter"

        if UserBadge.objects.filter(user=user, badge__name=badge_name).exists():
            return None

        # Conta locations uniche (semplificato)
        unique_locations = Post.objects.filter(
            user=user,
            location_name__isnull=False
        ).exclude(location_name='').values('location_name').distinct().count()

        if unique_locations >= 3:
            try:
                badge = Badge.objects.get(name=badge_name)
                UserBadge.objects.create(user=user, badge=badge)
                logger.info(f"Assigned '{badge_name}' badge to {user.username}")
                return badge
            except Badge.DoesNotExist:
                logger.warning(f"Badge '{badge_name}' does not exist in database")

        return None