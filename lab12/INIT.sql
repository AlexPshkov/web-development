
# Создаем базу данных University
CREATE DATABASE IF NOT EXISTS `University`;

# Создаем таблицу факультетов
CREATE TABLE IF NOT EXISTS University.Faculties
(
    `ABBREVIATION` VARCHAR(50) NOT NULL,
    `NAME`         VARCHAR(50) NOT NULL,
    PRIMARY KEY (`ABBREVIATION`)
) DEFAULT CHAR SET utf8mb4;

# Создаем таблицу групп
CREATE TABLE IF NOT EXISTS University.Groups
(
    `NAME`    VARCHAR(255) NOT NULL,
    `FACULTY` VARCHAR(255),
    PRIMARY KEY (`NAME`),

    INDEX (`FACULTY`),
    FOREIGN KEY (`FACULTY`)
        REFERENCES University.Faculties (`ABBREVIATION`)
        ON UPDATE CASCADE ON DELETE RESTRICT
) DEFAULT CHAR SET utf8mb4;

# Создаем таблицу студентов
CREATE TABLE IF NOT EXISTS University.Students
(
    `ID`      INT AUTO_INCREMENT NOT NULL,
    `SURNAME` VARCHAR(255),
    `NAME`    VARCHAR(255),
    `AGE`     INT,
    `GROUP`   VARCHAR(255),
    PRIMARY KEY (`ID`),

    INDEX (`GROUP`),
    FOREIGN KEY (`GROUP`)
        REFERENCES University.Groups (`NAME`)
        ON UPDATE CASCADE ON DELETE RESTRICT
) DEFAULT CHAR SET utf8mb4;

# Добавление факультетов
INSERT INTO University.Faculties
VALUES ('ФИиВТ', 'Факультет информатики и вычислительной техники'),
       ('ФСТ', 'Факультет социальных технологий'),
       ('ФУиП', 'Факультет управления и права');


# Добавление групп
INSERT INTO University.Groups
VALUES ('ПС-11', 'ФИиВТ'),
       ('ПС-12', 'ФИиВТ'),
       ('ПС-13', 'ФИиВТ');

INSERT INTO University.Groups
VALUES ('СР-11', 'ФСТ'),
       ('СР-12', 'ФСТ'),
       ('СР-13', 'ФСТ');

INSERT INTO University.Groups
VALUES ('ХЗ-11', 'ФУиП'),
       ('ХЗ-12', 'ФУиП'),
       ('ХЗ-13', 'ФУиП');

# Добавление студентов
INSERT INTO University.Students
VALUES (0, 'Лебедев', 'Матвей', 18, 'ПС-11'),
       (0, 'Корнилова', 'Елизавета', 19, 'ПС-11'),
       (0, 'Борисова', 'Анастасия', 22, 'ПС-11'),
       (0, 'Павловская', 'Алина', 19, 'ПС-11'),
       (0, 'Антонов', 'Лев', 18, 'ПС-11');

INSERT INTO University.Students
VALUES (0, 'Чернышев', 'Илья', 17, 'ПС-12'),
       (0, 'Горелов', 'Леонид', 19, 'ПС-12'),
       (0, 'Федоров', 'Егор', 19, 'ПС-12'),
       (0, 'Никитина', 'София', 19, 'ПС-12'),
       (0, 'Дубинин', 'Владимир', 19, 'ПС-12');

INSERT INTO University.Students
VALUES (0, 'Чернов', 'Андрей', 19, 'ПС-13'),
       (0, 'Майоров', 'Павел', 19, 'ПС-13'),
       (0, 'Лебедев', 'Тимофей', 21, 'ПС-13'),
       (0, 'Лебедева', 'Виктория', 18, 'ПС-13'),
       (0, 'Киселев', 'Даниил', 19, 'ПС-13');

INSERT INTO University.Students
VALUES (0, 'Авдеев', 'Виктор', 17, 'СР-11'),
       (0, 'Ершов', 'Максим', 19, 'СР-11'),
       (0, 'Никонов', 'Даниил', 19, 'СР-11'),
       (0, 'Зверева', 'Ева', 19, 'СР-11'),
       (0, 'Куликов', 'Михаил', 18, 'СР-11');

INSERT INTO University.Students
VALUES (0, 'Смирнов', 'Егор', 19, 'СР-12'),
       (0, 'Макарова', 'София', 19, 'СР-12'),
       (0, 'Софронова', 'Кристина', 19, 'СР-12'),
       (0, 'Пирогов', 'Максим', 19, 'СР-12'),
       (0, 'Иванова', 'Маргарита', 19, 'СР-12');

INSERT INTO University.Students
VALUES (0, 'Давыдова', 'Анна', 19, 'СР-13'),
       (0, 'Николаев', 'Роман', 17, 'СР-13'),
       (0, 'Бондарев', 'Матвей', 19, 'СР-13'),
       (0, 'Евдокимова', 'Арина', 18, 'СР-13'),
       (0, 'Гусева', 'Таисия', 17, 'СР-13');

INSERT INTO University.Students
VALUES (0, 'Калугина', 'Елизавета', 18, 'ХЗ-11'),
       (0, 'Ермакова', 'Валентина', 18, 'ХЗ-11'),
       (0, 'Соловьев', 'Иван', 18, 'ХЗ-11'),
       (0, 'Попов', 'Виктор', 18, 'ХЗ-11'),
       (0, 'Мельников', 'Владимир', 19, 'ХЗ-11');

INSERT INTO University.Students
VALUES (0, 'Беляева', 'Амина', 19, 'ХЗ-12'),
       (0, 'Субботина', 'Елизавета', 20, 'ХЗ-12'),
       (0, 'Андреев', 'Тимур', 19, 'ХЗ-12'),
       (0, 'Парамонова', 'Ева', 23, 'ХЗ-12'),
       (0, 'Мещеряков', 'Савва', 22, 'ХЗ-12');

INSERT INTO University.Students
VALUES (0, 'Егорова', 'Дарья', 19, 'ХЗ-13'),
       (0, 'Пирогов', 'Александр', 19, 'ХЗ-13'),
       (0, 'Герасимов', 'Александр', 17, 'ХЗ-13'),
       (0, 'Москвин', 'Филипп', 19, 'ХЗ-13'),
       (0, 'Гусева', 'Анна', 19, 'ХЗ-13');