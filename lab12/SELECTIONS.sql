# Выбор всех студентов, у кого возраст 19
SELECT *
FROM University.Students
WHERE `AGE` = 19;

# Выбор всех студентов из группы ПС-12
SELECT *
FROM University.Students
WHERE `GROUP` = 'ПС-12';

# Выбор всех студентов из факультета ФИиВТ
SELECT *
FROM University.Students
         JOIN  University.Groups ON University.Students.`GROUP` = University.Groups.`NAME`
WHERE `FACULTY` = 'ФИиВТ';

# Выбор факультета и группы определенного студента. (По его ID)
SELECT `FACULTY`, `GROUP`
FROM University.Students
         JOIN University.Groups ON University.Students.`GROUP` = University.Groups.`NAME`
WHERE `ID` = 5;
