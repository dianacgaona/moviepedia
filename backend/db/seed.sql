DROP DATABASE IF EXISTS moviepedia;
CREATE DATABASE moviepedia;

\c moviepedia;

CREATE TABLE genres(
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL
);

CREATE TABLE movies(
  id SERIAL PRIMARY KEY,
  title VARCHAR NOT NULL UNIQUE,
  genre_id INT REFERENCES genres(id),
  img_url VARCHAR NOT NULL
);

CREATE TABLE ratings (
  id SERIAL PRIMARY KEY,
  stars INT NOT NULL,
  CONSTRAINT stars_range_check
  CHECK (stars >= 1 and stars <= 5),
  movie_id INT REFERENCES movies(id)
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  comment TEXT NOT NULL,
  movie_id INT REFERENCES movies(id)
);


INSERT INTO genres ( name) VALUES ('comedy'), ('fiction'), ('drama'), ('action'), ('romance');

INSERT INTO movies (title, genre_id, img_url) VALUES
('Babys Day Out', 1, 'https://3.bp.blogspot.com/-0RNr7cqgh8Q/V5xPmsrsT_I/AAAAAAAAPCo/XOd7TojhO9A2fRwC0zRHplTqgqAKYqMDQCLcB/s1600/bdo1.jpg'), ('Deadpool', 1, 'https://www.themarysue.com/wp-content/uploads/2015/12/deadpool-international-poster-bad-ass-smart-ass-great-ass.jpeg'), ('The Shape of Water', 2, 'https://i.pinimg.com/originals/e4/fe/c6/e4fec62a6f8b46466cd4b5004d24e5c6.jpg'),
 ('The Last Mimzy', 2, 'https://static.tvgcdn.net/feed/1/190/thumbs/118830190_1300x1733.jpg'), ('Guten Tag, Ramon', 3, 'https://m.media-amazon.com/images/M/MV5BMjIzMTgyMzg3Nl5BMl5BanBnXkFtZTgwNjA2MDU2MjE@._V1_.jpg'), ('Girl on a Bicycle', 3, 'https://m.media-amazon.com/images/M/MV5BMjM3MTk0ODA1Nl5BMl5BanBnXkFtZTgwNzg1NDAxMDE@._V1_.jpg'), ('Guardians of the Galaxy', 4, 'https://m.media-amazon.com/images/M/MV5BMTg2MzI1MTg3OF5BMl5BanBnXkFtZTgwNTU3NDA2MTI@._V1_.jpg'), ('Rocky', 4, 'https://ae01.alicdn.com/kf/HTB1eqtJOpXXXXbzXXXXq6xXFXXXg/Rocky-Balboa-Movie-Poster-High-Quality-canvas-oil-painting-printed-Decorative-gift-pictures.jpg'), ('Silver Linings Playbook', 5, 'http://untoldbook.com/wp-content/uploads/2018/08/91xIJBAxUcL.jpg'), ('The Big Sick', 5, 'https://images-na.ssl-images-amazon.com/images/I/81QzLI7aolL._SL1500_.jpg');

INSERT INTO ratings (stars, movie_id) VALUES (4, 1), (4.5, 1), (4, 2), (5, 2), (4, 3), (4.5, 3), (3.5, 4), (4.3, 4), (5, 5), (5, 5), (4, 6), (4.5, 6), (4.5, 7), (5, 7), (5, 8), (4, 8), (3.5, 9), (3, 9), (5, 10), (4, 10);

INSERT INTO comments (comment, movie_id) VALUES ('What a great movie! I could not stop laughing and the baby is super cute!', 1), ('Great movie', 1), ('I am not a big fan of superhero movies, but Deadpool is just too funny, I cannot help but love his humor!', 2), ('I have been waiting for Marvel to come out with a movie for Deadpool forever, and man the wait was worth it!', 2), ('I did not expect the movie to be this good! I was glued to it! Loved the story plot and the characters. Then again, any movie by Guillermo Del Toro is a good movie', 3), ('I watched this movie during my flight. Quite an interesting idea and heartwarming to a certain degree', 4), ('It was great to see a movie different from the mainstream movies', 5), ('If you are interested in languages, this is the movie for you. Although a great part is in English, it also has Italian, French and German. Quite funny as well!', 6), ('This was one of the movies when Netflix had good stuff in the Foreign Films group.', 6), ('I am groot!', 7), ('I have watched part one and two but like everyone says, the first one is always the best!', 7), ('Rocky has helped me grow through my lowest points. A great inspirational movie', 8), ('I fell in love with this movie because of the story behind its production. A lot of respect for mr. Stallone.', 8), ('The movie was quite slow at the beginning, but what a great segue!', 9), ('I loved it! Loved it for sure. We need more movies like this where the characters come from totally different backgrounds!', 10);
