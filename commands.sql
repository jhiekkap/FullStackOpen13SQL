CREATE TABLE notes (
    id SERIAL PRIMARY KEY,
    content text NOT NULL,
    important boolean,
    date time
);

insert into notes (content, important) values ('Relational databases rule the world', true);
insert into notes (content, important) values ('MongoDB is webscale', false);

insert into users (username, name ) values('mluukkai', 'Matti Luukkainen');
insert into users (username, name ) values('vbezhenar', 'Vlad Bezhenar');
insert into users (username, name ) values('toska', 'Toska');

insert into notes (content, important, user_id, date ) values ('Relational databases rule the world', true, 1, '2019-05-30T17:30:31.098Z');
insert into notes (content, important, user_id, date) values ('MongoDB is webscale', false, 2,  '2019-05-30T18:39:34.091Z');
insert into notes (content, important, user_id, date) values ('PostgreSQL is the most advanced relational database', true, 3,'2019-05-30T19:20:14.298Z');

insert into teams (name) values ('toska');
insert into teams (name) values ('mosa climbers');
insert into memberships (user_id, team_id) values (1, 1);
insert into memberships (user_id, team_id) values (1, 2);
insert into memberships (user_id, team_id) values (2, 1);
insert into memberships (user_id, team_id) values (3, 2);

insert into user_notes (user_id, note_id) values (2, 1);
insert into user_notes (user_id, note_id) values (2, 2);