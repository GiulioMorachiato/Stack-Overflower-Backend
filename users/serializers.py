from rest_framework import serializers
from .models import User, Badge, UserBadge
from djoser.serializers import UserCreateSerializer as BaseUserCreateSerializer


class UserCreateSerializer(BaseUserCreateSerializer):
    class Meta(BaseUserCreateSerializer.Meta):
        model = User
        # 🔧 RIMUOVI 'profile_image' per ora - solo campi base per registrazione
        fields = ['id', 'username', 'email', 'password']


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'profile_image']  # Qui puoi tenerlo


class BadgeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Badge
        fields = '__all__'


class UserBadgeSerializer(serializers.ModelSerializer):
    badge = BadgeSerializer()

    class Meta:
        model = UserBadge
        fields = ['badge', 'date_earned']