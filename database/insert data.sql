--------------------------------
--Roles
--------------------------------

-- INSERT INTO trole (trole_name) VALUES ('admin');
-- INSERT INTO trole (trole_name) VALUES ('user');

--------------------------------
--Users (admin)
--------------------------------

-- INSERT INTO tuser (tuser_firstname, tuser_lastname, tuser_nickname, tuser_password, tuser_dob, tuser_email, tuser_phone, fk_trole_id) 
-- VALUES ('Dimitri', 'Krasucki', 'Dimn0', 'password', '13/03/1986', 'dimitri.krasucki@gmail.com', '+32484572666', 1);
-- 
-- INSERT INTO tuser (tuser_firstname, tuser_lastname, tuser_nickname, tuser_password, tuser_dob, tuser_email, tuser_phone, fk_trole_id) 
-- VALUES ('Julien', 'Lopez', 'LMBE', 'password', '13/03/1986', 'lopezj@gmail.com', '+32484572666', 1);

-- INSERT INTO tuser (tuser_firstname, tuser_lastname, tuser_nickname, tuser_password, tuser_dob, tuser_email, tuser_phone, fk_trole_id) 
-- VALUES ('Lucas', 'Giunta', 'GL', 'password', '13/03/1986', 'giunta@gmail.com', '+32484572666', 1);

--Variante avec requête pour le rôle

-- INSERT INTO tuser (tuser_firstname, tuser_lastname, tuser_nickname, tuser_password, tuser_dob, tuser_email, tuser_phone, fk_trole_id) 
-- VALUES ('Dimitri', 'Krasucki', 'Dimn0', 'password', '13/03/1986', 'dimitri.krasucki@gmail.com', '+32484572666', 
-- (SELECT trole_id FROM trole WHERE trole_name='admin'));

-- INSERT INTO tuser (tuser_firstname, tuser_lastname, tuser_nickname, tuser_password, tuser_dob, tuser_email, tuser_phone, fk_trole_id) 
-- VALUES ('Julien', 'Lopez', 'LMBE', 'password', '13/03/1986', 'lopezj@gmail.com', '+32484572666', 
-- (SELECT trole_id FROM trole WHERE trole_name='admin'));

-- INSERT INTO tuser (tuser_firstname, tuser_lastname, tuser_nickname, tuser_password, tuser_dob, tuser_email, tuser_phone, fk_trole_id) 
-- VALUES ('Lucas', 'Giunta', 'GL', 'password', '13/03/1986', 'giunta@gmail.com', '+32484572666', 
-- (SELECT trole_id FROM trole WHERE trole_name='admin'));


--------------------------------
--Distribution platforms
--------------------------------

-- --Steam
WITH i AS(
INSERT INTO web_ref (web_ref_id, web_ref_website, web_ref_logo_url)
VALUES (1, 'http://steamcommunity.com/', 'http://steamcommunity-a.akamaihd.net/public/shared/images/header/globalheader_logo.png')
RETURNING web_ref_id
)
INSERT INTO distribution_platform (distribution_platform_name, fk_web_ref) 
VALUES ('Steam', (SELECT web_ref_id FROM i));



-- --EAsports
-- INSERT INTO web_ref (web_ref_id, web_ref_website, web_ref_logo_url)
-- VALUES (2, 'https://www.easports.com/', 'https://pbs.twimg.com/profile_images/529299045521424384/SlFl8F0b_400x400.jpeg');

-- INSERT INTO distribution_platform (distribution_platform_name, fk_web_ref) 
-- VALUES ('EAsports', 2);

-- --BattleNet
-- INSERT INTO web_ref (web_ref_id, web_ref_website, web_ref_logo_url)
-- VALUES (3, 'http://battle.net', 'https://upload.wikimedia.org/wikipedia/fr/3/34/BattleNet.png');

-- INSERT INTO distribution_platform (distribution_platform_name, fk_web_ref) 
-- VALUES ('BattleNet', 3);

--None/Other
-- INSERT INTO web_ref (web_ref_id, web_ref_website, web_ref_logo_url)
-- VALUES (4, '', '');

-- INSERT INTO distribution_platform (distribution_platform_name, fk_web_ref) 
-- VALUES ('None/Other', 4);

--------------------------------
--Games
--------------------------------

--Counter Strike : Global Offensive
-- INSERT INTO web_ref (web_ref_id, web_ref_website, web_ref_logo_url)
-- VALUES (1, 'http://blog.counter-strike.net/', 'http://orig04.deviantart.net/97bc/f/2012/013/a/7/counter_strike_global_offensive___icon_by_darhymes-d4m7o98.png');

-- INSERT INTO game (game_name, fk_web_ref_id)
-- VALUES ('Counter Strike : Global Offensive', 1);

WITH i AS(
INSERT INTO web_ref (web_ref_website, web_ref_logo_url)
VALUES ('http://blog.counter-strike.net/', 'http://')
RETURNING web_ref_id
)
INSERT INTO game (game_name, fk_web_ref_id)
VALUES ('Counter Strike : Global Offensive', (SELECT web_ref_id FROM i));


-- --Counter Strike : Source
-- INSERT INTO web_ref (web_ref_id, web_ref_website, web_ref_logo_url)
-- VALUES (12, 'http://blog.counter-strike.net/', 'http://orig04.deviantart.net/97bc/f/2012/013/a/7/counter_strike_global_offensive___icon_by_darhymes-d4m7o98.png');

-- INSERT INTO game (game_name, fk_web_ref_id)
-- VALUES ('Counter Strike : Source', 12);
-- 
-- --LOL
-- 
-- INSERT INTO web_ref (web_ref_id, web_ref_website, web_ref_logo_url)
-- VALUES (13, 'http://blog.counter-strike.net/', 'http://orig04.deviantart.net/97bc/f/2012/013/a/7/counter_strike_global_offensive___icon_by_darhymes-d4m7o98.png');

-- INSERT INTO game (game_name, fk_web_ref_id)
-- VALUES ('League of Legend', 13);

