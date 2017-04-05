Hair Salon
An application for a hair salon. The stylists at the salon work independently, so each client will only belong to a single stylist (one stylist, many clients).

The following are the user stories:

As a salon owner, I want to view, add, update and delete stylists.
As a salon owner, I want to view, add, update and delete clients.
As a salon owner, I want to add clients to a stylist.

database setup instructions with your database

In PSQL:

CREATE DATABASE hair_salon;
  CREATE TABLE clients(id serial PRIMARY KEY, name varchar, stylist_id int);
  CREATE TABLE stylists(id serial PRIMARY KEY, name varchar);

CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;
