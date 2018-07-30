DROP TABLE IF EXISTS type_event;
DROP TABLE IF EXISTS event;
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS auth;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS user_role;
DROP TABLE IF EXISTS user_event;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS var_answers;
DROP TABLE IF EXISTS targets;
DROP TABLE IF EXISTS assassment;
DROP TABLE IF EXISTS subtupics;
DROP TABLE IF EXISTS topics;

CREATE TABLE type_event (
id INT AUTO_INCREMENT PRIMARY KEY,
title TEXT,
description TEXT,
icon TEXT);

CREATE TABLE event (
id INT AUTO_INCREMENT PRIMARY KEY,
title TEXT,
description TEXT,
type_event TEXT,
n TEXT,
e TEXT,
date_time TIMESTAMP [(p) with time zone],
url TEXT,
venue TEXT,
FOREIGN KEY (type_event) REFERENCES type_event(id));

CREATE TABLE teams (
name TEXT PRIMARY KEY,
acronym TEXT,
description TEXT);

CREATE TABLE users (
id INT AUTO_INCREMENT PRIMARY KEY,
firstName TEXT,
secondName TEXT,
lastName TEXT,
auth_id TEXT,
team_id TEXT,
FOREIGN KEY (team_id) REFERENCES teams (id));

CREATE TABLE auth (
login TEXT PRIMARY KEY,
password TEXT,
key INT,
active TEXT,
FOREIGN KEY (login) REFERENCES users (auth_id));

CREATE TABLE roles (
id INT AUTO_INCREMENT PRIMARY KEY,
name TEXT,
description TEXT);

CREATE TABLE user_role(
id_role INT,
id_user INT,
FOREIGN KEY (id_role) REFERENCES roles (id),
FOREIGN KEY (id_user) REFERENCES users (id));

CREATE TABLE user_event (
id_event INT,
id_user INT,
FOREIGN KEY (id_event) REFERENCES event (id),
FOREIGN KEY (id_user) REFERENCES users (id));

CREATE TABLE questions (
id INT AUTO_INCREMENT PRIMARY KEY,
qestion TEXT,
assassments_id TEXT,
answer_id TEXT,
FOREIGN KEY (assassments_id) REFERENCES assassment(id),
FOREIGN KEY (answer_id) REFERENCES var_answers(id));

CREATE TABLE var_answers(
id INT AUTO_INCREMENT PRIMARY KEY,
answer INT,
qestion_id INT);

CREATE TABLE targets (
id INT AUTO_INCREMENT PRIMARY KEY,
title TEXT,
description TEXT,
date TIMESTAMP [(p) with time zone],
time_frame INT,	
user_id INT,
subtupic_id INT,
FOREIGN KEY (user_id) REFERENCES users (id),
FOREIGN KEY (subtupic_id) REFERENCES topics (id));

CREATE TABLE assassment (
id INT AUTO_INCREMENT PRIMARY KEY,
title TEXT,
junior TEXT,
middle TEXT,
senior TEXT,
team_id INT,
subtupic_id INT,
FOREIGN KEY (team_id) REFERENCES teams (id)
FOREIGN KEY (subtupic_id) REFERENCES subtupics (id));

CREATE TABLE subtupics (
id INT,
name TEXT,
description TEXT,
topic_id INT,
FOREIGN KEY (topic_id) REFERENCES topics (id));

CREATE TABLE topics (
id INT,
name TEXT,
description TEXT,
team_id INT,
FOREIGN KEY (team_id) REFERENCES teams (id));









