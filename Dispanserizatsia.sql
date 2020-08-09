Create DataBase Dispanserizatsia
go
Use Dispanserizatsia
go

Create Type AllNames from Varchar(40)
go
 
Create table DocDiagnoz
(
	Cod_Diagnoz SmallInt NOT NULL PRIMARY KEY check(Cod_Diagnoz > 1000 and Cod_Diagnoz < 2000),
	Diagnoz Varchar(100) Default('without') -- yes
)
go
Create table Pacient
(
	Cod_Pacient Int NOT NULL PRIMARY KEY check(Cod_Pacient > 1000) ,
	FIO_Pacient AllNames Default('without'),
	Adress Varchar(65) Default('without'),
	age tinyint check(age < 110),
	gender bit, -- 0 - Ìóæ÷èíà, 1 - Æåíùèíà
	IDNP Char(13),
	Strahovka Char(15),
	Nr_Uchastka SmallInt check(Nr_Uchastka > 3000 and Nr_Uchastka < 4000)
)
go

Create table Doctor
(
	Cod_Doctor Int NOT NULL PRIMARY KEY check(Cod_Doctor > 1000),
	FIO_Doctor AllNames Default('without'),
	Nr_Uchastka_DOC SmallInt check(Nr_Uchastka_DOC > 0),
	Nr_Cabinet SmallInt check(Nr_Cabinet > 0)
)
go

Create table Lekarstvo
(
	Cod_Lekarstva SmallInt NOT NULL PRIMARY KEY check(Cod_Lekarstva > 4000 and Cod_Lekarstva < 5000),
	Name_Lekarstva Varchar(100) Default('without'),
	Dozirovka SmallInt default 0 check(Dozirovka > 0 and Dozirovka < 100),
	Type_Upakovka Varchar(30) Default('without'),
	Gruppa Varchar(30) Default('without')
)
go

Create table Priem
(
	Cod_Priema Int NOT NULL PRIMARY KEY check(Cod_Priema > 0),
	Cod_Doctor Int FOREIGN KEY REFERENCES Doctor(Cod_Doctor),
	Cod_Pacient Int FOREIGN KEY REFERENCES Pacient(Cod_Pacient),
	Cod_Diagnoz SmallInt FOREIGN KEY REFERENCES DocDiagnoz(Cod_Diagnoz),
	Data_Priema Date,
	Time_Priema Time,
)
go

Alter Table Priem Add Constraint DF_PriemDate default GETDATE() for Data_Priema
go
Alter Table Priem Add Constraint DF_PriemTime default SYSDATETIME() for Time_Priema
go

Create table Retsept
(
	Nr_Retsepta SmallInt NOT NULL PRIMARY KEY check(Nr_Retsepta > 0),
	Cod_Priema Int FOREIGN KEY REFERENCES Priem(Cod_Priema)
)
go

Create table Lechenie
(
	Cod_Lekarstva SmallInt FOREIGN KEY REFERENCES Lekarstvo(Cod_Lekarstva),
	Nr_Retsepta SmallInt FOREIGN KEY REFERENCES Retsept(Nr_Retsepta)
)
go

Select * From DocDiagnoz
go
Select * From Pacient
go
Select * From Doctor
go
Select * From Lekarstvo
go
Select * From Priem
go
Select * From Retsept
go
Select * From Lechenie
go
--========================================Pacient===================================================--
Insert into dbo.Pacient(Cod_Pacient, FIO_Pacient, Adress, age, gender, IDNP, Strahovka, Nr_Uchastka)
	values (1001, 'Ambrosii Max', 'Obsiaga', 18, 0, '1234567891123', '123456789112345', 3001)
go
Insert into dbo.Pacient(Cod_Pacient, FIO_Pacient, Adress, age, gender, IDNP, Strahovka, Nr_Uchastka)
	values (1002, 'Baltag Silf', 'Obsiaga2', 25, 0, '1234567891124', '123456789112347', 3001)
go
Insert into dbo.Pacient(Cod_Pacient, FIO_Pacient, Adress, age, gender, IDNP, Strahovka, Nr_Uchastka)
	values (1003, 'Ursan Sania', 'Obsiaga3', 35, 0, '1234567891125', '123456789112348', 3001)
go
Insert into dbo.Pacient(Cod_Pacient, FIO_Pacient, Adress, age, gender, IDNP, Strahovka, Nr_Uchastka)
	values (1004, 'Tania Tania', 'Obsiaga3', 50, 1, '1234567891134', '123456789152348', 3002)
