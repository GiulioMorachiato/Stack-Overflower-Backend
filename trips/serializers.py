from rest_framework import serializers
from .models import Trip
from users.serializers import UserSerializer


class TripSerializer(serializers.ModelSerializer):
    created_by = UserSerializer(read_only=True)  # Incorpora i dettagli dell'utente creatore
    members = UserSerializer(many=True, read_only=True)  # Incorpora i dettagli di tutti i membri

    class Meta:
        model = Trip
        fields = '__all__'