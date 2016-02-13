from django.http import HttpResponse
import locale


def index(request):
    locales = "Current locale: %s %s -- Default locale: %s %s" % (locale.getlocale() + locale.getdefaultlocale())
    return HttpResponse("<p>This is card game.</p><p>There's nothing here yet.</p><p>locales: " + locales)
