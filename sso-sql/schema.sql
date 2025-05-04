create database sso;
go

use sso;
go

create table users (
    id int identity(1, 1),
    username nvarchar(200) not null,
    displayname nvarchar(200) not null,
    [password] nvarchar(64) not null,
    [role] nvarchar(200) not null,
    constraint pk_users primary key (id),
    constraint uk_users_username  unique (username),
    constraint chk_role check ([role] in ('admin', 'user'))
);
go

create table token_metadata (
    id int identity(1, 1),
    user_id int,
    token char(64) not null,
    valid_till datetime not null,
    created_at datetime not null,
    constraint fk_token_metadata_users foreign key (user_id) references users(id) on delete cascade,
    constraint pk_token_metadata primary key (id),
    constraint uk_token_metadata_token_id unique (token)
);
go

insert into users(username, displayname, [password], [role])
values ('shubham@email.com', 'Shubham Kumar', '89e01536ac207279409d4de1e5253e01f4a1769e696db0d6062ca9b8f56767c8', 'user'), --mypassword
('test@email.com', 'test', '85d8fa8fa6bdd3db050005b44ec3c5302b389ced054ec7d59eac2edba2251946', 'admin') --thepassword

select * from users;

select * from token_metadata;