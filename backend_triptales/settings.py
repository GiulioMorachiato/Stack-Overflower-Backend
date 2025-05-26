"""
Django settings for backend_triptales project.
"""

from pathlib import Path
import os

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-replace-this-with-a-real-secret-key-in-production'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['*']  # Permetti tutte le connessioni per sviluppo

# Application definition
INSTALLED_APPS = [
    # Django apps
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',

    # Third-party apps
    'rest_framework',
    'rest_framework.authtoken',
    'corsheaders',
    'djoser',

    # Local apps
    'users',
    'trips',
    'posts',
]

# CORS Settings - Configurazione più permissiva per sviluppo
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CORS_ALLOW_HEADERS = [
    'accept',
    'accept-encoding',
    'authorization',
    'content-type',
    'dnt',
    'origin',
    'user-agent',
    'x-csrftoken',
    'x-requested-with',
    'ngrok-skip-browser-warning',  # Header specifico per ngrok
]

CORS_ALLOWED_ORIGINS = [
    "http://pjwrossi5.duckdns.org:8000",      # Il tuo nuovo IP locale HTTP
]

# Headers per ngrok
SECURE_CROSS_ORIGIN_OPENER_POLICY = None
SECURE_REFERRER_POLICY = None

# CSRF Settings - Configurazione per sviluppo locale
CSRF_TRUSTED_ORIGINS = [
    "http://192.168.1.150:8000",      # Il tuo IP locale HTTP
    "https://192.168.1.150:8000",     # Il tuo IP locale HTTPS
    "https://8a20-95-251-223-155.ngrok-free.app",
    "http://localhost:8000",
    "http://127.0.0.1:8000",
]

# Per sviluppo locale
CSRF_COOKIE_SECURE = False
CSRF_COOKIE_SAMESITE = None

MIDDLEWARE = [
    'corsheaders.middleware.CorsMiddleware',  # DEVE essere primo
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'backend_triptales.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [BASE_DIR / 'templates'],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'backend_triptales.wsgi.application'

# Database
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'pwtriptales_db',
        'USER': 'root',
        'PASSWORD': 'rootroot',
        'HOST': 'db',
        'PORT': '3306',
        'OPTIONS': {
            'sql_mode': 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION',
            'charset': 'utf8mb4',
            'init_command': "SET sql_mode='STRICT_TRANS_TABLES'",
        },
    }
}

# Custom User Model
AUTH_USER_MODEL = 'users.User'

# Password validation
AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

# Internationalization
LANGUAGE_CODE = 'en-us'
TIME_ZONE = 'UTC'
USE_I18N = True
USE_TZ = True

# Static files
STATIC_URL = '/static/'
STATIC_ROOT = BASE_DIR / 'static'

# Media files
MEDIA_URL = '/media/'
MEDIA_ROOT = BASE_DIR / 'media'

# Default primary key field type
DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

# REST Framework - Aggiorna configurazione
REST_FRAMEWORK = {
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework.authentication.TokenAuthentication',
    ),
    'DEFAULT_PERMISSION_CLASSES': [
        'rest_framework.permissions.AllowAny',
    ],
    'DEFAULT_PAGINATION_CLASS': 'rest_framework.pagination.PageNumberPagination',
    'PAGE_SIZE': 10,
    'DEFAULT_RENDERER_CLASSES': [
        'rest_framework.renderers.JSONRenderer',
        'rest_framework.renderers.BrowsableAPIRenderer',
    ],
    'DEFAULT_THROTTLE_CLASSES': [],  # Disabilita throttling per sviluppo
    'DEFAULT_THROTTLE_RATES': {},
}

# DJOSER - Aggiorna configurazione
DJOSER = {
    'LOGIN_FIELD': 'username',
    'USER_CREATE_PASSWORD_RETYPE': False,
    'SEND_ACTIVATION_EMAIL': False,
    'PASSWORD_RESET_CONFIRM_URL': '#/password/reset/confirm/{uid}/{token}',
    'USERNAME_RESET_CONFIRM_URL': '#/username/reset/confirm/{uid}/{token}',
    'ACTIVATION_URL': '#/activate/{uid}/{token}',
    'SEND_CONFIRMATION_EMAIL': False,
    'SERIALIZERS': {
        'user_create': 'users.serializers.UserCreateSerializer',
        'user': 'users.serializers.UserSerializer',
        'current_user': 'users.serializers.UserSerializer',
    },
    'PERMISSIONS': {
        'user_create': ['rest_framework.permissions.AllowAny'],
        'user_list': ['rest_framework.permissions.AllowAny'],
    }
}

# Email settings
EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'

# Logging configuration - Aggiornato per debug migliore
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'verbose': {
            'format': '{levelname} {asctime} {module} {process:d} {thread:d} {message}',
            'style': '{',
        },
        'simple': {
            'format': '{levelname} {message}',
            'style': '{',
        },
    },
    'handlers': {
        'console': {
            'class': 'logging.StreamHandler',
            'formatter': 'simple',
        },
        'file': {
            'class': 'logging.FileHandler',
            'filename': BASE_DIR / 'logs' / 'django.log',
            'formatter': 'verbose',
        },
    },
    'root': {
        'handlers': ['console', 'file'],
        'level': 'INFO',
    },
    'loggers': {
        'django': {
            'handlers': ['console', 'file'],
            'level': 'INFO',
            'propagate': True,
        },
        'django.request': {
            'handlers': ['console', 'file'],
            'level': 'DEBUG',  # Per vedere gli errori delle richieste
            'propagate': True,
        },
        'djoser': {
            'handlers': ['console'],
            'level': 'DEBUG',  # Cambiato a DEBUG per vedere errori registrazione
            'propagate': True,
        },
        'rest_framework': {
            'handlers': ['console'],
            'level': 'DEBUG',  # Cambiato a DEBUG per vedere errori API
            'propagate': True,
        },
    },
}

# Assicurati che la directory logs esista
os.makedirs(BASE_DIR / 'logs', exist_ok=True)