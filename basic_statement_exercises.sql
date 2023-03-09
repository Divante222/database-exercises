-- Use the albums_db database.
use albums_db;
 


-- What is the primary key for the albums table?
SELECT * FROM albums;
-- the primary key is id

-- What does the column named 'name' represent?
-- it represents the song or album names

-- What do you think the sales column represents?
-- how many millions of albums or cd's were sold

-- Find the name of all albums by Pink Floyd.
select * from albums
where artist = 'Pink Floyd';

-- What is the year Sgt. Pepper's Lonely Hearts Club Band was released?
select name, release_date from albums
where name = "Sgt. Pepper's Lonely Hearts Club Band";
-- 1967

-- What is the genre for the album Nevermind?
select name, genre from albums
where name = 'Nevermind';
-- Grunge, Alternative rock

-- Which albums were released in the 1990s?
select name from albums
where release_date between 1990 and 1999;
/* 'The Bodyguard'
'Jagged Little Pill'
'Come On Over'
'Falling into You'
'Let\'s Talk About Love'
'Dangerous'
'The Immaculate Collection'
'Titanic: Music from the Motion Picture'
'Metallica'
'Nevermind'
'Supernatural'
*/

-- Which albums had less than 20 million certified sales?
select name, sales from albums
where sales < 20.0;
/* 'Grease: The Original Soundtrack from the Motion Picture','14.4'
'Bad','19.3'
'Sgt. Pepper\'s Lonely Hearts Club Band','13.1'
'Dirty Dancing','17.9'
'Let\'s Talk About Love','19.3'
'Dangerous','16.3'
'The Immaculate Collection','19.4'
'Abbey Road','14.4'
'Born in the U.S.A.','19.6'
'Brothers in Arms','17.7'
'Titanic: Music from the Motion Picture','18.1'
'Nevermind','16.7'
'The Wall','17.6'
*/
use albums_db;
