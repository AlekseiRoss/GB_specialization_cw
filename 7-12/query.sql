-- 7
-- Создание базы данных "FriendsOfHumans"
CREATE DATABASE IF NOT EXISTS FriendsOfHumans;

-- Использование базы данных
USE FriendsOfHumans;

-- 8
-- Создание таблицы "Dogs"
CREATE TABLE IF NOT EXISTS Dogs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    command VARCHAR(255),
    birth_date DATE
);

-- Создание таблицы "Cats"
CREATE TABLE IF NOT EXISTS Cats (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    command VARCHAR(255),
    birth_date DATE
);

-- Создание таблицы "Hamsters"
CREATE TABLE IF NOT EXISTS Hamsters (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    command VARCHAR(255),
    birth_date DATE
);

-- Создание таблицы "Horses"
CREATE TABLE IF NOT EXISTS Horses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    command VARCHAR(255),
    birth_date DATE
);

-- Создание таблицы "Camels"
CREATE TABLE IF NOT EXISTS Camels (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    command VARCHAR(255),
    birth_date DATE
);

-- Создание таблицы "Donkeys"
CREATE TABLE IF NOT EXISTS Donkeys (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    command VARCHAR(255),
    birth_date DATE
);

-- 9
-- Заполнение таблицы "Dogs"
INSERT INTO Dogs (name, command, birth_date) VALUES
('Buddy', 'Sit', '2020-01-01'),
('Max', 'Fetch', '2019-05-15'),
('Luna', 'Stay', '2022-02-10');

-- Заполнение таблицы "Cats"
INSERT INTO Cats (name, command, birth_date) VALUES
('Whiskers', 'Meow', '2018-03-20'),
('Mittens', 'Purr', '2017-11-12'),
('Shadow', 'Nap', '2019-08-05');

-- Заполнение таблицы "Hamsters"
INSERT INTO Hamsters (name, command, birth_date) VALUES
('Nibbles', 'Run on wheel', '2021-06-08'),
('Cheeks', 'Burrow', '2020-09-14'),
('Pumpkin', 'Explore', '2022-04-30');

-- Заполнение таблицы "Horses"
INSERT INTO Horses (name, command, birth_date) VALUES
('Spirit', 'Gallop', '2017-02-15'),
('Thunder', 'Jump', '2016-09-22'),
('Starlight', 'Dressage', '2018-11-10');

-- Заполнение таблицы "Camels"
INSERT INTO Camels (name, command, birth_date) VALUES
('Sahara', 'Carry load', '2015-07-12'),
('Gobi', 'Transport', '2016-04-28'),
('Arabian', 'Trek', '2017-09-05');

-- Заполнение таблицы "Donkeys"
INSERT INTO Donkeys (name, command, birth_date) VALUES
('Eeyore', 'Carry load', '2019-12-03'),
('Daisy', 'Graze', '2020-08-17'),
('Buck', 'Bray', '2021-02-22');

-- 10
-- Отключение безопасного режима
SET SQL_SAFE_UPDATES = 0;
-- Ваш запрос DELETE без WHERE
DELETE FROM Camels WHERE 1;
-- Включение безопасного режима
SET SQL_SAFE_UPDATES = 1;

-- Объединение таблиц лошадей и ослов
-- надо создавать новую таблицу?
-- (CREATE TABLE IF NOT EXISTS HorsesAndDonkeys AS)
SELECT * FROM Horses
UNION
SELECT * FROM Donkeys;

-- 11
-- Создание таблицы "YoungAnimals"
CREATE TABLE IF NOT EXISTS YoungAnimals (
    id INT PRIMARY KEY AUTO_INCREMENT,
    animal_type VARCHAR(255),
    name VARCHAR(255) NOT NULL,
    command VARCHAR(255),
    birth_date DATE,
    age_in_months DECIMAL(5, 2)
);

-- Заполнение таблицы "YoungAnimals" (животные старше 1 года, но младше 3 лет)
INSERT INTO YoungAnimals (animal_type, name, command, birth_date, age_in_months)
SELECT 'Dog', name, command, birth_date, 
    TIMESTAMPDIFF(MONTH, birth_date, CURDATE()) AS age_in_months
FROM Dogs
WHERE TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) > 1
   AND TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) < 3;

