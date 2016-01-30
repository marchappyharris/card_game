# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models

##############################################
# Django tables
##############################################

class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=80)

    def __str__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.name)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    def __str__(self):
        return "{} {}: {}={}".format(self.__class__.__name__, self.id, self.group, self.permission)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    def __str__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.name)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=30)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()

    def __str__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.username)

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    def __str__(self):
        return "{} {}: {}, {}".format(self.__class__.__name__, self.id, self.user, self.group)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    def __str__(self):
        return "{} {}: {}, {}".format(self.__class__.__name__, self.id, self.user, self.permission)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    def __str__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.name)

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


###########################################
# Definitions
###########################################

class BoxDefinition(models.Model):
    name = models.CharField(max_length=255)

    def __str__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.name)

    class Meta:
        managed = False
        db_table = 'box_definition'


class BoxDefinitionM2MDeckDefinition(models.Model):
    deck_definition = models.ForeignKey('DeckDefinition', models.DO_NOTHING)
    box_definition = models.ForeignKey(BoxDefinition, models.DO_NOTHING)
    deck_name = models.CharField(max_length=255)

    def __str__(self):
        return "{} {}: {}, {}, {}".format(self.__class__.__name__, self.id, self.box_definition, self.deck_definition, self.deck_name)

    class Meta:
        managed = False
        db_table = 'box_definition_m2m_deck_definition'
        unique_together = (('deck_definition', 'box_definition', 'deck_name'),)


class CardDefinition(models.Model):
    front_face_definition = models.ForeignKey('FaceDefinition', models.DO_NOTHING, related_name='card_definition_front_face')
    back_face_definition = models.ForeignKey('FaceDefinition', models.DO_NOTHING, related_name='card_definition_back_face')
    name = models.CharField(max_length=255)

    def __str__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.name)

    class Meta:
        managed = False
        db_table = 'card_definition'


class CardDefinitionAttribute(models.Model):
    card_definition_attribute_definition = models.ForeignKey('CardDefinitionAttributeDefinition', models.DO_NOTHING)
    value = models.CharField(max_length=255, blank=True, null=True)
    card_definition = models.ForeignKey(CardDefinition, models.DO_NOTHING)

    def __str__(self):
        return "{} {}: {}, {}={}".format(self.__class__.__name__, self.id, self.card_definition, self.card_definition_attribute_definition, self.value)

    class Meta:
        managed = False
        db_table = 'card_definition_attribute'


class CardDefinitionAttributeDefinition(models.Model):
    name = models.CharField(max_length=255)
    card_type = models.ForeignKey('CardType', models.DO_NOTHING)

    def __str__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.card_type, self.name)

    class Meta:
        managed = False
        db_table = 'card_definition_attribute_definition'


class CardType(models.Model):
    name = models.CharField(unique=True, max_length=255)

    def __str__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.name)

    class Meta:
        managed = False
        db_table = 'card_type'


class CollectionDefinition(models.Model):
    per_player = models.BooleanField()
    name = models.CharField(max_length=255)
    collection_type = models.ForeignKey('CollectionType', models.DO_NOTHING)

    def __str__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.name)

    class Meta:
        managed = False
        db_table = 'collection_definition'


class CollectionDefinitionParentChild(models.Model):
    child_collection_definition = models.ForeignKey(CollectionDefinition, models.DO_NOTHING, related_name='collection_definition_child')
    parent_collection_definition = models.ForeignKey(CollectionDefinition, models.DO_NOTHING, related_name='collection_definition_parent')
    name = models.CharField(max_length=255, blank=True, null=True)

    def __str__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.name)

    class Meta:
        managed = False
        db_table = 'collection_definition_parent_child'
        unique_together = (('parent_collection_definition', 'child_collection_definition', 'name'),)


class CollectionType(models.Model):
    name = models.CharField(unique=True, max_length=255, blank=True, null=True)

    def __str__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.name)

    class Meta:
        managed = False 
        db_table = 'collection_type'


class DeckDefinition(models.Model):
    name = models.CharField(unique=True, max_length=255)

    def __str__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.name)

    class Meta:
        managed = False
        db_table = 'deck_definition'


class DeckDefinitionM2MCardDefinition(models.Model):
    deck_definition = models.ForeignKey(DeckDefinition, models.DO_NOTHING)
    card_definition = models.ForeignKey(CardDefinition, models.DO_NOTHING)
    ordinal = models.IntegerField()

    def __str__(self):
        return "{} {}: {}, {}, {}".format(self.__class__.__name__, self.id, self.deck_definition, self.card_definition, ordinal)

    class Meta:
        managed = False
        db_table = 'deck_definition_m2m_card_definition'
        unique_together = (('card_definition', 'deck_definition', 'ordinal'),)


class FaceDefinition(models.Model):
    text_display = models.CharField(max_length=255)
    large_image = models.CharField(max_length=255, blank=True, null=True)
    small_image = models.CharField(max_length=255, blank=True, null=True)

    def __str__(self):
        return "{} {}: {}, {}".format(self.__class__.__name__, self.id, self.text_display, self.small_image)

    class Meta:
        managed = False
        db_table = 'face_definition'


