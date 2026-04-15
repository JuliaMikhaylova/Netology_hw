/* --- Задание 2.1 Название и продолжительность самого длительного трека --- */
select track_name, concat(div(duration, 60), ':', mod(duration, 60)) as time
from track
where duration = (select max(duration) from track);

/* --- Задание 2.2 Название треков, продолжительность которых не менее 3,5 минут --- */
select track_name
from track
where duration >= 210;

/* --- Задание 2.3 Названия сборников, вышедших в период с 2018 по 2020 год включительно --- */
select collection_title
from collection
where year_release between '2018' and '2020';

/* --- Задание 2.4 Исполнители, чьё имя состоит из одного слова --- */
select musician_name 
from musician
where musician_name not like '% %';

/* --- Задание 2.5 Название треков, которые содержат слово «мой» или «my» --- */
select track_name
from track
where track_name like '%мой%' or track_name like '%my%';


/* --- Задание 3.1 Количество исполнителей в каждом жанре --- */
select g.genre_name, count(m.id) as count
from genre g 
left outer join musiciangenre m on g.genre_id = m.genre_id 
group by g.genre_name;

/* --- Задание 3.2 Количество треков, вошедших в альбомы 2019–2020 годов --- */
select count(t.track_id) as count_track
from album a 
left outer join track t on a.album_id = t.album 
where a.year_release between '2019' and '2020';

/* --- Задание 3.3 Средняя продолжительность треков по каждому альбому --- */
select b.album_title, concat(div(a.avg_time,60), ':', mod(a.avg_time, 60)) as avg_time_track
from 
(select album, round(avg(duration),0) as avg_time
from track
group by album) a
left outer join album b on a.album = b.album_id;

/* --- Задание 3.4 Все исполнители, которые не выпустили альбомы в 2020 году --- */
select m.musician_name 
from musician m 
left outer join albummusician am on m.musician_id = am.musician_id 
left outer join album a on am.album_id = a.album_id 
where a.year_release <> '2020' or am.album_id is null;

/* --- Задание 3.5 Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами) --- */
select distinct c.collection_title 
from collection c 
left outer join collectiontrack ct on c.collection_id = ct.collection_id 
left outer join track t on ct.track_id = t.track_id 
left outer join albummusician a on t.album = a.album_id 
left outer join musician m on a.musician_id = m.musician_id 
where m.musician_name = 'Bruce Springsteen';


/* --- Задание 4.1 Названия альбомов, в которых присутствуют исполнители более чем одного жанра --- */
select a.album_title 
from album a 
left outer join albummusician am on a.album_id = am.album_id 
left outer join
(select musician_id, count(id) as count from musiciangenre group by musician_id) c on am.musician_id = c.musician_id 
where c.count > 1;

/* --- Задание 4.2 Наименования треков, которые не входят в сборники --- */
select t.track_name 
from track t 
left outer join collectiontrack c on t.track_id = c.track_id 
where c.id is null;

/* --- Задание 4.3 Исполнитель или исполнители, написавшие самый короткий по продолжительности трек --- */
select distinct  m.musician_name 
from musician m 
left outer join albummusician a on m.musician_id = a.musician_id 
left outer join track t on a.album_id = t.album 
where t.duration = (select min(duration) from track);

/* --- Задание 4.4 Названия альбомов, содержащих наименьшее количество треков --- */
select a.album_title, c.count 
from album a 
left outer join 
(select album, count(track_id) as count
from track
group by album) c on a.album_id = c.album 
where c.count = (select min(a.count) from (select album, count(track_id) as count from track group by album) a);



