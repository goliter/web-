create table if not exists `user`
(
    id int auto_increment primary key,
    name varchar(20) not null,
    insert_time datetime not null default current_timestamp,
    update_time datetime not null default current_timestamp on update current_timestamp
    );
