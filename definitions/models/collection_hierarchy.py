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


class GameDefinition(models.Model):
    box_definition = models.ForeignKey('BoxDefinition', models.DO_NOTHING)
    initial_collection_definition = models.ForeignKey(CollectionDefinition, models.DO_NOTHING)
    name = models.CharField(max_length=255)

    def __unicode__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.name)

    class Meta:
        managed = False
        db_table = 'game_definition'


class CollectionDefinition(models.Model):
    per_player = models.BooleanField()
    name = models.CharField(max_length=255)
    collection_type = models.ForeignKey('CollectionType', models.DO_NOTHING)

    def __unicode__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.name)

    class Meta:
        managed = False
        db_table = 'collection_definition'


class CollectionDefinitionParentChild(models.Model):
    child_collection_definition = models.ForeignKey(CollectionDefinition,
                                                    models.DO_NOTHING,
                                                    related_name='collection_definition_child')
    parent_collection_definition = models.ForeignKey(CollectionDefinition,
                                                     models.DO_NOTHING,
                                                     related_name='collection_definition_parent')
    name = models.CharField(max_length=255, blank=True, null=True)

    def __unicode__(self):
        return "{} {}: {}".format(self.__class__.__name__, self.id, self.name)

    class Meta:
        managed = False
        db_table = 'collection_definition_parent_child'
        unique_together = (('parent_collection_definition', 'child_collection_definition', 'name'),)
