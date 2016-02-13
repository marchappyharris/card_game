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


class CardInCollection(models.Model):
    collection = models.ForeignKey('Collection', models.DO_NOTHING)
    visible_to_others = models.BooleanField()
    visible_to_player = models.BooleanField()
    orientation_type = models.ForeignKey('definitions.OrientationType', models.DO_NOTHING, blank=True, null=True)
    my_ref = models.BigIntegerField(unique=True)

    def __unicode__(self):
        return "{} {}: ({}), visible_to_others={}, visible_to_player={}, orientation={}, my_ref={}".\
            format(self.__class__.__name__,
                   self.id,
                   self.collection,
                   self.visible_to_others,
                   self.visible_to_player,
                   self.orientation_type.label,
                   self.my_ref)

    class Meta:
        managed = False
        db_table = 'card_in_collection'


class CardInArray(models.Model):
    card_in_collection = models.ForeignKey('CardInCollection', models.DO_NOTHING, primary_key=True)
    ordinal = models.IntegerField()

    def __unicode__(self):
        return "{}, ({}), ordinal={}".format(self.__class__.__name__, 
                                             self.card_in_collection,
                                             self.ordinal)

    class Meta:
        managed = False
        db_table = 'card_in_array'


class CardInFan(models.Model):
    card_in_collection = models.ForeignKey(CardInCollection, models.DO_NOTHING, primary_key=True)
    ordinal = models.IntegerField()

    def __unicode__(self):
        return "{}, ({}), ordinal={}".format(self.__class__.__name__,
                                             self.card_in_collection,
                                             self.ordinal)

    class Meta:
        managed = False
        db_table = 'card_in_fan'


class CardInGrid(models.Model):
    card_in_collection = models.ForeignKey(CardInCollection, models.DO_NOTHING, primary_key=True)
    other_card = models.ForeignKey('self', models.DO_NOTHING, db_column='other_card', blank=True, null=True)
    grid_direction_type = models.ForeignKey('definitions.GridDirectionType', models.DO_NOTHING, blank=True, null=True)
    grid_proximity_type = models.ForeignKey('definitions.GridProximityType', models.DO_NOTHING, blank=True, null=True)

    def __unicode__(self):
        if (self.grid_direction_type == None):
            direction = "None"
        else:
            direction = self.grid_direction_type.label

        if (self.grid_proximity_type == None):
            proximity = "None"
        else:
            proximity = self.grid_proximity_type.label

        if (self.other_card == None):
            other_card_name = "None"
        else:
            other_card_name = self.other_card.card_in_collection.id
    
        return "{}, ({}), direction={}, proximity={}, other_card={}".format(self.__class__.__name__,
                                                                            self.card_in_collection,
                                                                            direction,
                                                                            proximity,
                                                                            other_card_name)

    class Meta:
        managed = False
        db_table = 'card_in_grid'


class CardInPile(models.Model):
    card_in_collection = models.ForeignKey(CardInCollection, models.DO_NOTHING, primary_key=True)
    ordinal = models.IntegerField()

    def __unicode__(self):
        return "{}, ({}), ordinal={}".format(self.__class__.__name__,
                                             self.card_in_collection,
                                             self.ordinal)

    class Meta:
        managed = False
        db_table = 'card_in_pile'


class CardInTabletop(models.Model):
    card_in_collection = models.ForeignKey(CardInCollection, models.DO_NOTHING, primary_key=True)
    z_order = models.IntegerField()
    y = models.FloatField()
    x = models.FloatField()

    def __unicode__(self):
        return "{}, ({}), position={},{}, order={}".format(self.__class__.__name__,
                                                           self.card_in_collection,
                                                           self.x,
                                                           self.y,
                                                           self.z_order)

    class Meta:
        managed = False
        db_table = 'card_in_tabletop'
