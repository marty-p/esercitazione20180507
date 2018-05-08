/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Studente
 * Created: 8-mag-2018
 */

drop table if exists libro;
create table libro(
    id serial primary key,
    titolo varchar(100) not null,
    autore varchar(100),
    casa_editrice varchar(100)
);

drop table if exists biblioteca;
create table biblioteca(
    id serial primary key,
    nome varchar(100) not null,
    indirizzo varchar(200)
);

drop table if exists iscritto;
create table iscritto(
    id serial primary key,
    nome varchar(100),
    cognome varchar(100),
    email varchar(100) not null,
    residenza varchar(200),
    n_ammonizioni int,
    n_prestiti int
);

drop table if exists bibliotecario;
create table bibliotecario (
    id serial primary key,
    nome varchar(100),
    cognome varchar(100),
    email varchar(100) not null,
    residenza varchar(200),
    id_biblioteca bigint unsigned
        references biblioteca(id)
        on update cascade
        on delete cascade
);

drop table if exists iscrizione;
create table iscrizione(
    id_biblioteca bigint unsigned
        references biblioteca(id)
        on update cascade
        on delete set null,
    id_iscritto bigint unsigned
        references utente(id)
        on update cascade
        on delete set null,
    data_iscrizione date,
    primary key (id_biblioteca, id_iscritto)
);

drop table if exists registro;
create table registro(
    id_libro bigint unsigned
        references libro(id)
        on update cascade
        on delete set null,
    id_iscritto bigint unsigned
        references utente(id)
        on update cascade
        on delete set null,
    data_inizio date,
    data_fine date,
    primary key (id_libro, id_iscritto, data_inizio)
);
