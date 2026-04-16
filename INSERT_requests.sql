--- Жанры ---
insert into genre values(1, 'Pop');
insert into genre values(2, 'Rock');
insert into genre values(3, 'Jazz');
insert into genre values(4, 'Classical');
insert into genre values(5, 'Disco');
insert into genre values(6, 'Metal');
insert into genre values(7, 'Folk');
insert into genre values(8, 'Soul');

--- Исполнители ---
insert into musician values(1, 'Madonna');
insert into musician values(2, 'Metallica');
insert into musician values(3, 'Stevie Wonder');
insert into musician values(4, 'Barbra Streisand');
insert into musician values(5, 'Nirvana');
insert into musician values(6, 'Dido');
insert into musician values(7, 'Bruce Springsteen');
insert into musician values(8, 'Pet Shop Boys');
insert into musician values(9, 'Sade');

--- Альбомы ---
insert into album values(1, 'Walls', '2018');
insert into album values(2, 'Hotspot', '2020');
insert into album values(3, 'Still on My Mind', '2019');
insert into album values(4, 'Letter to You', '2020');
insert into album values(5, 'Promise', '1985');
insert into album values(6, 'Introspective', '1988');
insert into album values(7, 'Testing', '2025');

--- Связь жанра и исполнителя ---
insert into musiciangenre values(1, 1, 1);
insert into musiciangenre values(2, 6, 2);
insert into musiciangenre values(3, 1, 3);
insert into musiciangenre values(4, 3, 3);
insert into musiciangenre values(5, 8, 3);
insert into musiciangenre values(6, 1, 4);
insert into musiciangenre values(7, 2, 5);
insert into musiciangenre values(8, 1, 6);
insert into musiciangenre values(9, 7, 6);
insert into musiciangenre values(10, 2, 7);
insert into musiciangenre values(11, 1, 8);
insert into musiciangenre values(12, 1, 9);
insert into musiciangenre values(13, 8, 8);

--- Связь альбома и исполнителя ---
insert into albummusician values(1, 1, 4);
insert into albummusician values(2, 2, 8);
insert into albummusician values(3, 3, 6);
insert into albummusician values(4, 4, 7);
insert into albummusician values(5, 5, 9);
insert into albummusician values(6, 6, 8);
insert into albummusician values(7, 7, 2);

--- Треки альбомов ---
insert into track values(1, 'What''s on my mind', 316, 1);
insert into track values(2, 'Don''t lie to me', 237, 1);
insert into track values(3, 'Imagine / What a wonderful world', 320, 1);
insert into track values(4, 'Walls', 234, 1);
insert into track values(5, 'Lady liberty', 232, 1);
insert into track values(6, 'What the world needs now', 276, 1);
insert into track values(7, 'Better angels', 248, 1);
insert into track values(8, 'Love''s never wrong', 246, 1);
insert into track values(9, 'The rain will fall', 282, 1);
insert into track values(10, 'Take care of this house', 250, 1);
insert into track values(11, 'Happy days are here again', 233, 1);

insert into track values(12, 'Will-o-the-wisp', 267, 2);
insert into track values(13, 'You are the one', 215, 2);
insert into track values(14, 'Happy people', 231, 2);
insert into track values(15, 'Dreamland', 208, 2);
insert into track values(16, 'Hoping for a miracle', 300, 2);
insert into track values(17, 'I don''t wanna', 242, 2);
insert into track values(18, 'Monkey business', 248, 2);
insert into track values(19, 'Only the dark', 218, 2);
insert into track values(20, 'Burning the heather', 327, 2);
insert into track values(21, 'Wedding in Berlin', 279, 2);

insert into track values(22, 'Hurricanes', 317, 3);
insert into track values(23, 'Give you up', 201, 3);
insert into track values(24, 'Hell after this', 207, 3);
insert into track values(25, 'You don''t need a god', 211, 3);
insert into track values(26, 'Take you home', 305, 3);
insert into track values(27, 'Some kind of love', 282, 3);
insert into track values(28, 'Still on my mind', 184, 3);
insert into track values(29, 'Mad love', 172, 3);
insert into track values(30, 'Walking by', 271, 3);
insert into track values(31, 'Friends', 203, 3);
insert into track values(32, 'Chances', 211, 3);
insert into track values(33, 'Have to stay', 163, 3);

