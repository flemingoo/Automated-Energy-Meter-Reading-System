USE flemmsDb;
GO
CREATE TABLE energyDatabase
(
MeterMobNum decimal NOT NULL PRIMARY KEY,
BillingMobNum decimal NOT NULL,
CustomerName nvarchar(50) NOT NULL,
CustomerAddr nvarchar(50) NOT NULL,
PrevReading bigint NOT NULL,
CurReading bigint NOT NULL,
Units int NOT NULL,
BillAmount float NOT NULL
)