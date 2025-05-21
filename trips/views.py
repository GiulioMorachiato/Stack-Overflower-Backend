from rest_framework import viewsets, permissions, status
from rest_framework.decorators import action
from rest_framework.response import Response
from .models import Trip
from .serializers import TripSerializer


class TripViewSet(viewsets.ModelViewSet):
    serializer_class = TripSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        # Filtra i viaggi in cui l'utente è membro
        return Trip.objects.filter(members=self.request.user)

    def perform_create(self, serializer):
        # Quando crea un viaggio, aggiunge l'utente come creatore e membro
        trip = serializer.save(created_by=self.request.user)
        trip.members.add(self.request.user)

    @action(detail=True, methods=['post'])
    def join(self, request, pk=None):
        # Endpoint personalizzato per unirsi a un viaggio
        trip = self.get_object()
        trip.members.add(request.user)
        return Response({'status': 'joined trip'})

    @action(detail=True, methods=['post'])
    def leave(self, request, pk=None):
        # Endpoint personalizzato per lasciare un viaggio
        trip = self.get_object()
        trip.members.remove(request.user)
        return Response({'status': 'left trip'})