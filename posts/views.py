from rest_framework import viewsets, permissions, status
from rest_framework.decorators import action
from rest_framework.response import Response
from .models import Post, Comment, Like
from .serializers import PostSerializer, CommentSerializer
import logging

logger = logging.getLogger(__name__)


class PostViewSet(viewsets.ModelViewSet):
    serializer_class = PostSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        # 🔧 MODIFICA: Mostra i post dei viaggi in cui l'utente è membro
        trip_id = self.request.query_params.get('trip', None)

        if trip_id:
            # Se è specificato un trip_id, mostra i post di quel viaggio
            # solo se l'utente è membro del viaggio
            queryset = Post.objects.filter(
                trip_id=trip_id,
                trip__members=self.request.user
            ).order_by('-created_at')
            logger.info(f"User {self.request.user} requesting posts for trip {trip_id}: {queryset.count()} posts found")
        else:
            # Altrimenti mostra tutti i post dei viaggi in cui l'utente è membro
            queryset = Post.objects.filter(
                trip__members=self.request.user
            ).order_by('-created_at')
            logger.info(f"User {self.request.user} requesting all posts: {queryset.count()} posts found")

        return queryset

    def perform_create(self, serializer):
        # Imposta l'utente corrente come autore del post
        serializer.save(user=self.request.user)
        logger.info(f"User {self.request.user} created post: {serializer.instance.content}")

    @action(detail=True, methods=['post'])
    def like(self, request, pk=None):
        # Endpoint personalizzato per mettere/togliere "mi piace"
        post = self.get_object()
        like, created = Like.objects.get_or_create(post=post, user=request.user)

        if not created:
            # Se il "mi piace" esisteva già, lo rimuove (toggle)
            like.delete()
            logger.info(f"User {request.user} unliked post {post.id}")
            return Response({'status': 'unliked'})

        logger.info(f"User {request.user} liked post {post.id}")
        return Response({'status': 'liked'})

    @action(detail=True, methods=['post'])
    def comment(self, request, pk=None):
        # Endpoint personalizzato per aggiungere un commento
        post = self.get_object()
        content = request.data.get('content')

        if not content or content.strip() == '':
            return Response(
                {'error': 'Content cannot be empty'},
                status=status.HTTP_400_BAD_REQUEST
            )

        comment = Comment.objects.create(
            post=post,
            user=request.user,
            content=content.strip()
        )

        serializer = CommentSerializer(comment)
        logger.info(f"User {request.user} commented on post {post.id}")
        return Response(serializer.data, status=status.HTTP_201_CREATED)