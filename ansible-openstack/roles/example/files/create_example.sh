#!/bin/sh
# Create a domain, projects, users, and roles
openstack domain create --description "An Example Domain" example
openstack project create --domain default --description "Service Project" service
openstack project create --domain default --description "Demo Project" demo
openstack user create --domain default --password-prompt demo <<!
KEYSTONE_DBPASS
KEYSTONE_DBPASS
!
openstack role create user
openstack role add --project demo --user demo user
