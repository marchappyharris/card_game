from django.contrib import admin

# Register your models here.

from django.contrib import admin
from django.core import urlresolvers
from .models import *

admin.site.register(AuthGroup)
admin.site.register(AuthGroupPermissions)
admin.site.register(AuthPermission)
admin.site.register(AuthUser)
admin.site.register(AuthUserGroups)
admin.site.register(AuthUserUserPermissions)
admin.site.register(BoxDefinition)
admin.site.register(BoxDefinitionM2MDeckDefinition)
admin.site.register(Card)
admin.site.register(CardDefinition)
admin.site.register(CardDefinitionAttribute)
admin.site.register(CardDefinitionAttributeDefinition)
admin.site.register(CardInArray)
admin.site.register(CardInCollection)
admin.site.register(CardInFan)
admin.site.register(CardInGrid)
admin.site.register(CardInPile)
admin.site.register(CardInTabletop)
admin.site.register(CardType)
admin.site.register(Collection)
admin.site.register(CollectionDefinition)
admin.site.register(CollectionDefinitionParentChild)
admin.site.register(CollectionType)
admin.site.register(Deck)
admin.site.register(DeckDefinition)
admin.site.register(DeckDefinitionM2MCardDefinition)
admin.site.register(DjangoAdminLog)
admin.site.register(DjangoContentType)
admin.site.register(DjangoMigrations)
admin.site.register(DjangoSession)
admin.site.register(FaceDefinition)
admin.site.register(GameDefinition)
admin.site.register(GameSession)
admin.site.register(GridDirectionType)
admin.site.register(GridProximityType)
admin.site.register(OrientationType)
admin.site.register(Player)
admin.site.register(PlayerM2MGameSession)
admin.site.register(VisibilityType)


class AAdmin(admin.ModelAdmin):
    list_display = ["field1", "link_to_B"]

    def link_to_B(self, obj):
        link = urlresolvers.reverse("admin:definitions", args=[obj.B.id])
        return u'<a href="%s">%s</a>' % (link, obj.B.name)

    link_to_B.allow_tags = True
    