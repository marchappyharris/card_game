from django.contrib import admin

# Register your models here.

from django.contrib import admin
from django.contrib.admin import ModelAdmin
from .models import *


admin.site.register(BoxDefinition, None, ordering = ['id'])
admin.site.register(BoxDefinitionM2MDeckDefinition, None, ordering = ['id'])
admin.site.register(CardDefinition, None, ordering = ['id'])
admin.site.register(CardDefinitionAttribute, None, ordering = ['id'])
admin.site.register(CardDefinitionAttributeDefinition, None, ordering = ['id'])
admin.site.register(CardType, None, ordering = ['id'])
admin.site.register(CollectionDefinition, None, ordering = ['id'])
admin.site.register(CollectionDefinitionParentChild, None, ordering = ['id'])
admin.site.register(CollectionType, None, ordering = ['id'])
admin.site.register(DeckDefinition, None, ordering = ['id'])
admin.site.register(DeckDefinitionM2MCardDefinition, None, ordering = ['id'])
admin.site.register(FaceDefinition, None, ordering = ['id'])
admin.site.register(GameDefinition, None, ordering = ['id'])
admin.site.register(GridDirectionType, None, ordering = ['id'])
admin.site.register(GridProximityType, None, ordering = ['id'])
admin.site.register(OrientationType, None, ordering = ['id'])

