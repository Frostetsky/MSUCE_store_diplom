# MSUCE_store_diplom

- to create schema in MySql use

CREATE SCHEMA IF NOT EXISTS `hardwarestore` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;

- to create schema in PostgreSQL use

CREATE SCHEMA IF NOT EXISTS `hardwarestore`

- after this add role

INSERT INTO roles(id, name)
VALUES (1, 'ROLE_USER')
