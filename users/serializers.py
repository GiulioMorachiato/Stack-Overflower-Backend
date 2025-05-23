from rest_framework import serializers
from .models import User, Badge, UserBadge
from djoser.serializers import UserCreateSerializer as BaseUserCreateSerializer
from django.contrib.auth.password_validation import validate_password


class UserCreateSerializer(BaseUserCreateSerializer):
    password = serializers.CharField(write_only=True, validators=[validate_password])

    class Meta(BaseUserCreateSerializer.Meta):
        model = User
        fields = ['id', 'username', 'email', 'password']

    def validate_username(self, value):
        """Validazione personalizzata per username"""
        if not value or len(value.strip()) == 0:
            raise serializers.ValidationError("Username cannot be empty")

        if len(value) < 3:
            raise serializers.ValidationError("Username must be at least 3 characters long")

        if User.objects.filter(username=value).exists():
            raise serializers.ValidationError("Username already exists")
        return value

    def validate_email(self, value):
        """Validazione personalizzata per email"""
        if not value or len(value.strip()) == 0:
            raise serializers.ValidationError("Email cannot be empty")

        if User.objects.filter(email=value).exists():
            raise serializers.ValidationError("Email already exists")
        return value.lower()

    def validate_password(self, value):
        """Validazione personalizzata per password"""
        if not value or len(value.strip()) == 0:
            raise serializers.ValidationError("Password cannot be empty")

        if len(value) < 6:
            raise serializers.ValidationError("Password must be at least 6 characters long")
        return value

    def create(self, validated_data):
        """Override del metodo create per gestire la creazione utente"""
        try:
            user = User.objects.create_user(
                username=validated_data['username'],
                email=validated_data['email'],
                password=validated_data['password']
            )
            return user
        except Exception as e:
            raise serializers.ValidationError(f"Error creating user: {str(e)}")


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'profile_image']
        read_only_fields = ['id']


class BadgeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Badge
        fields = '__all__'


class UserBadgeSerializer(serializers.ModelSerializer):
    badge = BadgeSerializer(read_only=True)
    user = UserSerializer(read_only=True)

    class Meta:
        model = UserBadge
        fields = ['badge', 'user', 'date_earned']
        read_only_fields = ['date_earned']