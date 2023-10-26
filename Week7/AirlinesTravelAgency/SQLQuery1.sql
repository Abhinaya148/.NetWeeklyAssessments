create table Passenger
(
PassengerId int primary key not null,
ReservationId int foreign key references Reservations(ReservationId),
PassengerName varchar(100) 
);

 

drop table Passenger;