from rest_framework import viewsets, permissions, status
from rest_framework.decorators import action
from rest_framework.response import Response
from .models import Trip
from .serializers import TripSerializer
import logging

logger = logging.getLogger(__name__)

class TripViewSet(viewsets.ModelViewSet):
    serializer_class = TripSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        # Filtra i viaggi in cui l'utente è membro
        queryset = Trip.objects.filter(members=self.request.user)
        logger.info(f"User {self.request.user} has {queryset.count()} trips")
        return queryset

    def list(self, request, *args, **kwargs):
        """Override del metodo list per debug"""
        queryset = self.get_queryset()
        serializer = self.get_serializer(queryset, many=True)
        logger.info(f"Returning trips data: {serializer.data}")
        return Response(serializer.data)

    def perform_create(self, serializer):
        # Quando crea un viaggio, aggiunge l'utente come creatore e membro
        trip = serializer.save(created_by=self.request.user)
        trip.members.add(self.request.user)
        logger.info(f"Created trip: {trip.name} for user: {self.request.user}")

    @action(detail=True, methods=['post'])
    def join(self, request, pk=None):
        # Endpoint personalizzato per unirsi a un viaggio
        trip = self.get_object()
        trip.members.add(request.user)
        logger.info(f"User {request.user} joined trip: {trip.name}")
        return Response({'status': 'joined trip'})

    @action(detail=True, methods=['post'])
    def leave(self, request, pk=None):
        # Endpoint personalizzato per lasciare un viaggio
        trip = self.get_object()
        trip.members.remove(request.user)
        logger.info(f"User {request.user} left trip: {trip.name}")
        return Response({'status': 'left trip'})