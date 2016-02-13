# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from definitions.models import *


##################################
# Instances
##################################


class Card(models.Model):
    deck_definition_m2m_card_definition = models.ForeignKey('definitions.DeckDefinitionM2MCardDefinition', models.DO_NOTHING)
    deck = models.ForeignKey('Deck', models.DO_NOTHING)
    card_in_collection = models.ForeignKey('CardInCollection', models.DO_NOTHING, unique=True, blank=True, null=True)

    def __unicode__(self):
        if (self.card_in_collection == None):
            collection_id = 'None'
        else:
            collection_id = self.card_in_collection.id
        return "{} {}: {}, card_in_ollection={}".format(self.__class__.__name__,
                                                        self.id,
                                                        self.deck_definition_m2m_card_definition.card_definition.name,
                                                        collection_id)

    class Meta:
        managed = False
        db_table = 'card'


class Collection(models.Model):
    collection_definition = models.ForeignKey('definitions.CollectionDefinition', models.DO_NOTHING)
    parent_collection = models.ForeignKey('self', models.DO_NOTHING, blank=True, null=True)
    name = models.CharField(max_length=255, blank=True, null=True)
    player_m2m_game_session = models.ForeignKey('PlayerM2MGameSession', models.DO_NOTHING, blank=True, null=True)
    game_session = models.ForeignKey('GameSession', models.DO_NOTHING)

    def __unicode__(self):
        if (self.name == None):
            self_name = ''
        else:
            self_name = 'Name=' + self.name + ','

        return "{} {}: {} Collection={}, Session={}".format(self.__class__.__name__,
                                                            self.id, self_name,
                                                            self.collection_definition.name, self.game_session.id)

    class Meta:
        managed = False
        db_table = 'collection'


class Deck(models.Model):
    box_definition_m2m_deck_definition = models.ForeignKey(BoxDefinitionM2MDeckDefinition, models.DO_NOTHING)
    game_session = models.ForeignKey('GameSession', models.DO_NOTHING)

    def __unicode__(self):
        return "{} {}: Deck={}, Session={}".format(self.__class__.__name__,
                                                      self.id,
                                                      self.box_definition_m2m_deck_definition.deck_definition.name,
                                                      self.game_session.id)

    class Meta:
        managed = False
        db_table = 'deck'


class GameSession(models.Model):
    game_definition = models.ForeignKey(GameDefinition, models.DO_NOTHING)

    def __unicode__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.game_definition.name)

    class Meta:
        managed = False
        db_table = 'game_session'


class Player(models.Model):
    user_name = models.CharField(unique=True, max_length=255)

    def __unicode__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.user_name)

    class Meta:
        managed = False
        db_table = 'player'


class PlayerM2MGameSession(models.Model):
    player = models.ForeignKey(Player, models.DO_NOTHING)
    player_alias = models.CharField(max_length=255, blank=True, null=True)
    game_session = models.ForeignKey(GameSession, models.DO_NOTHING)

    def __unicode__(self):
        return "{} {}: user={} (alias={}), session={}".format(self.__class__.__name__,
                                                              self.id,
                                                              self.player.user_name,
                                                              self.player_alias,
                                                              self.game_session)

    class Meta:
        managed = False
        db_table = 'player_m2m_game_session'
