--------------------------------
--Roles
--------------------------------

INSERT INTO trole (trole_name) VALUES ('admin');
INSERT INTO trole (trole_name) VALUES ('user');

--------------------------------
--Users (admin)
--------------------------------

INSERT INTO tuser (tuser_firstname, tuser_lastname, tuser_nickname, tuser_password, tuser_dob, tuser_email, tuser_phone, fk_role_id) 
VALUES ('Dimitri', 'Krasucki', 'Dimn0', 'password', '13/03/1986', 'dimitri.krasucki@gmail.com', '+32484572666', 1);

INSERT INTO tuser (tuser_firstname, tuser_lastname, tuser_nickname, tuser_password, tuser_dob, tuser_email, tuser_phone, fk_trole_id) 
VALUES ('Julien', 'Lopez', 'LMBE', 'password', '13/03/1986', 'lopezj@gmail.com', '+32484572666', 1);

INSERT INTO tuser (tuser_firstname, tuser_lastname, tuser_nickname, tuser_password, tuser_dob, tuser_email, tuser_phone, fk_trole_id) 
VALUES ('Lucas', 'Giunta', 'GL', 'password', '13/03/1986', 'giunta@gmail.com', '+32484572666', 1);

Variante avec requête pour le rôle

INSERT INTO tuser (tuser_firstname, tuser_lastname, tuser_nickname, tuser_password, tuser_dob, tuser_email, tuser_phone, fk_trole_id) 
VALUES ('Dimitri', 'Krasucki', 'Dimn0', 'password', '13/03/1986', 'dimitri.krasucki@gmail.com', '+32484572666', 
(SELECT trole_id FROM trole WHERE trole_name='admin'));

INSERT INTO tuser (tuser_firstname, tuser_lastname, tuser_nickname, tuser_password, tuser_dob, tuser_email, tuser_phone, fk_trole_id) 
VALUES ('Julien', 'Lopez', 'LMBE', 'password', '13/03/1986', 'lopezj@gmail.com', '+32484572666', 
(SELECT trole_id FROM trole WHERE trole_name='admin'));

INSERT INTO tuser (tuser_firstname, tuser_lastname, tuser_nickname, tuser_password, tuser_dob, tuser_email, tuser_phone, fk_trole_id) 
VALUES ('Lucas', 'Giunta', 'GL', 'password', '13/03/1986', 'giunta@gmail.com', '+32484572666', 
(SELECT trole_id FROM trole WHERE trole_name='admin'));


--------------------------------
--Distribution platforms
--------------------------------

INSERT INTO distribution_platform (distribution_platform_name) 
VALUES ('Steam');

INSERT INTO distribution_platform (distribution_platform_name) 
VALUES ('Blizzard');

INSERT INTO distribution_platform (distribution_platform_name) 
VALUES ('EAsports');
