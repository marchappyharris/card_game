from django.contrib import admin

# Register your models here.

from django.contrib import admin
from django.contrib.admin import ModelAdmin
from .models import *


admin.site.register(Card, None, ordering = ['id'])
admin.site.register(CardInArray, None, ordering = ['card_in_collection'])
admin.site.register(CardInCollection, None, ordering = ['id'])
admin.site.register(CardInFan, None, ordering = ['card_in_collection'])
admin.site.register(CardInGrid, None, ordering = ['card_in_collection'])
admin.site.register(CardInPile, None, ordering = ['card_in_collection'])
admin.site.register(CardInTabletop, None, ordering = ['card_in_collection'])
admin.site.register(Collection, None, ordering = ['id'])
admin.site.register(Deck, None, ordering = ['id'])
admin.site.register(GameSession, None, ordering = ['id'])
admin.site.register(Player, None, ordering = ['id'])
admin.site.register(PlayerM2MGameSession, None, ordering = ['id'])
