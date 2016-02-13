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


##################################
# Instances
##################################


class Card(models.Model):
    deck_definition_m2m_card_definition = models.ForeignKey('definitions.DeckDefinitionM2MCardDefinition', models.DO_NOTHING)
    deck = models.ForeignKey('Deck', models.DO_NOTHING)
    card_in_collection = models.ForeignKey('CardInCollection', models.DO_NOTHING, unique=True, blank=True, null=True)

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
    my_ref = models.BigIntegerField(unique=True)

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
