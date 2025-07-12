create table if not exists `user`
(
    id int auto_increment primary key,
    name varchar(20) not null,
    insert_time datetime not null default current_timestamp,
    update_time datetime not null default current_timestamp on update current_timestamp
    );

create table if not exists `admin`
(
    id int auto_increment primary key,
    username varchar(50) not null unique,
    password varchar(100) not null,
    insert_time datetime not null default current_timestamp,
    update_time datetime not null default current_timestamp on update current_timestamp
);

create table if not exists `teacher`
(
    id int auto_increment primary key,
    name varchar(50) not null,
    title varchar(50),
    profile text,
    photo varchar(255),
    insert_time datetime not null default current_timestamp,
    update_time datetime not null default current_timestamp on update current_timestamp
);

create table if not exists `laboratory`
(
    id int auto_increment primary key,
    name varchar(100) not null,
    description text,
    leader varchar(50),
    photo varchar(255),
    insert_time datetime not null default current_timestamp,
    update_time datetime not null default current_timestamp on update current_timestamp
);

create table if not exists `alumni`
(
    id int auto_increment primary key,
    name varchar(50) not null,
    graduation_year int,
    profile text,
    photo varchar(255),
    insert_time datetime not null default current_timestamp,
    update_time datetime not null default current_timestamp on update current_timestamp
);

create table if not exists `news`
(
    id int auto_increment primary key,
    title varchar(200) not null,
    content text not null,
    publish_time datetime not null default current_timestamp,
    author varchar(50),
    insert_time datetime not null default current_timestamp,
    update_time datetime not null default current_timestamp on update current_timestamp
);

create table if not exists `major`
(
    id int auto_increment primary key,
    name varchar(100) not null,
    description text,
    duration varchar(20),
    degree varchar(50),
    insert_time datetime not null default current_timestamp,
    update_time datetime not null default current_timestamp on update current_timestamp
);
