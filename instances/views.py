from django.http import HttpResponse
from .models import GameSession

def index(request):
    sessions = GameSession.objects.order_by('game_definition__name')[:10]
    output = ', '.join([str(session) for session in sessions])

#    locales = "Current locale: %s %s -- Default locale: %s %s" % (locale.getlocale() + locale.getdefaultlocale())
    return HttpResponse(output)