class GameDefinition(models.Model):
    box_definition = models.ForeignKey(BoxDefinition, models.DO_NOTHING)
    initial_collection_definition = models.ForeignKey(CollectionDefinition, models.DO_NOTHING)
    name = models.CharField(max_length=255)

    def __str__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.name)

    class Meta:
        managed = False
        db_table = 'game_definition'


class GridDirectionType(models.Model):
    label = models.CharField(max_length=255)

    def __str__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.label)

    class Meta:
        managed = False
        db_table = 'grid_direction_type'


class GridProximityType(models.Model):
    label = models.CharField(max_length=255)

    def __str__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.label)

    class Meta:
        managed = False
        db_table = 'grid_proximity_type'


class OrientationType(models.Model):
    label = models.CharField(max_length=255)

    def __str__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.label)

    class Meta:
        managed = False
        db_table = 'orientation_type'


class VisibilityType(models.Model):
    visibility = models.CharField(max_length=255, blank=True, null=True)

    def __str__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.visibility)

    class Meta:
        managed = False
        db_table = 'visibility_type'


##################################
# Instances
##################################

class Card(models.Model):
    deck_definition_m2m_card_definition = models.ForeignKey('DeckDefinitionM2MCardDefinition', models.DO_NOTHING)
    deck = models.ForeignKey('Deck', models.DO_NOTHING)
    card_in_collection = models.ForeignKey('CardInCollection', models.DO_NOTHING)

    def __str__(self):
        return "{} {}: {}, {}".format(self.__class__.__name__, self.id, self.deck,
                                      self.deck_definition_m2m_card_definition)

    class Meta:
        managed = False
        db_table = 'card'


class CardInArray(models.Model):
    card_in_collection = models.ForeignKey('CardInCollection', models.DO_NOTHING, primary_key=True)
    order = models.IntegerField()

    def __str__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.card_in_collection)

    class Meta:
        managed = False
        db_table = 'card_in_array'


class CardInCollection(models.Model):
    collection = models.ForeignKey('Collection', models.DO_NOTHING)
    visible_to_others = models.BooleanField()
    visible_to_player = models.BooleanField()
    orientation_type = models.ForeignKey('OrientationType', models.DO_NOTHING, blank=True, null=True)

    def __str__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.collection)

    class Meta:
        managed = False
        db_table = 'card_in_collection'


class CardInFan(models.Model):
    card_in_collection = models.ForeignKey(CardInCollection, models.DO_NOTHING, primary_key=True)
    order = models.IntegerField()

    def __str__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.card_in_collection)

    class Meta:
        managed = False
        db_table = 'card_in_fan'


class CardInGrid(models.Model):
    card_in_collection = models.ForeignKey(CardInCollection, models.DO_NOTHING, primary_key=True)
    other_card = models.ForeignKey('self', models.DO_NOTHING, db_column='other_card', blank=True, null=True)
    grid_direction_type = models.ForeignKey('GridDirectionType', models.DO_NOTHING, blank=True, null=True)
    grid_proximity_type = models.ForeignKey('GridProximityType', models.DO_NOTHING, blank=True, null=True)

    def __str__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.card_in_collection)

    class Meta:
        managed = False
        db_table = 'card_in_grid'


class CardInPile(models.Model):
    card_in_collection = models.ForeignKey(CardInCollection, models.DO_NOTHING, primary_key=True)
    order = models.IntegerField()

    def __str__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.card_in_collection)

    class Meta:
        managed = False
        db_table = 'card_in_pile'


class CardInTabletop(models.Model):
    card_in_collection = models.ForeignKey(CardInCollection, models.DO_NOTHING)
    z_order = models.IntegerField()
    y = models.FloatField()
    x = models.FloatField()

    def __str__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.card_in_collection)

    class Meta:
        managed = False
        db_table = 'card_in_tabletop'


class Collection(models.Model):
    collection_definition = models.ForeignKey('CollectionDefinition', models.DO_NOTHING)
    parent_collection = models.ForeignKey('self', models.DO_NOTHING, blank=True, null=True)
    name = models.CharField(max_length=255, blank=True, null=True)
    player_m2m_game_session = models.ForeignKey('PlayerM2MGameSession', models.DO_NOTHING, blank=True, null=True)

    def __str__(self):
        return "{} {}: {}, {}, {}, {}".format(self.__class__.__name__, self.id, self.parent_collection,
                                              self.collection_definition, self.player_m2m_game_session, self.name)

    class Meta:
        managed = False
        db_table = 'collection'


class Deck(models.Model):
    box_definition_m2m_deck_definition = models.ForeignKey(BoxDefinitionM2MDeckDefinition, models.DO_NOTHING)
    game_session = models.ForeignKey('GameSession', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'deck'


class GameSession(models.Model):
    game_definition = models.ForeignKey(GameDefinition, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'game_session'


class Player(models.Model):
    user_name = models.CharField(unique=True, max_length=255)

    def __str__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.name)

    class Meta:
        managed = False
        db_table = 'player'


class PlayerM2MGameSession(models.Model):
    player = models.ForeignKey(Player, models.DO_NOTHING)
    player_alias = models.CharField(max_length=255, blank=True, null=True)
    game_session = models.ForeignKey(GameSession, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'player_m2m_game_session'
