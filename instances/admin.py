from django.contrib import admin

# Register your models here.

from django.contrib import admin
from .models import *

admin.site.register(Card)
admin.site.register(CardInArray)
admin.site.register(CardInCollection)
admin.site.register(CardInFan)
admin.site.register(CardInGrid)
admin.site.register(CardInPile)
admin.site.register(CardInTabletop)
admin.site.register(Collection)
admin.site.register(Deck)
admin.site.register(GameSession)
admin.site.register(Player)
admin.site.register(PlayerM2MGameSession)

