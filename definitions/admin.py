from django.contrib import admin

# Register your models here.

from django.contrib import admin
from django.contrib.admin import ModelAdmin
from .models import *


class IdOrderedModelAdmin(ModelAdmin):
    ordering = ['id']


admin.site.register(BoxDefinition, IdOrderedModelAdmin)
admin.site.register(BoxDefinitionM2MDeckDefinition, IdOrderedModelAdmin)
admin.site.register(CardDefinition, IdOrderedModelAdmin)
admin.site.register(CardDefinitionAttribute, IdOrderedModelAdmin)
admin.site.register(CardDefinitionAttributeDefinition, IdOrderedModelAdmin)
admin.site.register(CardType, IdOrderedModelAdmin)
admin.site.register(CollectionDefinition, IdOrderedModelAdmin)
admin.site.register(CollectionDefinitionParentChild, IdOrderedModelAdmin)
admin.site.register(CollectionType, IdOrderedModelAdmin)
admin.site.register(DeckDefinition, IdOrderedModelAdmin)
admin.site.register(DeckDefinitionM2MCardDefinition, IdOrderedModelAdmin)
admin.site.register(FaceDefinition, IdOrderedModelAdmin)
admin.site.register(GameDefinition, IdOrderedModelAdmin)
admin.site.register(GridDirectionType, IdOrderedModelAdmin)
admin.site.register(GridProximityType, IdOrderedModelAdmin)
admin.site.register(OrientationType, IdOrderedModelAdmin)

