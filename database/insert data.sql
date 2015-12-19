--------------------------------
--Roles
--------------------------------

INSERT INTO trole (trole_name) VALUES ('admin');
INSERT INTO trole (trole_name) VALUES ('user');

--------------------------------
--Users (admin)
--------------------------------

INSERT INTO tuser (tuser_firstname, tuser_lastname, tuser_nickname, tuser_password, tuser_dob, tuser_email, tuser_phone, fk_trole_id) 
VALUES ('Dimitri', 'Krasucki', 'Dimn0', 'password', '13/03/1986', 'dimitri.krasucki@gmail.com', '+32484572666', 1);

INSERT INTO tuser (tuser_firstname, tuser_lastname, tuser_nickname, tuser_password, tuser_dob, tuser_email, tuser_phone, fk_trole_id) 
VALUES ('Julien', 'Lopez', 'LMBE', 'password', '13/03/1986', 'lopezj@gmail.com', '+32484572666', 1);

INSERT INTO tuser (tuser_firstname, tuser_lastname, tuser_nickname, tuser_password, tuser_dob, tuser_email, tuser_phone, fk_trole_id) 
VALUES ('Lucas', 'Giunta', 'GL', 'password', '13/03/1986', 'giunta@gmail.com', '+32484572666', 1);

--Variante avec requête pour le rôle

-- INSERT INTO tuser (tuser_firstname, tuser_lastname, tuser_nickname, tuser_password, tuser_dob, tuser_email, tuser_phone, fk_trole_id) 
-- VALUES ('Dimitri', 'Krasucki', 'Dimn0', 'password', '13/03/1986', 'dimitri.krasucki@gmail.com', '+32484572666', 
-- (SELECT trole_id FROM trole WHERE trole_name='admin'));
-- 
-- INSERT INTO tuser (tuser_firstname, tuser_lastname, tuser_nickname, tuser_password, tuser_dob, tuser_email, tuser_phone, fk_trole_id) 
-- VALUES ('Julien', 'Lopez', 'LMBE', 'password', '13/03/1986', 'lopezj@gmail.com', '+32484572666', 
-- (SELECT trole_id FROM trole WHERE trole_name='admin'));
-- 
-- INSERT INTO tuser (tuser_firstname, tuser_lastname, tuser_nickname, tuser_password, tuser_dob, tuser_email, tuser_phone, fk_trole_id) 
-- VALUES ('Lucas', 'Giunta', 'GL', 'password', '13/03/1986', 'giunta@gmail.com', '+32484572666', 
-- (SELECT trole_id FROM trole WHERE trole_name='admin'));


--------------------------------
--Distribution platforms
--------------------------------

--Steam
INSERT INTO distribution_platform (distribution_platform_name) 
VALUES ('Steam');

--EAsports
INSERT INTO distribution_platform (distribution_platform_name) 
VALUES ('EAsports');

--BattleNet
INSERT INTO distribution_platform (distribution_platform_name) 
VALUES ('BattleNet');

--None/Other
INSERT INTO distribution_platform (distribution_platform_name) 
VALUES ('None/Other');

--------------------------------
--Games
--------------------------------

--Counter Strike : Global Offensive
INSERT INTO game (game_name)
VALUES ('Counter Strike : Global Offensive');

--Counter Strike : Source
INSERT INTO game (game_name)
VALUES ('Counter Strike : Source');

--LOL
INSERT INTO game (game_name)
VALUES ('League of Legend');

--------------------------------
--Tournament Structure
--------------------------------

INSERT INTO tournament_structure (tournament_structure_name)
VALUES ('bracket');

INSERT INTO tournament_structure (tournament_structure_name)
VALUES ('pool');

--------------------------------
--Type of Rewards
--------------------------------

INSERT INTO type_of_reward (type_of_reward_name)
VALUES ('cash');

INSERT INTO type_of_reward (type_of_reward_name)
VALUES ('equipment');

INSERT INTO type_of_reward (type_of_reward_name)
VALUES ('mixed');

--------------------------------
--Match type
--------------------------------

--Deathmatch
INSERT INTO match_type (match_type_name)
VALUES ('dm');

--Team Deathmatch
INSERT INTO match_type (match_type_name)
VALUES ('tdm');

--Duel
INSERT INTO match_type (match_type_name)
VALUES ('duel');

