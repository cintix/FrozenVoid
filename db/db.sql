create table project (
	id serial not null primary key,
    name varchar not null, 
    key varchar(5) not null, 
    description text,
    created_at timestamp not null default now(),
    updated_at timestamp not null
); 

create table repository_type (
	id serial not null primary key,
    name varchar not null, 
    cmd varchar not null, 
    args varchar, 
    created_at timestamp not null default now(),
    updated_at timestamp not null  
);

create table repository (
	id serial not null primary key,
    project_id int not null,
    type_id int not null, 
    name varchar not null, 
    remotePath varchar not null, 
    localPath varchar not null, 
    branch varchar, 
    username varchar, 
    password varchar, 
    created_at timestamp not null default now(),
    updated_at timestamp not null
); 


create table builder (
	id serial not null primary key,
    project_id int not null,
    type_id int not null, 
    name varchar not null, 
    filename varchar not null, 
    target varchar not null, 
    created_at timestamp not null default now(),
    updated_at timestamp not null
); 


create table builder_environment (
	id serial not null primary key,
    builder_id int not null,
    name varchar not null, 
    value varchar not null
);


create table deployment (
	id serial not null primary key,
    project_id int not null,
    type_id int not null, 
    name varchar not null, 
    filename varchar not null, 
    target varchar not null, 
    created_at timestamp not null default now(),
    updated_at timestamp not null
); 


create table deployment_hosts (
	id serial not null primary key,
    deployment_id int not null,
	name varchar not null, 
    hostname varchar not null, 
    username varchar not null, 
    pasword varchar not null, 
    path  varchar not null, 
    created_at timestamp not null default now(),
    updated_at timestamp not null
);

create table deployment_type (
	id serial not null primary key,
    name varchar not null, 
    cmd varchar not null, 
    args varchar, 
    created_at timestamp not null default now(),
    updated_at timestamp not null  
);


insert into repository_type (name, cmd, updated_at) values ('GIT', 'git clone $(repository-uri)', now());
insert into repository_type (name, cmd, updated_at) values ('SVN', 'svn checkout  $(repository-uri)', now());
insert into repository_type (name, cmd, updated_at) values ('WEB', 'wget $(repository-uri)', now());

insert into deployment_type (name, cmd, updated_at) values ('FTP', '$(asset-path)', now());
insert into deployment_type (name, cmd, updated_at) values ('SSH', 'scp $(asset-path) $(deployment-user)@$(deployment-host):$(deployment-path)/$(asset-name)', now());


