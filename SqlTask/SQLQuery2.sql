create database Netflix
use Netflix
create table Imdb(
Id int  primary key identity,
Score int 
)
create table Genres(
Id int  primary key identity,
[Name] nvarchar(25) not null
)
create table Movies(
Id int  primary key identity,
[Name] nvarchar(20) not null,
ImdbId int foreign key references Imdb(Id)
)
create table Subgenres(
Id int  primary key identity,
[Name] nvarchar(50) not null,
GenreId int references Genres(Id)
)
create table MovieGenres(
Id int  primary key identity,
MovieId int references Movies(Id),
GenreId int references Genres(Id)
)
select * from Genres
insert into Genres values ('Horror'),('Action'),('Sci-fi')
insert into Subgenres values ('Dark Fantasy',1),('Action comedy',2),('Biopunk',3)
select * from Subgenres
insert  into Imdb values ('10'),('5'),('7')
select * from Imdb
insert into Movies values('Elysium',4),('Family plan',3),('The Witch',5)

select Subgenres.Id,Subgenres.Name,Genres.Id,Genres.Name from Subgenres
inner join Genres
on
Subgenres.Id=Genres.Id
select Imdb.Id,Imdb.Score,Movies.Id,Movies.Name from Imdb
inner join Movies
on 
Imdb.Id=Movies.Id
Select Imdb.Id,Imdb.Score,MovieGenres.MovieId,MovieGenres.GenreId,MovieGenres.Id from Imdb
inner join MovieGenres
on
Imdb.Id=MovieGenres.Id