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


class CardType(models.Model):
    name = models.CharField(unique=True, max_length=255)

    def __repr__(self):
        return "{} {}".format(self.__class__.__name__, str(self))

    def __unicode__(self):
        return "{}: {}".format(self.id, self.name)

    class Meta:
        managed = False
        db_table = 'card_type'


class CollectionType(models.Model):
    name = models.CharField(unique=True, max_length=255, blank=True, null=True)

    def __repr__(self):
        return "{} {}".format(self.__class__.__name__, str(self))

    def __unicode__(self):
        return "{}: {}".format(self.id, self.name)

    class Meta:
        managed = False
        db_table = 'collection_type'


class GridDirectionType(models.Model):
    label = models.CharField(max_length=255)

    def __repr__(self):
        return "{} {}".format(self.__class__.__name__, str(self))

    def __unicode__(self):
        return "{}: {}".format(self.id, self.label)

    class Meta:
        managed = False
        db_table = 'grid_direction_type'


class GridProximityType(models.Model):
    label = models.CharField(max_length=255)

    def __repr__(self):
        return "{} {}".format(self.__class__.__name__, str(self))

    def __unicode__(self):
        return "{}: {}".format(self.id, self.label)

    class Meta:
        managed = False
        db_table = 'grid_proximity_type'


class OrientationType(models.Model):
    label = models.CharField(max_length=255)

    def __repr__(self):
        return "{} {}".format(self.__class__.__name__, str(self))

    def __unicode__(self):
        return "{}: {}".format(self.id, self.label)

    class Meta:
        managed = False
        db_table = 'orientation_type'

