use Lab5;

-- 1
SELECT K.NKaf AS �������, S.NaprSpez AS �������������, St.Fio_stud AS �������
FROM Fakultet F
JOIN Kafedra K ON F.AFak = K.AbFaK_Kaf
JOIN Spezialn S ON K.ShifrKaf = S.Shifr_Spez
JOIN Student St ON S.NSpez = St.Nom_SpeZ_St
WHERE F.AFak = '��';

-- 2
SELECT S.FIO AS �������_����, R.TabNom AS �����_���, R.FIO AS �������_���
FROM Sotrudnik S
LEFT JOIN Sotrudnik R ON S.TabNom_ruk = R.TabNom AND S.TabNom_ruk <> S.TabNom;

-- 3
SELECT St.Fio_stud AS �������
FROM Student St
JOIN Ozenka O ON St.Reg_Nom = O.ReGNom
GROUP BY St.Fio_stud
HAVING COUNT(O.Kod) >= 2;

-- 4
SELECT S.FIO AS �������
FROM Sotrudnik S
JOIN Ingener I ON S.TabNom = I.TabNom_IN
WHERE S.Zarplata < 2000;

-- 5
SELECT DISTINCT St.Fio_stud  AS �������
FROM Student St
JOIN Ozenka O ON St.Reg_Nom = O.ReGNom
WHERE O.Auditoria = '�505';

-- 6
SELECT St.Reg_Nom AS �������_�����,
	St.Fio_stud AS �������,
	COUNT(O.Ozenk_a) AS ����������_���������,
	AVG(O.Ozenk_a) AS �������_����
FROM Student St
JOIN Ozenka O ON St.Reg_Nom = O.ReGNom
GROUP BY St.Reg_Nom, St.Fio_stud
HAVING AVG(O.Ozenk_a) >= 4;

-- 7
SELECT S.FIO AS ����������, S.Zarplata AS ��������, P.Stepen AS �������
FROM Sotrudnik S
JOIN ZavKaf Z ON S.TabNom = Z.TabNom_K
JOIN Prepodavatel P ON S.TabNom = P.TabNom_Pr;

-- 8
SELECT S.FIO AS ���������
FROM Sotrudnik S
JOIN Prepodavatel P ON S.TabNom = P.TabNom_Pr
WHERE P.Zvanie = '���������'

-- 9
SELECT DISTINCT Pr.Predmet AS ����������,
	S.FIO AS �������,
	S.Dolgn AS ���������,
	P.Stepen AS �������,
	O.data AS ����,
	O.Auditoria AS �����_����������
FROM Predmet Pr
JOIN Ozenka O ON Pr.kod_pred = O.Kod
JOIN Sotrudnik S ON O.Tab_Nom = S.TabNom
JOIN Prepodavatel P ON O.Tab_Nom = P.TabNom_Pr
WHERE O.data >= '2004-02-02' AND O.data <= '2025-02-02'
ORDER BY O.data;

-- 10
SELECT S.FIO AS �������������
FROM Sotrudnik S
JOIN Ozenka O ON S.TabNom = O.Tab_Nom
GROUP BY S.FIO
HAVING COUNT(O.Tab_Nom) > 3;

-- 11
SELECT St.Fio_stud AS �������
FROM Student St
LEFT JOIN Ozenka O ON St.Reg_Nom = O.ReGNom AND O.data = '2022-06-15'
WHERE O.Ozenk_a IS NULL;