go
Insert into dbo.Pacient(Cod_Pacient, FIO_Pacient, Adress, age, gender, IDNP, Strahovka, Nr_Uchastka)
	values (1005, 'Djaga Sania', 'Obsiaga3', 19, 1, '1234567891156', '123456789162348', 3002)
go
--=========================================Doctor==================================================--
Insert into Doctor(Cod_Doctor, FIO_Doctor, Nr_Uchastka_DOC, Nr_Cabinet)
	values (3001, 'Kolenko Cheslav Anikitevich', 2001, 12)
go
Insert into Doctor(Cod_Doctor, FIO_Doctor, Nr_Uchastka_DOC, Nr_Cabinet)
	values (3002, 'Sharonova Rozalija Feliksovna', 2002, 72)
go
Insert into Doctor(Cod_Doctor, FIO_Doctor, Nr_Uchastka_DOC, Nr_Cabinet)
	values (3003, 'Fotina Ekaterina Nikitevna', 2003, 17)
go
Insert into Doctor(Cod_Doctor, FIO_Doctor, Nr_Uchastka_DOC, Nr_Cabinet)
	values (3004, 'Kukleva Margarita Timofeevna', 2004, 102)
go
Insert into Doctor(Cod_Doctor, FIO_Doctor, Nr_Uchastka_DOC, Nr_Cabinet)
	values (3005, 'Dudnik Artem Bogdanovich', 2005, 5)
go
--=========================================Lekarstvo================================================--
Insert into Lekarstvo(Cod_Lekarstva, Name_Lekarstva, Dozirovka, Type_Upakovka, Gruppa)
	values (4001, 'Bufenoks', 95, 'Bumazhnaja', 'Diuretiki')
go
Insert into Lekarstvo(Cod_Lekarstva, Name_Lekarstva, Dozirovka, Type_Upakovka, Gruppa)
	values (4002, 'Amoksitsillin', 90, 'Bumazhnaja', 'Antibakterialnye')
go
Insert into Lekarstvo(Cod_Lekarstva, Name_Lekarstva, Dozirovka, Type_Upakovka, Gruppa)
	values (4003, 'Antidepressanty', 90, 'Bumazhnaja', 'Psihotropnye')
go
Insert into Lekarstvo(Cod_Lekarstva, Name_Lekarstva, Dozirovka, Type_Upakovka, Gruppa)
	values (4004, 'Tsizaprid', 85, 'Bumazhnaja', 'Prokinetiki')
go
Insert into Lekarstvo(Cod_Lekarstva, Name_Lekarstva, Dozirovka, Type_Upakovka, Gruppa)
	values (4005, 'Fazin', 95, 'Bumazhnaja', 'Immunodepressanty')
go
Insert into Lekarstvo(Cod_Lekarstva, Name_Lekarstva, Dozirovka, Type_Upakovka, Gruppa)
	values (4006, 'Factiv', 50, 'Bumazhnaja', 'Immunodepressanty')
go
Insert into Lekarstvo(Cod_Lekarstva, Name_Lekarstva, Dozirovka, Type_Upakovka, Gruppa)
	values (4007, 'Fungamis', 60, 'Bumazhnaja', 'Psihotropnye')
go
Insert into Lekarstvo(Cod_Lekarstva, Name_Lekarstva, Dozirovka, Type_Upakovka, Gruppa)
	values (4008, 'Famotel', 95, 'Bumazhnaja', 'Immunodepressanty')
go
--===========================================DocDiahnoz=============================================--
Insert into DocDiagnoz(Cod_Diagnoz, Diagnoz) VALUES (1001, 'Nasmork')
go
Insert into DocDiagnoz(Cod_Diagnoz, Diagnoz) VALUES (1002, 'Insult')
go
Insert into DocDiagnoz(Cod_Diagnoz, Diagnoz) VALUES (1003, 'Gripp')
go
Insert into DocDiagnoz(Cod_Diagnoz, Diagnoz) VALUES (1004, 'Gonorea')
go
Insert into DocDiagnoz(Cod_Diagnoz, Diagnoz) VALUES (1005, 'Gerpes')
go
Insert into DocDiagnoz(Cod_Diagnoz, Diagnoz) VALUES (1006, 'Kosoglazie')
go
Insert into DocDiagnoz(Cod_Diagnoz, Diagnoz) VALUES (1007, 'Bronhit')
go
Insert into DocDiagnoz(Cod_Diagnoz, Diagnoz) VALUES (1008, 'Karies')
go
Insert into DocDiagnoz(Cod_Diagnoz, Diagnoz) VALUES (1009, 'RakPochek')
go
Insert into DocDiagnoz(Cod_Diagnoz, Diagnoz) VALUES (1010, 'Holera')
go
--===========================================Priem===================================================-- false
Insert into Priem(Cod_Priema, Cod_Doctor, Cod_Pacient, Cod_Diagnoz, Data_Priema)
	values (1, 3001, 1001, 1002, '2018-01-12')