--X vs Y
INSERT INTO match_type (match_type_name)
VALUES ('xvsy');

--Cooperation
INSERT INTO match_type (match_type_name)
VALUES ('coop');

--------------------------------
--Team
--------------------------------

--GGTeam
WITH i AS(
INSERT INTO web_ref (web_ref_website, web_ref_logo_url)
VALUES ('http://www.teamcs.net/GGteam', 'http://www.teamcs.net/GGteam/logo.png')
RETURNING web_ref_id)

INSERT INTO team (team_name, fk_web_ref_id) 
VALUES ('GGTeam', (SELECT web_ref_id FROM i));

--Atc Clan
WITH i AS(
INSERT INTO web_ref (web_ref_website, web_ref_logo_url)
VALUES ('http://www.teamcs.net/AtcClan', 'http://www.teamcs.net/AtcClan/logo.png')
RETURNING web_ref_id)

INSERT INTO team (team_name, fk_web_ref_id) 
VALUES ('ATC Clan', (SELECT web_ref_id FROM i));

--Kikoo Team
WITH i AS(
INSERT INTO web_ref (web_ref_website, web_ref_logo_url)
VALUES ('http://www.teamlol.net/Kikooteam', 'http://www.teamlol.net/Kikooteam/logo.png')
RETURNING web_ref_id)

INSERT INTO team (team_name, fk_web_ref_id) 
VALUES ('ATC Clan', (SELECT web_ref_id FROM i));

--------------------------------
--Sponsor
--------------------------------

--BNP Paribas Fortis
WITH 
web AS(
INSERT INTO web_ref (web_ref_website, web_ref_logo_url)
VALUES ('http://bnpparibasfortis.be/', 'https://static.bnpparibasfortis.be/Images/Generic/Logo_BNP/FORTIS_BL_rgb.png')
RETURNING web_ref_id),

loc AS(
INSERT INTO location (location_address, location_city, location_zipcode, location_country)
VALUES ('Montagne du Parc 3', 'Bruxelles', '1000', 'Belgique')
RETURNING location_id)

INSERT INTO sponsor (sponsor_name, sponsor_email, fk_location_id, fk_web_ref_id) 
VALUES ('BNP Paribas Fortis','contact@bnpparibasfortis.be', (SELECT location_id FROM loc),(SELECT web_ref_id FROM web));

--Belfius
WITH 
web AS(
INSERT INTO web_ref (web_ref_website, web_ref_logo_url)
VALUES ('http://belfius.be/', 'https://belfius.be/logo.png')
RETURNING web_ref_id),

loc AS(
INSERT INTO location (location_address, location_city, location_zipcode, location_country)
VALUES ('Montagne du Parc 4', 'Bruxelles', '1000', 'Belgique')
RETURNING location_id)

INSERT INTO sponsor (sponsor_name, sponsor_email, fk_location_id, fk_web_ref_id) 
VALUES ('Belfius','contact@belfius.be', (SELECT location_id FROM loc),(SELECT web_ref_id FROM web));

--Keytrade
WITH 
web AS(
INSERT INTO web_ref (web_ref_website, web_ref_logo_url)
VALUES ('http://keytrade.be/', 'https://keytrade.be/logo.png')
RETURNING web_ref_id),

loc AS(
INSERT INTO location (location_address, location_city, location_zipcode, location_country)
VALUES ('Montagne du Parc 5', 'Bruxelles', '1000', 'Belgique')
RETURNING location_id)

INSERT INTO sponsor (sponsor_name, sponsor_email, fk_location_id, fk_web_ref_id) 
VALUES ('Keytrade','contact@keytrade.be', (SELECT location_id FROM loc),(SELECT web_ref_id FROM web));

--------------------------------
--Game account
--------------------------------

INSERT INTO game_account (game_account_login, fk_tuser_id, fk_distribution_platform_id)
VALUES ('dimnotyze', 1, 4);

--Variante avec requêtes pour user & distribution platform
INSERT INTO game_account (game_account_login, fk_tuser_id, fk_distribution_platform_id)
VALUES ('dimnotyze', (SELECT tuser_id FROM tuser WHERE tuser_nickname='Dimn0'), (SELECT distribution_platform_id FROM distribution_platform WHERE distribution_platform_name='Steam'));