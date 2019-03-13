const express = require('express');
const router = express.Router();

const {
  getMoviesAndRatings,
  getInfoForOneMovie,
  getMoviesByGenre,
} = require('../db/queries/movieQueries.js');

router.get('/', getMoviesAndRatings);
router.get('/:id', getInfoForOneMovie);
router.get('/genre/:id', getMoviesByGenre);

module.exports = router;
