from rest_framework import serializers
from .models import Post, Comment, Like
from users.serializers import UserSerializer


class CommentSerializer(serializers.ModelSerializer):
    user = UserSerializer(read_only=True)  # Incorpora i dettagli dell'utente

    class Meta:
        model = Comment
        fields = '__all__'


class PostSerializer(serializers.ModelSerializer):
    user = UserSerializer(read_only=True)  # Incorpora i dettagli dell'utente
    comments = CommentSerializer(many=True, read_only=True)  # Incorpora tutti i commenti
    likes_count = serializers.SerializerMethodField()  # Campo calcolato

    class Meta:
        model = Post
        fields = '__all__'

    def get_likes_count(self, obj):
        return obj.likes.count()  # Calcola il numero di "mi piace"