go
Insert into Priem(Cod_Priema, Cod_Doctor, Cod_Pacient, Cod_Diagnoz, Data_Priema)
	values (2, 3002, 1002, 1005, '2018-01-22')
go
Insert into Priem(Cod_Priema, Cod_Doctor, Cod_Pacient, Cod_Diagnoz, Data_Priema)
	values (3, 3001, 1003, 1001, '2018-01-18')
go
Insert into Priem(Cod_Priema, Cod_Doctor, Cod_Pacient, Cod_Diagnoz, Data_Priema)
	values (4, 3004, 1004, 1006, '2018-02-2')
go
Insert into Priem(Cod_Priema, Cod_Doctor, Cod_Pacient, Cod_Diagnoz, Data_Priema)
	values (5, 3005, 1005, 1009, '2018-02-8')
go
Insert into Priem(Cod_Priema, Cod_Doctor, Cod_Pacient, Cod_Diagnoz)
	values (6, 3005, 1002, 1004)
go
Insert into Priem(Cod_Priema, Cod_Doctor, Cod_Pacient, Cod_Diagnoz)
	values (7, 3005, 1002, 1003)
go
Insert into Priem(Cod_Priema, Cod_Doctor, Cod_Pacient, Cod_Diagnoz)
	values (8, 3005, 1002, 1001)
go
Insert into Priem(Cod_Priema, Cod_Doctor, Cod_Pacient, Cod_Diagnoz)
	values (9, 3005, 1002, 1004)
go
Insert into Priem(Cod_Priema, Cod_Doctor, Cod_Pacient, Cod_Diagnoz)
	values (10, 3004, 1003, 1004)
go
Insert into Priem(Cod_Priema, Cod_Doctor, Cod_Pacient, Cod_Diagnoz)
	values (11, 3005, 1004, 1004)
go
Insert into Priem(Cod_Priema, Cod_Doctor, Cod_Pacient, Cod_Diagnoz)
	values (12, 3004, 1005, 1004)
go
--===========================================Retsept=================================================--
Insert into Retsept(Nr_Retsepta, Cod_Priema)
	values (5001, 1)
go
Insert into Retsept(Nr_Retsepta, Cod_Priema)
	values (5002, 2)
go
Insert into Retsept(Nr_Retsepta, Cod_Priema)
	values (5003, 3)
go
Insert into Retsept(Nr_Retsepta, Cod_Priema)
	values (5004, 4)
go
Insert into Retsept(Nr_Retsepta, Cod_Priema)
	values (5005, 5)
go
Insert into Retsept(Nr_Retsepta, Cod_Priema)
	values (5006, 6)
go
Insert into Retsept(Nr_Retsepta, Cod_Priema)
	values (5007, 7)
go
Insert into Retsept(Nr_Retsepta, Cod_Priema)
	values (5008, 8)
go
Insert into Retsept(Nr_Retsepta, Cod_Priema)
	values (5009, 9)
go
--===========================================Lechenie================================================--
Insert into Lechenie(Cod_Lekarstva, Nr_Retsepta)
	values (4001, 5001)
go
Insert into Lechenie(Cod_Lekarstva, Nr_Retsepta)
	values (4002, 5005)
go
Insert into Lechenie(Cod_Lekarstva, Nr_Retsepta)
	values (4003, 5004)
go
Insert into Lechenie(Cod_Lekarstva, Nr_Retsepta)
	values (4004, 5002)
go
Insert into Lechenie(Cod_Lekarstva, Nr_Retsepta)
	values (4005, 5003)
go
Insert into Lechenie(Cod_Lekarstva, Nr_Retsepta)
	values (4006, 5004)
go
Insert into Lechenie(Cod_Lekarstva, Nr_Retsepta)
	values (4007, 5003)
go
Insert into Lechenie(Cod_Lekarstva, Nr_Retsepta)
	values (4008, 5007)
go
--=====================================TYPE=============================================--
Create type dbo.GetPacient as Table
(
	Cod_Pacient Int NOT NULL PRIMARY KEY check(Cod_Pacient > 1000) ,
	FIO_Pacient AllNames Default('without'),
	Adress Varchar(65) Default('without'),
	age tinyint check(age < 110),
	gender bit,
	IDNP Char(13),
	Strahovka Char(15),
	Nr_Uchastka SmallInt check(Nr_Uchastka > 3000 and Nr_Uchastka < 4000)
)
--=========================#1_Âûâîä ïàöèåíòîâ ïî íîìåðó ó÷àñòêà=========================--
Declare @GetPacient as dbo.GetPacient, @NumOfUchastok Int
Set @NumOfUchastok = 3002
Insert into @GetPacient 
	Select *
		From dbo.Pacient
			where Nr_Uchastka = @NumOfUchastok