insert into track values(34, 'One minute you''re her', 177, 4);
insert into track values(35, 'Letter to you', 295, 4);
insert into track values(36, 'Burnin'' train', 243, 4);
insert into track values(37, 'Janey needs a shooter', 409, 4);
insert into track values(38, 'Last man standing', 245, 4);
insert into track values(39, 'The power of prayer', 216, 4);
insert into track values(40, 'House of a thousand guitars', 270, 4);
insert into track values(41, 'Rainmaker', 296, 4);
insert into track values(42, 'If I was the priest', 410, 4);
insert into track values(43, 'Ghosts', 354, 4);
insert into track values(44, 'Song for orphans', 373, 4);
insert into track values(45, 'I''ll see you in my dreams', 209, 4);

insert into track values(46, 'Is it a crime', 381, 5);
insert into track values(47, 'The sweetest taboo', 277, 5);
insert into track values(48, 'War of the hearts', 407, 5);
insert into track values(49, 'You''re not the man', 310, 5);
insert into track values(50, 'Jezebel', 329, 5);
insert into track values(51, 'Mr Wrong', 171, 5);
insert into track values(52, 'Punch drunk', 325, 5);
insert into track values(53, 'Never as good as the first time', 299, 5);
insert into track values(54, 'Fear', 249, 5);
insert into track values(55, 'Tar baby', 238, 5);
insert into track values(56, 'Maureen', 260, 5);

insert into track values(57, 'Left to my own devices', 497, 6);
insert into track values(58, 'I want a dog', 375, 6);
insert into track values(59, 'Domino dancing', 460, 6);
insert into track values(60, 'I''m not scared', 445, 6);
insert into track values(61, 'Always on my mind / In my house', 524, 6);
insert into track values(62, 'It''s alright', 543, 6);

insert into track values(63, 'My own', 201, 7);
insert into track values(64, 'own my', 202, 7);
insert into track values(65, 'My', 203, 7);
insert into track values(66, 'Mystery', 204, 7);
insert into track values(67, 'by myself', 205, 7);
insert into track values(68, 'bemy self', 204, 7);
insert into track values(69, 'myself by', 203, 7);
insert into track values(70, 'by myself by', 202, 7);
insert into track values(71, 'Academy', 201, 7);
insert into track values(72, 'premyle', 200, 7);
insert into track values(73, 'My academy', 201, 7);
insert into track values(74, 'Мой ласковый и нежный зверь', 201, 7);
insert into track values(75, 'Мойдодыр', 201, 7);

--- Сборники ---
insert into collection values(1, 'The best of 2000', 2000);
insert into collection values(2, 'The best of 2019', 2019);
insert into collection values(3, 'Hits of 2020', 2020);
insert into collection values(4, 'Mix of 2021', 2021);
insert into collection values(5, 'The best of 2021', 2021);

--- Связь сборника и трека ---
insert into collectiontrack values(1, 1, 46);
insert into collectiontrack values(2, 1, 48);
insert into collectiontrack values(3, 1, 53);
insert into collectiontrack values(4, 1, 56);
insert into collectiontrack values(5, 2, 23);
insert into collectiontrack values(6, 2, 3);
insert into collectiontrack values(7, 2, 29);
insert into collectiontrack values(8, 2, 7);
insert into collectiontrack values(9, 2, 32);
insert into collectiontrack values(10, 2, 9);
insert into collectiontrack values(11, 2, 26);
insert into collectiontrack values(12, 3, 14);
insert into collectiontrack values(13, 3, 36);
insert into collectiontrack values(14, 3, 17);
insert into collectiontrack values(15, 3, 39);
insert into collectiontrack values(16, 3, 42);
insert into collectiontrack values(17, 4, 3);
insert into collectiontrack values(18, 4, 15);
insert into collectiontrack values(19, 4, 26);
insert into collectiontrack values(20, 4, 38);
insert into collectiontrack values(21, 4, 48);
insert into collectiontrack values(22, 4, 6);
insert into collectiontrack values(23, 4, 41);
insert into collectiontrack values(24, 4, 29);
insert into collectiontrack values(25, 4, 14);
insert into collectiontrack values(26, 5, 35);
insert into collectiontrack values(27, 5, 14);
insert into collectiontrack values(28, 5, 38);
insert into collectiontrack values(29, 5, 18);
insert into collectiontrack values(30, 5, 29);
insert into collectiontrack values(31, 5, 27);
insert into collectiontrack values(32, 5, 20);

