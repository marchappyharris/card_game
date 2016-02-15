from django.contrib import admin

# Register your models here.

from django.contrib import admin
from django.contrib.admin import ModelAdmin
from .models import *


class IdOrderedModelAdmin(ModelAdmin):
    ordering = ['id']


class CollectionIdOrderedModelAdmin(ModelAdmin):
    ordering = ['card_in_collection']


admin.site.register(Card, IdOrderedModelAdmin)
admin.site.register(CardInArray, CollectionIdOrderedModelAdmin)
admin.site.register(CardInCollection, IdOrderedModelAdmin)
admin.site.register(CardInFan, CollectionIdOrderedModelAdmin)
admin.site.register(CardInGrid, CollectionIdOrderedModelAdmin)
admin.site.register(CardInPile, CollectionIdOrderedModelAdmin)
admin.site.register(CardInTabletop, CollectionIdOrderedModelAdmin)
admin.site.register(Collection, IdOrderedModelAdmin)
admin.site.register(Deck, IdOrderedModelAdmin)
admin.site.register(GameSession, IdOrderedModelAdmin)
admin.site.register(Player, IdOrderedModelAdmin)
admin.site.register(PlayerM2MGameSession, IdOrderedModelAdmin)
