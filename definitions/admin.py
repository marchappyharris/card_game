from django.contrib import admin

# Register your models here.

from django.contrib import admin
from .models import *

admin.site.register(BoxDefinition)
admin.site.register(BoxDefinitionM2MDeckDefinition)
admin.site.register(CardDefinition)
admin.site.register(CardDefinitionAttribute)
admin.site.register(CardDefinitionAttributeDefinition)
admin.site.register(CardType)
admin.site.register(CollectionDefinition)
admin.site.register(CollectionDefinitionParentChild)
admin.site.register(CollectionType)
admin.site.register(DeckDefinition)
admin.site.register(DeckDefinitionM2MCardDefinition)
admin.site.register(FaceDefinition)
admin.site.register(GameDefinition)
admin.site.register(GridDirectionType)
admin.site.register(GridProximityType)
admin.site.register(OrientationType)

