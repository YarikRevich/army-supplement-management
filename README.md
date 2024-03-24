# ArmySupplementManagement

[![StandWithUkraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://github.com/vshymanskyy/StandWithUkraine/blob/main/docs/README.md)

## General Information

An army supplement management database topology, which describes main army management structure for one exact military base out of the external topology context.

![](./docs/examples/high-level-design.png)

![](./docs/examples/detailed-design.png)

In order to gain logical isolation of data all the top-tier structures are separated by prefix.

> As the future update namespaces can be separated into different clusters using replication mechanism. The usage of namespace per instance approach gives an opportunity to allocate system resources specific to each database(namespace).

## Namespace

* Staff
  * Represents data related to military personnel. 
* Equipment inventory
  * Represents all the inventory related data, including different type of stuff, which can be assigned to military personnel.
* Logistics
  * Represents set of data related to logistics operations, including assignments, available routes and registered cargo.
* Administration
  * Represents data related to administrated activities, including deployment and training records, granted permissions. 
* Communication
  * Represents list of journals related to administration, logistics and equipment inventory

## Entity

* 

## Relation

* 