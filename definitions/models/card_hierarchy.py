# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models

###########################################
# Definitions
###########################################


class BoxDefinition(models.Model):
    name = models.CharField(max_length=255)

    def __unicode__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.name)

    class Meta:
        managed = False
        db_table = 'box_definition'


class BoxDefinitionM2MDeckDefinition(models.Model):
    deck_definition = models.ForeignKey('DeckDefinition', models.DO_NOTHING)
    box_definition = models.ForeignKey(BoxDefinition, models.DO_NOTHING)
    deck_name = models.CharField(max_length=255)

    def __unicode__(self):
        return "{} {}: {}, {}, {}".format(self.__class__.__name__,
                                          self.id,
                                          self.box_definition,
                                          self.deck_definition, self.deck_name)

    class Meta:
        managed = False
        db_table = 'box_definition_m2m_deck_definition'
        unique_together = (('deck_definition', 'box_definition', 'deck_name'),)


class DeckDefinition(models.Model):
    name = models.CharField(unique=True, max_length=255)

    def __unicode__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.name)

    class Meta:
        managed = False
        db_table = 'deck_definition'


class DeckDefinitionM2MCardDefinition(models.Model):
    deck_definition = models.ForeignKey(DeckDefinition, models.DO_NOTHING)
    card_definition = models.ForeignKey(CardDefinition, models.DO_NOTHING)
    ordinal = models.IntegerField()

    def __unicode__(self):
        return "{} {}: {}, {}, {}".format(self.__class__.__name__,
                                          self.id,
                                          self.deck_definition,
                                          self.card_definition,
                                          self.ordinal)

    class Meta:
        managed = False
        db_table = 'deck_definition_m2m_card_definition'
        unique_together = (('card_definition', 'deck_definition', 'ordinal'),)


class CardDefinition(models.Model):
    front_face_definition = models.ForeignKey('FaceDefinition',
                                              models.DO_NOTHING,
                                              related_name='card_definition_front_face')
    back_face_definition = models.ForeignKey('FaceDefinition',
                                             models.DO_NOTHING,
                                             related_name='card_definition_back_face')
    name = models.CharField(max_length=255)

    def __unicode__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.name)

    class Meta:
        managed = False
        db_table = 'card_definition'


class FaceDefinition(models.Model):
    text_display = models.CharField(max_length=255)
    large_image = models.CharField(max_length=255, blank=True, null=True)
    small_image = models.CharField(max_length=255, blank=True, null=True)

    def __unicode__(self):
        return "{} {}: {}, {}".format(self.__class__.__name__, self.id, self.text_display, self.small_image)

    class Meta:
        managed = False
        db_table = 'face_definition'
