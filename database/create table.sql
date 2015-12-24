CREATE TABLE tournament (

tournament_id serial PRIMARY KEY,
tournament_name	varchar(50) NOT NULL,
tournament_online boolean NOT NULL,
tournament_max_players integer NOT NULL,
tournament_description text NOT NULL,
tournament_creation_date timestamp NOT NULL,
tournament_last_modification_date timestamp NOT NULL,
tournament_start_date timestamp NOT NULL,
tournament_end_date timestamp NOT NULL,
tournament_entrance_fee	decimal NOT NULL,
fk_location_id integer,
fk_game_id integer NOT NULL,
fk_match_type_id integer NOT NULL,
fk_tournament_structure_id integer NOT NULL,
fk_tuser_id integer NOT NULL
);

CREATE TABLE distribution_platform (

distribution_platform_id serial PRIMARY KEY,
distribution_platform_name varchar(50) NOT NULL
);

CREATE TABLE game (

game_id	serial PRIMARY KEY ,
game_name varchar(50) NOT NULL
);

CREATE TABLE game_account (

game_account_id	serial PRIMARY KEY ,
game_account_login varchar(50) NOT NULL,
fk_tuser_id integer NOT NULL,
fk_distribution_platform_id integer NOT NULL
);

CREATE TABLE game_account_game (

fk_game_id integer NOT NULL,
fk_game_account_id integer NOT NULL,
PRIMARY KEY (fk_game_id , fk_game_account_id)

);

CREATE TABLE location (

location_id serial PRIMARY KEY,
location_address varchar(50) NOT NULL,
location_city varchar(50) NOT NULL,
location_zipcode varchar(50) NOT NULL,
location_country varchar(50) NOT NULL
);


CREATE TABLE match_type (

match_type_id serial PRIMARY KEY,
match_type_name	varchar(50) NOT NULL
);

CREATE TABLE reward (

reward_id serial PRIMARY KEY,
reward_name varchar(100) NOT NULL,
fk_tournament_id integer NOT NULL,
fk_type_of_reward_id integer NOT NULL
);

CREATE TABLE trole (

trole_id serial PRIMARY KEY,
trole_name varchar(50) NOT NULL
);

CREATE TABLE sponsor (

sponsor_id serial PRIMARY KEY,
sponsor_name varchar(50) NOT NULL,
sponsor_email varchar(100),
fk_location_id integer,
fk_web_ref_id integer
);

CREATE TABLE team (

team_id	serial PRIMARY KEY,
team_name varchar(50) UNIQUE NOT NULL,
fk_web_ref_id integer NOT NULL
);

CREATE TABLE tournament_sponsor (

fk_tournament_id integer NOT NULL,
fk_sponsor_id integer NOT NULL,
PRIMARY KEY (fk_tournament_id,fk_sponsor_id)
);

CREATE TABLE tournament_structure (

tournament_structure_id	serial PRIMARY KEY,
tournament_structure_name varchar(50) NOT NULL
);

CREATE TABLE type_of_reward (

type_of_reward_id serial PRIMARY KEY,
type_of_reward_name varchar(50) NOT NULL
);

CREATE TABLE tuser (

tuser_id serial PRIMARY KEY,
tuser_firstname varchar(50) NOT NULL,
tuser_lastname varchar(50) NOT NULL,
tuser_nickname varchar(50) UNIQUE NOT NULL,
tuser_password varchar(50) NOT NULL,
tuser_dob date,
tuser_email varchar(50) UNIQUE NOT NULL,
tuser_phone varchar(50),
fk_trole_id integer
);

CREATE TABLE tuser_team (

fk_team_id integer NOT NULL,
fk_tuser_id integer NOT NULL,
PRIMARY KEY (fk_team_id,fk_tuser_id)
);

CREATE TABLE tuser_tournament (

fk_tournament_id integer NOT NULL,
fk_tuser_id integer NOT NULL,
PRIMARY KEY (fk_tournament_id,fk_tuser_id )
);

CREATE TABLE web_ref (

web_ref_id serial PRIMARY KEY,
web_ref_website	text,
web_ref_logo_url text
);

-------------------------------------------
--ALTER TABLE TABLES PRINCIPALES
-------------------------------------------

ALTER TABLE tuser
ADD FOREIGN KEY (fk_trole_id) REFERENCES trole;

ALTER TABLE reward
ADD FOREIGN KEY (fk_Tournament_id)REFERENCES tournament;

ALTER TABLE reward
ADD FOREIGN KEY (fk_type_of_reward_id)REFERENCES type_of_reward;

ALTER TABLE game_account
ADD FOREIGN KEY (fk_distribution_platform_id)REFERENCES distribution_platform;

ALTER TABLE game_account
ADD FOREIGN KEY (fk_tuser_id)REFERENCES tuser;

ALTER TABLE tournament
ADD FOREIGN KEY (fk_tuser_id)REFERENCES tuser;

ALTER TABLE tournament
ADD FOREIGN KEY (fk_game_id)REFERENCES game;

ALTER TABLE tournament
ADD FOREIGN KEY (fk_match_type_id)REFERENCES match_type;

ALTER TABLE tournament
ADD FOREIGN KEY (fk_tournament_structure_id) REFERENCES tournament_structure;

ALTER TABLE tournament
ADD FOREIGN KEY (fk_location_id) REFERENCES location;

ALTER TABLE team
ADD FOREIGN KEY (fk_web_ref_id) REFERENCES web_ref;

ALTER TABLE sponsor
ADD FOREIGN KEY (fk_location_id) REFERENCES location;

ALTER TABLE sponsor
ADD FOREIGN KEY (fk_web_ref_id) REFERENCES web_ref;

-------------------------------------------
--ALTER TABLE TABLE INTERMEDIAIRE
-------------------------------------------

ALTER TABLE tuser_team
ADD FOREIGN KEY (fk_team_id) REFERENCES team;

ALTER TABLE tuser_team
ADD FOREIGN KEY (fk_tuser_id)REFERENCES tuser;

ALTER TABLE tuser_tournament
ADD FOREIGN KEY (fk_tuser_id)REFERENCES tuser;

ALTER TABLE tuser_tournament
ADD FOREIGN KEY (fk_tournament_id) REFERENCES tournament;

ALTER TABLE tournament_sponsor
ADD FOREIGN KEY (fk_tournament_id) REFERENCES tournament;

ALTER TABLE tournament_sponsor
ADD FOREIGN KEY (fk_sponsor_id) REFERENCES sponsor;

ALTER TABLE game_account_game
ADD FOREIGN KEY (fk_game_id) REFERENCES game;

ALTER TABLE game_account_game
ADD FOREIGN KEY (fk_game_account_id) REFERENCES game_account;