print 'Èíôîðìàöèÿ î ïàöèåíòå ïî ââåäåíîìó ó÷àñòêó : ' +  CAST(@NumOfUchastok AS NVARCHAR(5))
Select *
	From @GetPacient
--============================#2_Ñàìàÿ ÷àñòàÿ ãðóïïà ëåêàðñòâ çà äåíü-===================--
Select * From Lekarstvo
go
Select top(1) with ties Gruppa, count(Gruppa) as MaxGruppa
	From Lekarstvo
		group by Gruppa
			order by count(Gruppa) desc

Select dbo.Lekarstvo.Gruppa
	From dbo.Lekarstvo
		where dbo.Lekarstvo.Cod_Lekarstva = (
			Select dbo.Lechenie.Cod_Lekarstva
				From dbo.Lechenie
					where dbo.Lechenie.Nr_Retsepta = (
						Select dbo.Retsept.Nr_Retsepta
							From dbo.Retsept
								where dbo.Retsept.Cod_Priema = (
									Select dbo.Priem.Cod_Priema
										From dbo.Priem
											where dbo.Priem.Data_Priema >= CONVERT (date, GETDATE())
								) 
					)
		)
		group by Gruppa
			order by count(Gruppa) desc

Select dbo.Lekarstvo.Cod_Lekarstva
	From dbo.Lekarstvo
		where dbo.Lekarstvo.Cod_Lekarstva = (
			Select dbo.Lechenie.Cod_Lekarstva
				From dbo.Lechenie
					where dbo.Lechenie.Nr_Retsepta = (
						Select dbo.Retsept.Nr_Retsepta
							From dbo.Retsept
								where dbo.Retsept.Cod_Priema = 4
					)
		)
	
--============================#3_Êîëè÷åñòâî ïàöèåíòîâ çà äåíü ó äîêòîðà-===================--
Create function dbo.uf_GetPatientsByDate(@date date, @FIO_Doctor AllNames)
	returns int as
	begin
		Declare @CountOfPatient int
		Select @CountOfPatient = (Select count(dbo.Pacient.Cod_Pacient) as 'Êîë-âî ïàöèåíòîâ çà äåíü'
			From dbo.Pacient
				where dbo.Pacient.Cod_Pacient in (
					Select dbo.Priem.Cod_Pacient
						From dbo.Priem
							where (dbo.Priem.Data_Priema <= @date) and dbo.Priem.Cod_Doctor in (
								Select dbo.Doctor.Cod_Doctor
									From dbo.Doctor
										where dbo.Doctor.FIO_Doctor = @FIO_Doctor
								)
					)		
			)
		return @CountOfPatient
	end
Declare @userdate date, @FIO_Doctor AllNames
Set @userdate = '2018-10-11'
Set @FIO_Doctor = 'Kolenko Cheslav Anikitevich'
Print 'Êîëè÷åñòâî ïàöèåíòîâ çà äåíü ó ' + @FIO_Doctor + ' = ' + CAST(dbo.uf_GetPatientsByDate(@userdate, @FIO_Doctor) AS NVARCHAR(5))
--Çàïðîñ ðàáîòàåò ïðàâèëüíî. Íóæíî äîáàâèòü ëþäåé â ÁÄ. Äëÿ ïðîâåðêè äàòó ïîñòàâü <= âìåñòî =
--==============================#4_Ñàìûé ÷àñòûé äèàãíîç çà äåíü=========================--	
Create function dbo.uf_GetFrequentDiagnosis(@date date)
	returns varchar(100) as
	begin
		Declare @NameOfDiagnoz varchar(100)
		Select @NameOfDiagnoz = ( Select top(1) with ties dbo.DocDiagnoz.Diagnoz
			From dbo.Priem inner Join dbo.DocDiagnoz
				on dbo.Priem.Cod_Diagnoz = dbo.DocDiagnoz.Cod_Diagnoz
					where (dbo.Priem.Data_Priema = @date) 
						group by dbo.DocDiagnoz.Diagnoz
							order by count(dbo.DocDiagnoz.Diagnoz) desc
		)
		return @NameOfDiagnoz
	end
