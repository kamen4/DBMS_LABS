use Lab5;

-- 1
SELECT K.NKaf AS Кафедра, S.NaprSpez AS Специальность, St.Fio_stud AS Студент
FROM Fakultet F
JOIN Kafedra K ON F.AFak = K.AbFaK_Kaf
JOIN Spezialn S ON K.ShifrKaf = S.Shifr_Spez
JOIN Student St ON S.NSpez = St.Nom_SpeZ_St
WHERE F.AFak = 'ит';

-- 2
SELECT S.FIO AS Фамилия_Сотр, R.TabNom AS Номер_Рук, R.FIO AS Фамилия_Рук
FROM Sotrudnik S
LEFT JOIN Sotrudnik R ON S.TabNom_ruk = R.TabNom AND S.TabNom_ruk <> S.TabNom;

-- 3
SELECT St.Fio_stud AS Студент
FROM Student St
JOIN Ozenka O ON St.Reg_Nom = O.ReGNom
GROUP BY St.Fio_stud
HAVING COUNT(O.Kod) >= 2;

-- 4
SELECT S.FIO AS Инженер
FROM Sotrudnik S
JOIN Ingener I ON S.TabNom = I.TabNom_IN
WHERE S.Zarplata < 2000;

-- 5
SELECT DISTINCT St.Fio_stud  AS Студент
FROM Student St
JOIN Ozenka O ON St.Reg_Nom = O.ReGNom
WHERE O.Auditoria = 'т505';

-- 6
SELECT St.Reg_Nom AS Учетный_номер,
	St.Fio_stud AS Фамилия,
	COUNT(O.Ozenk_a) AS Количество_экзаменов,
	AVG(O.Ozenk_a) AS Средний_балл
FROM Student St
JOIN Ozenka O ON St.Reg_Nom = O.ReGNom
GROUP BY St.Reg_Nom, St.Fio_stud
HAVING AVG(O.Ozenk_a) >= 4;

-- 7
SELECT S.FIO AS Заведующий, S.Zarplata AS Зарплата, P.Stepen AS Степень
FROM Sotrudnik S
JOIN ZavKaf Z ON S.TabNom = Z.TabNom_K
JOIN Prepodavatel P ON S.TabNom = P.TabNom_Pr;

-- 8
SELECT S.FIO AS Профессор
FROM Sotrudnik S
JOIN Prepodavatel P ON S.TabNom = P.TabNom_Pr
WHERE P.Zvanie = 'профессор'

-- 9
SELECT DISTINCT Pr.Predmet AS Дисциплина,
	S.FIO AS Фамилия,
	S.Dolgn AS Должность,
	P.Stepen AS Степень,
	O.data AS Дата,
	O.Auditoria AS Место_проведения
FROM Predmet Pr
JOIN Ozenka O ON Pr.kod_pred = O.Kod
JOIN Sotrudnik S ON O.Tab_Nom = S.TabNom
JOIN Prepodavatel P ON O.Tab_Nom = P.TabNom_Pr
WHERE O.data >= '2004-02-02' AND O.data <= '2025-02-02'
ORDER BY O.data;

-- 10
SELECT S.FIO AS Преподаватель
FROM Sotrudnik S
JOIN Ozenka O ON S.TabNom = O.Tab_Nom
GROUP BY S.FIO
HAVING COUNT(O.Tab_Nom) > 3;

-- 11
SELECT St.Fio_stud AS Студент
FROM Student St
LEFT JOIN Ozenka O ON St.Reg_Nom = O.ReGNom AND O.data = '2022-06-15'
WHERE O.Ozenk_a IS NULL;