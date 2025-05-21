from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from rest_framework.routers import DefaultRouter

# Rimuovi temporaneamente questi import fino a quando non completi tutte le viste
# from users.views import UserViewSet, BadgeViewSet, UserBadgeViewSet
# from trips.views import TripViewSet
# from posts.views import PostViewSet

router = DefaultRouter()
# Commenta temporaneamente questi registratori fino a quando non completi tutte le viste
# router.register(r'users', UserViewSet)
# router.register(r'badges', BadgeViewSet)
# router.register(r'user-badges', UserBadgeViewSet, basename='user-badges')
# router.register(r'trips', TripViewSet, basename='trips')
# router.register(r'posts', PostViewSet, basename='posts')

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
    path('auth/', include('djoser.urls')),
    path('auth/', include('djoser.urls.jwt')),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)