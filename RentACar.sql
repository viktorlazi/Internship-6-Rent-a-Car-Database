CREATE DATABASE RentACar

USE RentACar

CREATE TABLE Vehicles(
    Id int IDENTITY(1,1) PRIMARY KEY,
    VehicleType varchar(30) NOT NULL,
    VehicleBrand varchar(30) NOT NULL,
    VehicleModel varchar(30) NOT NULL,
    VehicleColor varchar(30) NOT NULL,
    VehicleMileage int NOT NULL,
    CostForHalfDay int NOT NULL CHECK (CostForHalfDay > 0),
    CostInSummerMultiplier float NOT NULL CHECK (CostInSummerMultiplier > 0)
)
CREATE TABLE Registrations(
    VehicleId int FOREIGN KEY REFERENCES Vehicles(Id),
	RegistrationString nvarchar (20) PRIMARY KEY,
	DateOfRegistration Datetime2 NOT NULL,
	DateOfExpiry Datetime2 NOT NULL
)
CREATE TABLE Workers(
    Id int IDENTITY(1,1) PRIMARY KEY,
    FirstName varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL
)
CREATE TABLE Rents(
    Id int IDENTITY(1,1) PRIMARY KEY,
    WorkerId int FOREIGN KEY REFERENCES Workers(Id),
    VehicleId int FOREIGN KEY REFERENCES Vehicles(Id),
    DateOfRent datetime2 NOT NULL,
    RentDuration float NOT NULL,
    ClientName varchar(20),
    ClientSurname varchar(20),
    ClientOIB varchar(13) NOT NULL,
    ClientDateOfBirth datetime2,
    ClientCreditCard varchar(30) NOT NULL,
    ClientDriverLicence varchar(30) NOT NULL
)

--nerazumin se u aute pa mi je tesko procijenit cijenu :D
INSERT INTO Vehicles  
(VehicleType, VehicleBrand, VehicleModel, VehicleColor, VehicleMileage, CostForHalfDay, CostInSummerMultiplier)
VALUES
('Car', 'Peugeot', '206', 'Silver', 200000, 70, 1.2),
('Car', 'Peugeot', '307', 'Red', 140000, 100, 1.3),
('Car', 'Mercedes', 'Benz', 'Black', 50000, 370, 1.5),
('Car', 'Alfa Romeo', 'X', 'Yellow', 2000, 170, 1.2),
('Car', 'Audi', '2012', 'Silver', 10650, 340, 1.2),
('Car', 'Ford', 'Mustang', 'Red', 23000, 700, 1.5),
('Car', 'Dacia', '111', 'Green', 21000, 100, 1.2),
('Car', 'Porche', 'P', 'Green', 101200, 600, 1.2),
('Car', 'Opel', 'Astra', 'Black', 75600, 100, 1.2),
('Car', 'Peugeot', '206', 'White', 10000, 70, 1.2),
('Car', 'Audi', '2', 'White', 20200, 300, 1.1),
('Car', 'Peugeot', '206', 'Red', 3400, 75, 1.5),
('Car', 'Peugeot', '207', 'Blue', 1000, 85, 1.2),
('Motorcycle', 'Suzuki', '100', 'Blue', 0, 200, 1.0),
('Motorcycle', 'Suzuki', '300', 'Green', 1400, 350, 1.5),
('Motorcycle', 'Herley', 'New', 'Black', 50000, 270, 1.4),
('Motorcycle', 'Yamaha', '2020', 'Silver', 10500, 170, 1.4),
('Truck', 'BMW', 'Truck Model X', 'Yellow', 11000, 670, 1.6),
('Truck', 'BMW', 'Truck Model Y', 'Purple', 130000, 870, 1.6),
('Truck', 'Mercedes', 'Benz', 'Black', 60500, 1070, 1.6)

INSERT INTO Workers VALUES
('Robert', 'Robić'),
('Mišo', 'Smith'),
('Ana', 'Ribić'),
('Miro', 'Mirić'),
('Slobodan', 'Slobić')

