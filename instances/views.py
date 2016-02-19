from django.http import HttpResponse
from .models import GameSession
from django.template import loader


def index(request):
    sessions = GameSession.objects.order_by('game_definition__name')[:10]
    template = loader.get_template('instances/game_sessions.html')
    context = {
        'sessions': sessions,
    }
    return HttpResponse(template.render(context, request))

