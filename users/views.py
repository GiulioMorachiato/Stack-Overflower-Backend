from rest_framework import viewsets, permissions
from .models import User, Badge, UserBadge
from .serializers import UserSerializer, BadgeSerializer, UserBadgeSerializer


class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = [permissions.IsAuthenticated]  # Solo utenti autenticati


class BadgeViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Badge.objects.all()
    serializer_class = BadgeSerializer


class UserBadgeViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = UserBadgeSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        # Filtra i distintivi dell'utente autenticato
        return UserBadge.objects.filter(user=self.request.user)