INSERT INTO Registrations VALUES
(1, 'ST-005-SA', '2019-05-01', '2020-05-01'),
(2, 'ST-111-RE', '2019-05-01', '2020-05-01'),
(3, 'ST-457-SA', '2019-01-10', '2020-01-10'),
(4, 'ST-005-TT', '2019-04-01', '2020-04-01'),
(5, 'ST-455-OR', '2019-05-01', '2020-05-01'),
(6, 'ST-344-FG', '2019-05-01', '2020-05-01'),
(7, 'ZG-246-ES', '2019-05-01', '2020-05-01'),
(8, 'ZG-678-AD', '2019-05-01', '2020-05-01'),
(9, 'ZG-322-GD', '2019-05-01', '2020-05-01'),
(10, 'ZG-432-JL', '2019-05-01', '2020-05-01'),
(11, 'ZG-865-OP', '2019-05-01', '2020-05-01'),
(12, 'ZG-3000-SG', '2019-05-01', '2020-05-01'),
(13, 'PU-444-VB', '2020-03-01', '2021-09-01'),
(14, 'PU-344-RT', '2020-03-01', '2021-09-01'),
(15, 'PU-435-FG', '2020-03-01', '2021-09-01'),
(16, 'PU-222-RR', '2020-03-01', '2021-09-01'),
(17, 'PU-030-SE', '2020-06-01', '2021-12-01'),
(18, 'ZG-1430-GU', '2020-06-01', '2021-12-01'),
(19, 'ZG-342-JK', '2020-06-01', '2021-12-01'),
(20, 'ZG-111-TZ', '2020-03-01', '2021-03-01')

INSERT INTO Rents
(
WorkerId, VehicleId, DateOfRent, RentDuration,
ClientName, ClientSurname, ClientOIB, ClientDateOfBirth, ClientCreditCard, ClientDriverLicence
)
VALUES -- vozila 1 do 12 istekla registracija
(1, 13, GETDATE(), 0.5, 'Gospodin', 'Kliještić', '3249082340', '1955-05-23', '3248902390', '23423432'),
(1, 14, GETDATE(), 1.5, 'Gospodin', 'Mrkonja', '1231234554', '1955-05-23', '3248902390', '23423432'),
(1, 15, GETDATE(), 0.5, 'Gospodin', 'Strijelić', '6575675675', '1955-05-23', '3248902390', '23423432'),
(1, 16, GETDATE(), 0.5, 'Žarko', 'Galić', '3454354353', '1955-05-23', '3248902390', '23423432'),
(2, 17, GETDATE(), 2.5, 'Maja', 'Erikson', '3249082340', '1955-05-23', '3248902390', '23423432'),
(2, 18, GETDATE(), 1.5, 'Vicko', 'Jović', '3249082340', '1955-05-23', '3248902390', '23423432'),
(2, 19, GETDATE(), 1, 'Tea', 'Ribar', '23523523325', '1955-05-23', '3248902390', '23423432'),
(2, 20, GETDATE(), 2, 'Lena', 'Lučić', '5235235235', '1955-05-23', '3248902390', '23423432'),
(3, 13, '2021-01-02', 1.5, 'Žan', 'Pijer', '553325235', '1955-05-23', '3248902390', '23423432'),
(3, 14, '2021-01-02', 1.5, 'Kupac', 'Kupčić', '12321312312', '1955-05-23', '3248902390', '23423432'),
(3, 15, '2021-01-02', 2, 'Relja', 'Kliještić', '123123123', '1955-05-23', '3248902390', '23423432'),
(3, 16, '2021-01-02', 7, 'Grgo', 'Agat', '657674573', '1955-05-23', '3248902390', '23423432'),
(4, 17, '2021-01-02', 2, 'Enis', 'Bešlagić', '346346436', '1955-05-23', '3248902390', '23423432'),
(4, 18, '2021-01-02', 5, 'Damir', 'Fazlinović', '324234234', '1955-05-23', '3248902390', '23423432'),
(4, 19, '2021-01-02', 1, 'Franjo', 'Papa', '4564567657', '1955-05-23', '3248902390', '23423432'),
(4, 20, '2021-01-11', 2, 'Emir', 'Miraz', '331231231', '1955-05-23', '3248902390', '23423432'),
(5, 13, '2021-02-22', 1.5, 'Mike', 'Smith', '54645645', '1955-05-23', '3248902390', '23423432'),
(5, 14, '2021-02-22', 2, 'Calvin', 'Klein', '23423423423', '1955-05-23', '3248902390', '23423432'),
(5, 15, '2021-02-12', 2, 'Leonardo', 'Tyson', '3213123123', '1955-05-23', '3248902390', '23423432'),
(5, 16, '2021-02-12', 3, 'Mia', 'Slikar', '6575675677', '1955-05-23', '3248902390', '23423432')


--Dohvatiti sva vozila kojima je istekla registracija
select * from Vehicles
join Registrations on Registrations.VehicleId = Vehicles.Id
where Registrations.DateOfExpiry <= GETDATE()


USE [master]
DROP DATABASE RentACar