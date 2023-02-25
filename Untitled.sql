CREATE TABLE `albums` (
  `album_ID` serial PRIMARY KEY AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `artist` text NOT NULL,
  `released` DATE NOT NULL
);

CREATE TABLE `tracks_albums` (
  `id` serial PRIMARY KEY AUTO_INCREMENT,
  `album_ID` integer,
  `track_ID` integer
);

CREATE TABLE `tracks` (
  `track_ID` serial PRIMARY KEY AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `artist` text NOT NULL,
  `length_time` time NOT NULL,
  `track_URL` VARCHAR(1000) NOT NULL
);

ALTER TABLE `tracks_albums` ADD FOREIGN KEY (`album_ID`) REFERENCES `albums` (`album_ID`);

ALTER TABLE `tracks_albums` ADD FOREIGN KEY (`track_ID`) REFERENCES `tracks` (`track_ID`);
