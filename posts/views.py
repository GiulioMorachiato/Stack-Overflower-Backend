from rest_framework import viewsets, permissions, status
from rest_framework.decorators import action
from rest_framework.response import Response
from .models import Post, Comment, Like
from .serializers import PostSerializer, CommentSerializer


class PostViewSet(viewsets.ModelViewSet):
    serializer_class = PostSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        # Filtra i post dei viaggi in cui l'utente è membro
        return Post.objects.filter(trip__members=self.request.user)

    def perform_create(self, serializer):
        # Imposta l'utente corrente come autore del post
        serializer.save(user=self.request.user)

    @action(detail=True, methods=['post'])
    def like(self, request, pk=None):
        # Endpoint personalizzato per mettere/togliere "mi piace"
        post = self.get_object()
        like, created = Like.objects.get_or_create(post=post, user=request.user)

        if not created:
            # Se il "mi piace" esisteva già, lo rimuove (toggle)
            like.delete()
            return Response({'status': 'unliked'})

        return Response({'status': 'liked'})

    @action(detail=True, methods=['post'])
    def comment(self, request, pk=None):
        # Endpoint personalizzato per aggiungere un commento
        post = self.get_object()
        content = request.data.get('content')

        comment = Comment.objects.create(
            post=post,
            user=request.user,
            content=content
        )

        serializer = CommentSerializer(comment)
        return Response(serializer.data, status=status.HTTP_201_CREATED)