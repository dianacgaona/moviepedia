import * as moviesApi from '../utilities/utilMovies.js';

export let RECEIVE_MOVIES = 'RECEIVE_MOVIES';

export const receivedMovies = movies => {
  return {
    type: RECEIVE_MOVIES,
    movies: movies,
  };
};

export const fetchAllMovieswithRatings = dispatch => {
  return moviesApi.fetchAllMovieswithRatings
    .then(res => {
      return dispatch(receivedMovies(res.data.movies));
    })
    .catch(err => {
      console.log(err);
    });
};
