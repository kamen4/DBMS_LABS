use Lab7;

--1
declare @a as int, @b as int, @c as int
set @a = 10
set @b = 12
set @c = @a * @b
print @c

--2
declare @lic as float, @gymn as float, @diff as float
set @lic = (select AVG(ball) from Table_uch1 where ush='Лицей')
set @gymn = (select AVG(ball) from Table_uch1 where ush='Гимназия')
set @diff = ABS(@lic - @gymn);
print @diff

--3
declare @rows as int
set @rows = (select COUNT(id) from Table_uch1)
if @rows % 2 = 0
begin
	print 'Чётное'
end
else
begin
	print 'Не чётное'
end

--4
declare @num as int, @sum as int
set @num = 2334
set @sum = 0
while @num > 0
begin
	set @sum = @sum + @num % 10
	set @num = @num / 10
end
print @sum

--5
declare @n1 as int, @n2 as int, @n3 as int, @nmin as int
set  @n1 = RAND() * 1000
set  @n2 = RAND() * 1000
set  @n3 = RAND() * 1000
if @n1 <= @n2 and @n1 <= @n3
begin
	set @nmin = @n1
end
if @n2 <= @n3 and @n2 <= @n1
begin
	set @nmin = @n2
end
if @n3 <= @n2 and @n3 <= @n1
begin
	set @nmin = @n3
end
print 'Минимальное из ' + CAST(@n1 as varchar(5)) + ' '
						+ CAST(@n2 as varchar(5)) + ' '
						+ CAST(@n3 as varchar(5)) + ': '
						+ CAST(@nmin as varchar(5))

--6
declare @ch as int
set  @ch = RAND() * 1000
if @ch % 11 = 0
begin
	print CAST(@ch as varchar(5)) + ' делится на 11'
end
else
begin
	print CAST(@ch as varchar(5)) + ' не делится на 11'
end

--7
declare @ch1 as int
set  @ch1 = RAND() * 1000
while @ch1 % 3 = 0 and @ch1 > 1
begin
	set @ch1 = @ch1 / 3
end
if @ch1 = 1
begin
	print CAST(@ch1 as varchar(5)) + ' степень 3'
end
else
begin
	print CAST(@ch1 as varchar(5)) + ' не степень 3'
end

--8
declare @a1 as int, @b1 as int, @buf as int, @a1buf as int, @b1buf as int
set  @a1 = RAND() * 100
set  @b1 = RAND() * 100
set  @b1buf = @b1
set  @a1buf = @a1
if @a1 < @b1
begin
	set @buf = @a1
	set @a1 = @b1
	set @b1 = @buf
end
while @b1>0
begin
	set @a1 = @a1 % @b1
	set @buf = @a1
	set @a1 = @b1
	set @b1 = @buf
end
print 'НОК(' + CAST(@a1buf as varchar(5)) + ', ' +
		CAST(@b1buf as varchar(5)) + ') = ' +
		CAST(@a1buf*@b1buf/@a1 as varchar(5))

--9
declare @a2 int = 10, @b2 int = 20, @sumsq int = 0
while @a2 <= @b2
begin
	set @sumsq = @sumsq + @a2 * @a2
	set @a2 = @a2 + 1
end
print @sumsq

--10
declare @ost1 int = 2 * 3 * 4 * 5 * 6, @i int = 1
while @i % @ost1 != 1 or @i % 7 != 0
begin
	set @i = @i + 1
end
print @i

--11
declare @fam varchar(20) = 'Горбач'
declare @cnt int = LEN(@fam)
while @cnt > 0
begin
	print @fam
	set @cnt = @cnt - 1
end