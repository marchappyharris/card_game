# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from definitions.models import *

'''
To create a new decks full of cards for a new game session (the cards will not yet be in any collection:
Substitute the following parameters:
  :game_session_id the game session id to create new decks for

insert into card (deck_definition_m2m_card_definition_id, deck_id)
select deck_definition_m2m_card_definition_id, deck_id
from create_cards_vw
where d_game_session_id = :game_session_id;

The hard work is done by a view, as follows:

create_cards_vw:
select
  dc_d.id deck_definition_m2m_card_definition_id,
  d.id deck_id,
  d.id d_id, d.box_definition_m2m_deck_definition_id d_box_definition_m2m_deck_definition_id,
   d.game_session_id d_game_session_id,
  bd_d.id bd_d_id, bd_d.deck_definition_id bd_d_box_definition_id, bd_d.deck_name bd_d_deck_name,
  d_d.id d_d_id, d_d.name d_d_name,
  dc_d.id dc_d_id, dc_d.deck_definition_id dc_d_deck_definition_id,
   dc_d.card_definition_id dc_d_card_definition_id, dc_d.ordinal dc_d_ordinal,
  c_d.id c_d_id, c_d.name c_d_name
from deck d
join box_definition_m2m_deck_definition bd_d on d.box_definition_m2m_deck_definition_id = bd_d.id
join deck_definition d_d on d_d.id = bd_d.deck_definition_id
join deck_definition_m2m_card_definition dc_d on d_d.id = dc_d.deck_definition_id
join card_definition c_d on dc_d.card_definition_id = c_d.id;

'''


'''

To put all the cards in a specified deck into a collection.
The third (z) clause must be modified to match the collection_type
Substitute the following parameters:
  :deck_id the deck that all the cards are in
  :collection_id the collection to put the cards in
  :visible_to_others
  :visible_to_player
  :orientation_type_id

with
x as (
  select c.id card_id, nextval('card_in_collection_id_seq'::regclass) next_cc_id
  from card c
  where c.deck_id = :deck_id
) ,
y as (
  insert into card_in_collection (id, collection_id, visible_to_others, visible_to_player, orientation_type_id)
  select next_cc_id, :collection_id, :visible_to_others, :visible_to_player, :orientation_type_id from x
) ,
z as (
  insert into card_in_pile (card_in_collection_id, ordinal)
  select next_cc_id, 1 from x
)
update card
set card_in_collection_id = x.next_cc_id
from x
where card.id = x.card_id
;

'''

'''
To put a specific card or set of cards into a collection (where it previously was not in a collection):
The third (z) clause must be modified to match the collection_type.
This is similar to putting all the cards in a deck into a collection,
 except the where clause of the x statement is different
Substitute the following parameters:
  :deck_id the deck that all the cards are in
  :collection_id the collection to put the cards in
  :visible_to_others
  :visible_to_player
  :orientation_type_id

with
x as (
  select c.id card_id, nextval('card_in_collection_id_seq'::regclass) next_cc_id
  from card c
  where c.id = :card_id (or c.id = :card_id2, etc.)
) ,
y as (
  insert into card_in_collection (id, collection_id, visible_to_others, visible_to_player, orientation_type_id)
  select next_cc_id, :collection_id, :visible_to_others, :visible_to_player, :orientation_type_id from x
) ,
z as (
  insert into card_in_pile (card_in_collection_id, ordinal)
  select next_cc_id, 1 from x
)
update card
set card_in_collection_id = x.next_cc_id
from x
where card.id = x.card_id
;

'''


##############################################
# Django tables
##############################################

class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=80)

    def __unicode__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.name)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    def __unicode__(self):
        return "{} {}: {}={}".format(self.__class__.__name__, self.id, self.group, self.permission)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    def __unicode__(self):
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

    def __unicode__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.username)

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    def __unicode__(self):
        return "{} {}: {}, {}".format(self.__class__.__name__, self.id, self.user, self.group)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    def __unicode__(self):
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

    def __unicode__(self):
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


##################################
# Instances
##################################

class Card(models.Model):
    deck_definition_m2m_card_definition = models.ForeignKey('definitions.DeckDefinitionM2MCardDefinition',
                                                            models.DO_NOTHING)
    deck = models.ForeignKey('Deck', models.DO_NOTHING)

    def __unicode__(self):
        return "{} {}: {}, {}".format(self.__class__.__name__, self.id, self.deck,
                                      self.deck_definition_m2m_card_definition)

    class Meta:
        managed = False
        db_table = 'card'


class CardInArray(models.Model):
    card_in_collection = models.ForeignKey('CardInCollection', models.DO_NOTHING, primary_key=True)
    ordinal = models.IntegerField()

    def __unicode__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.card_in_collection)

    class Meta:
        managed = False
        db_table = 'card_in_array'


class CardInCollection(models.Model):
    collection = models.ForeignKey('Collection', models.DO_NOTHING)
    visible_to_others = models.BooleanField()
    visible_to_player = models.BooleanField()
    orientation_type = models.ForeignKey('definitions.OrientationType', models.DO_NOTHING, blank=True, null=True)
    card = models.ForeignKey(Card, models.DO_NOTHING, unique=True)

    def __unicode__(self):
        return "{} {}: {} in {}".format(self.__class__.__name__, self.id, self.card, self.collection)

    class Meta:
        managed = False
        db_table = 'card_in_collection'


class CardInFan(models.Model):
    card_in_collection = models.ForeignKey(CardInCollection, models.DO_NOTHING, primary_key=True)
    ordinal = models.IntegerField()

    def __unicode__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.card_in_collection)

    class Meta:
        managed = False
        db_table = 'card_in_fan'


class CardInGrid(models.Model):
    card_in_collection = models.ForeignKey(CardInCollection, models.DO_NOTHING, primary_key=True)
    other_card = models.ForeignKey('self', models.DO_NOTHING, db_column='other_card', blank=True, null=True)
    grid_direction_type = models.ForeignKey('definitions.GridDirectionType', models.DO_NOTHING, blank=True, null=True)
    grid_proximity_type = models.ForeignKey('definitions.GridProximityType', models.DO_NOTHING, blank=True, null=True)

    def __unicode__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.card_in_collection)

    class Meta:
        managed = False
        db_table = 'card_in_grid'


class CardInPile(models.Model):
    card_in_collection = models.ForeignKey(CardInCollection, models.DO_NOTHING, primary_key=True)
    ordinal = models.IntegerField()

    def __unicode__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.card_in_collection)

    class Meta:
        managed = False
        db_table = 'card_in_pile'


class CardInTabletop(models.Model):
    card_in_collection = models.ForeignKey(CardInCollection, models.DO_NOTHING)
    z_order = models.IntegerField()
    y = models.FloatField()
    x = models.FloatField()

    def __unicode__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.card_in_collection)

    class Meta:
        managed = False
        db_table = 'card_in_tabletop'


class Collection(models.Model):
    collection_definition = models.ForeignKey('definitions.CollectionDefinition', models.DO_NOTHING)
    parent_collection = models.ForeignKey('self', models.DO_NOTHING, blank=True, null=True)
    name = models.CharField(max_length=255, blank=True, null=True)
    player_m2m_game_session = models.ForeignKey('PlayerM2MGameSession', models.DO_NOTHING, blank=True, null=True)
    game_session = models.ForeignKey('GameSession', models.DO_NOTHING)

    def __unicode__(self):
        return "{} {}: {}, {}, {}".format(self.__class__.__name__,
                                          self.id, self.name,
                                          self.collection_definition, self.game_session)

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

    def __unicode__(self):
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
