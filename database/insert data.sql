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

--WITH AS example

-- WITH i AS(
-- INSERT INTO web_ref (web_ref_id, web_ref_website, web_ref_logo_url)
-- VALUES (1, 'http://steamcommunity.com/', 'http://steamcommunity-a.akamaihd.net/public/shared/images/header/globalheader_logo.png')
-- RETURNING web_ref_id
-- )
-- INSERT INTO distribution_platform (distribution_platform_name, fk_web_ref) 
-- VALUES ('Steam', (SELECT web_ref_id FROM i));




