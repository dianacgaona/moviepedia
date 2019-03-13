const { db } = require('../index.js');

const getMoviesAndRatings = (req, res, next) => {
  db.any(
    'SELECT movies.id, title, img_url, name AS genre, AVG(ratings.stars) AS Average_Ratings FROM movies JOIN genres ON movies.genre_id = genres.id JOIN ratings ON movies.id = ratings.movie_id GROUP BY movies.id, title, img_url, genre'
  )
    .then(movies => {
      res.status(200).json({
        status: 'success',
        movies: movies,
        message: 'Movies and ratings!',
      });
    })
    .catch(err => {
      return next(err);
    });
};

const getMoviesByGenre = (req, res, next) => {
  let movieId = parseInt(req.params.id);
  db.any('SELECT * FROM movies WHERE genre_id=$1', [movieId])
    .then(movies => {
      res.status(200).json({
        status: 'succes',
        movies: movies,
        message: 'Movies by Genre',
      });
    })
    .catch(err => {
      return next(err);
    });
};

const getInfoForOneMovie = (req, res, next) => {
  let movieId = parseInt(req.params.id);
  db.one(
    'SELECT movies.id, title, img_url, genre_id, ARRAY_AGG(comment) AS comments FROM movies JOIN comments ON movies.id=comments.movie_id WHERE movies.id=$1 GROUP BY movies.id, title, img_url, genre_id ',
    [movieId]
  )
    .then(movie => {
      res.status(200).json({
        status: 'success',
        movie: movie,
        message: 'Info for movie received',
      });
    })
    .catch(err => {
      return next(err);
    });
};

module.exports = {
  getMoviesAndRatings,
  getMoviesByGenre,
  getInfoForOneMovie,
};
