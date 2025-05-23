from rest_framework import serializers
from .models import Trip
from users.serializers import UserSerializer


class TripSerializer(serializers.ModelSerializer):
    created_by = UserSerializer(read_only=True)  # Incorpora i dettagli dell'utente creatore
    members = UserSerializer(many=True, read_only=True)  # Incorpora i dettagli di tutti i membri
    start_date = serializers.DateField(format='%Y-%m-%d')  # Formato esplicito per le date
    end_date = serializers.DateField(format='%Y-%m-%d')
    created_at = serializers.DateTimeField(format='%Y-%m-%d %H:%M:%S', read_only=True)

    class Meta:
        model = Trip
        fields = ['id', 'name', 'description', 'start_date', 'end_date', 'created_by', 'members', 'created_at']
        read_only_fields = ['id', 'created_by', 'created_at']

    def create(self, validated_data):
        """Override del metodo create per gestire la creazione"""
        # Il created_by sarà impostato nella view
        return super().create(validated_data)