INSERT INTO YoungAnimals (animal_type, name, command, birth_date, age_in_months)
SELECT 'Cat', name, command, birth_date, 
    TIMESTAMPDIFF(MONTH, birth_date, CURDATE()) AS age_in_months
FROM Cats
WHERE TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) > 1
   AND TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) < 3;

INSERT INTO YoungAnimals (animal_type, name, command, birth_date, age_in_months)
SELECT 'Hamster', name, command, birth_date, 
    TIMESTAMPDIFF(MONTH, birth_date, CURDATE()) AS age_in_months
FROM Hamsters
WHERE TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) > 1
   AND TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) < 3;

INSERT INTO YoungAnimals (animal_type, name, command, birth_date, age_in_months)
SELECT 'Horse', name, command, birth_date, 
    TIMESTAMPDIFF(MONTH, birth_date, CURDATE()) AS age_in_months
FROM Horses
WHERE TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) > 1
   AND TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) < 3;

INSERT INTO YoungAnimals (animal_type, name, command, birth_date, age_in_months)
SELECT 'Donkey', name, command, birth_date, 
    TIMESTAMPDIFF(MONTH, birth_date, CURDATE()) AS age_in_months
FROM Donkeys
WHERE TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) > 1
   AND TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) < 3;
   

-- 12 !!! (По правде говоря я не понимаю почему в этом задании вы сказали использовать ALTER TABLE)
-- Добавление столбцов "animal_type" и "animal_group" в таблицу "Dogs"
ALTER TABLE Dogs
ADD COLUMN animal_type VARCHAR(255) DEFAULT 'Dog',
ADD COLUMN animal_group VARCHAR(255) DEFAULT 'Domestic';

-- Обновление данных в таблице "Dogs"
UPDATE Dogs SET animal_type = 'Dog', animal_group = 'Domestic';

-- Добавление столбцов "animal_type" и "animal_group" в таблицу "Cats"
ALTER TABLE Cats
ADD COLUMN animal_type VARCHAR(255) DEFAULT 'Cat',
ADD COLUMN animal_group VARCHAR(255) DEFAULT 'Domestic';

-- Обновление данных в таблице "Cats"
UPDATE Cats SET animal_type = 'Cat', animal_group = 'Domestic';

-- Добавление столбцов "animal_type" и "animal_group" в таблицу "Hamsters"
ALTER TABLE Hamsters
ADD COLUMN animal_type VARCHAR(255) DEFAULT 'Hamster',
ADD COLUMN animal_group VARCHAR(255) DEFAULT 'Domestic';

-- Обновление данных в таблице "Hamsters"
UPDATE Hamsters SET animal_type = 'Hamster', animal_group = 'Domestic';

-- Добавление столбцов "animal_type" и "animal_group" в таблицу "Horses"
ALTER TABLE Horses
ADD COLUMN animal_type VARCHAR(255) DEFAULT 'Horse',
ADD COLUMN animal_group VARCHAR(255) DEFAULT 'Herding';

-- Обновление данных в таблице "Horses"
UPDATE Horses SET animal_type = 'Horse', animal_group = 'Herding';

-- Добавление столбцов "animal_type" и "animal_group" в таблицу "Donkeys"
ALTER TABLE Donkeys
ADD COLUMN animal_type VARCHAR(255) DEFAULT 'Donkey',
ADD COLUMN animal_group VARCHAR(255) DEFAULT 'Herding';

-- Обновление данных в таблице "Donkeys"
UPDATE Donkeys SET animal_type = 'Donkey', animal_group = 'Herding';

-- Создание новой таблицы "AllAnimals"
CREATE TABLE IF NOT EXISTS AllAnimals (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    command VARCHAR(255),
    birth_date DATE,
    animal_type VARCHAR(255),
    animal_group VARCHAR(255)
);

-- Вставка данных из всех таблиц в "AllAnimals"
INSERT INTO AllAnimals (name, command, birth_date, animal_type, animal_group)
SELECT name, command, birth_date, animal_type, animal_group FROM Dogs
UNION ALL
SELECT name, command, birth_date, animal_type, animal_group FROM Cats
UNION ALL
SELECT name, command, birth_date, animal_type, animal_group FROM Hamsters
UNION ALL
SELECT name, command, birth_date, animal_type, animal_group FROM Horses
UNION ALL
SELECT name, command, birth_date, animal_type, animal_group FROM Donkeys;