Declare @userdate date
Set @userdate = '2018-10-11'
print 'Hello ' + dbo.uf_GetFrequentDiagnosis(@userdate)
--==============================#5_Ñêîëüêî äåòåé, ïîæèëûõ îáðàòèëîñü â ïîëåêëèíèêó=====--
Create function dbo.uf_GetCountPacientByCertainAge(@agetype tinyint)
	returns tinyint as
	begin
		Declare @CountPatient tinyint
		Set @agetype = 2
		if(@agetype = 1)
		begin
			Select @CountPatient = count(dbo.Priem.Cod_Priema)
				From dbo.Priem
					where dbo.Priem.Cod_Pacient in (
						Select dbo.Pacient.Cod_Pacient
							From dbo.Pacient
								where dbo.Pacient.age < 18
					) 
		end
		else if (@agetype = 2)
		begin
			Select @CountPatient = count(dbo.Priem.Cod_Priema)
				From dbo.Priem
					where dbo.Priem.Cod_Pacient in (
						Select dbo.Pacient.Cod_Pacient
							From dbo.Pacient
								where (dbo.Pacient.age >= 18) and (dbo.Pacient.age < 65)
					)
		end
		else
		begin
			Select @CountPatient = count(dbo.Priem.Cod_Priema)
				From dbo.Priem
					where dbo.Priem.Cod_Pacient in (
						Select dbo.Pacient.Cod_Pacient
							From dbo.Pacient
								where dbo.Pacient.age < 18
					) 
		end
		return @CountPatient
	end
Declare @agetype tinyint
Set @agetype = 2
Print 'Êîëè÷åñòâî ÷åëîâåê çà äåíü ' + ' = ' + CAST(dbo.uf_GetCountPacientByCertainAge(@agetype) AS NVARCHAR(5))
--======================================Multi Statement================================================--\
-- Êîëè÷åñòâî ïàöèåíòîâ ó êàæäîãî äîêòîðà çà îïðåäåëåííóþ äàòó
drop function dbo.uf_GetPatientByDate
Create function dbo.uf_GetPatientByDate(@date date)
	returns Table as
	return (
		Select dbo.Doctor.FIO_Doctor, count(dbo.Priem.Cod_Pacient) as CountOfPacient
			From dbo.Priem inner Join dbo.Doctor
				on dbo.Doctor.Cod_Doctor = dbo.Priem.Cod_Doctor
					where dbo.Priem.Data_Priema = @date
						group by dbo.Doctor.FIO_Doctor
		)
Select * From dbo.uf_GetPatientByDate('2018-10-19')
go

--======================================================================================--
Create view GetPatientView as
	Select dbo.Priem.Cod_Doctor, dbo.Priem.Cod_Pacient, dbo.Priem.Data_Priema
		From Priem
drop function dbo.uf_GetPatientByDate
Create function dbo.uf_GetPatientByDate(@date date)
	returns @PatientTable Table
	(
		FIO_Doctor AllNames,
		NumOfPatient smallint
	) as
	begin
		Insert into @PatientTable
			Select dbo.Doctor.FIO_Doctor, count(dbo.GetPatientView.Cod_Pacient) as CountOfPacient
				From dbo.Doctor inner Join dbo.GetPatientView
					on dbo.Doctor.Cod_Doctor = dbo.GetPatientView.Cod_Doctor
						where dbo.GetPatientView.Data_Priema = @date
							group by dbo.Doctor.FIO_Doctor
		return
	end
Select * From dbo.uf_GetPatientByDate('2018-10-19')
go


--Declare @time time
--Set @time = sysdatetime()
--Select @time
--Set @time = @time + CAST(0.0007 as datetime)
--Select @time

--Select dbo.Priem.Time_Priema + CAST(100 AS time)  From Priem

--=========================================================================================--
--Ìåíÿåì âðåìÿ ïðèåìà ïî äàòå è èìåíè Äîêòîðà. + Êîë-âî äîáàâëåííîãî âðåìåíè

Create procedure ChangeTimeByDateAndFioDoctor @Fio_Doctor AllNames, @date date, @addtime int as
begin
	begin transaction
	Update dbo.Priem
		Set dbo.Priem.Time_Priema = dbo.Priem.Time_Priema + CAST(0.0007*@addtime as datetime)
			where (dbo.Priem.Data_Priema = @date) and dbo.Priem.Cod_Doctor in (
				Select dbo.Doctor.Cod_Doctor 
					From dbo.Doctor
						where dbo.Doctor.FIO_Doctor = @Fio_Doctor
			)
	if @@ERROR <> 0
		RollBack
	Commit
end
drop procedure ChangeTimeByDateAndFioDoctor
execute ChangeTimeByDateAndFioDoctor 'Dudnik Artem Bogdanovich', '2018-10-19' , 10
Select * From Priem