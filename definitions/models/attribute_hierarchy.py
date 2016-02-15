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


class CardDefinitionAttribute(models.Model):
    card_definition_attribute_definition = models.ForeignKey('CardDefinitionAttributeDefinition', models.DO_NOTHING)
    value = models.CharField(max_length=255, blank=True, null=True)
    card_definition = models.ForeignKey('CardDefinition', models.DO_NOTHING)

    def __repr__(self):
        return "{} {}".format(self.__class__.__name__, str(self))

    def __unicode__(self):
        return "{}: {}, {}={}".format(self.id,
                                         self.card_definition,
                                         self.card_definition_attribute_definition,
                                         self.value)

    class Meta:
        managed = False
        db_table = 'card_definition_attribute'


class CardDefinitionAttributeDefinition(models.Model):
    name = models.CharField(max_length=255)
    card_type = models.ForeignKey('CardType', models.DO_NOTHING)

    def __repr__(self):
        return "{} {}".format(self.__class__.__name__, str(self))

    def __unicode__(self):
        return "{}: {}".format(self.id, self.card_type, self.name)

    class Meta:
        managed = False
        db_table = 'card_definition_attribute_definition'
