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
        # 🔧 MODIFICA: Mostra tutti i viaggi invece di filtrare solo quelli dell'utente
        queryset = Trip.objects.all().order_by('-created_at')
        logger.info(f"User {self.request.user} can see {queryset.count()} trips")
        return queryset

    def list(self, request, *args, **kwargs):
        """Override del metodo list per debug"""
        queryset = self.get_queryset()
        serializer = self.get_serializer(queryset, many=True)
        logger.info(f"Returning trips data: {len(serializer.data)} trips")
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

        # Controlla se l'utente è già membro
        if request.user in trip.members.all():
            return Response(
                {'status': 'already_member', 'message': 'You are already a member of this trip'},
                status=status.HTTP_200_OK
            )

        trip.members.add(request.user)
        logger.info(f"User {request.user} joined trip: {trip.name}")
        return Response({'status': 'joined trip'})

    @action(detail=True, methods=['post'])
    def leave(self, request, pk=None):
        # Endpoint personalizzato per lasciare un viaggio
        trip = self.get_object()

        # Non permettere al creatore di lasciare il proprio viaggio
        if trip.created_by == request.user:
            return Response(
                {'status': 'error', 'message': 'Trip creator cannot leave the trip'},
                status=status.HTTP_400_BAD_REQUEST
            )

        trip.members.remove(request.user)
        logger.info(f"User {request.user} left trip: {trip.name}")
        return Response({'status': 'left trip'})