from django.http import HttpResponse
import locale


def index(request):
    locales = "Current locale: %s %s -- Default locale: %s %s" % (locale.getlocale() + locale.getdefaultlocale())
    return HttpResponse("locales: " + locales)
